// ignore: depend_on_referenced_packages
import 'package:aptos_api_dart/aptos_api_dart.dart';
// ignore: depend_on_referenced_packages, implementation_imports
import 'package:built_collection/src/list.dart';
// import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
// ignore: depend_on_referenced_packages
import 'package:http/retry.dart';
import 'package:intl/intl.dart';

const url = "https://fullnode.devnet.aptoslabs.com/v1/";

// Transaction Data
final api = AptosApiDart(basePathOverride: url).getTransactionsApi();
final api2 = AptosApiDart(basePathOverride: url).getAccountsApi();

final client = RetryClient(http.Client());

// ignore: camel_case_types
class Transaction_ {
  final List<Map<String, dynamic>> response;

  const Transaction_({required this.response});

  factory Transaction_.fromJson(List<dynamic> data) {
    final List<Map<String, dynamic>> response_ = [];

    // ignore: prefer_typing_uninitialized_variables
    var sender_;
    // ignore: prefer_typing_uninitialized_variables
    var gas_, amount_ = 0;

    // ignore: prefer_typing_uninitialized_variables
    var millis, dt, d24;

    for (var i = 0; i < data.length; i++) {
      if (data[i]["sender"] != null) {
        sender_ = data[i]["sender"];
      }
      if (data[i]["proposer"] != null) {
        sender_ = data[i]["proposer"];
      }

      if (data[i]["gas_used"] != null) {
        gas_ = data[i]["gas_used"];
      }

      if (data[i]["events"] != null) {
        for (var j = 0; j < data[i]["events"].length; j++) {
          if (data[i]["events"][j]["data"]!["amount"] != null) {
            amount_ += int.parse(data[i]["events"][j]["data"]["amount"]);
          }
        }
      }

      millis = int.parse(data[i]["timestamp"]);
      dt = DateTime.fromMicrosecondsSinceEpoch(millis);
      d24 = DateFormat('dd/MM/yyyy, HH:mm').format(dt);
      response_.add({
        "status": data[i]["success"],
        "version": data[i]['version'],
        "timestamp": d24,
        "type": data[i]["type"],
        "sender": sender_,
        "Txn hash": data[i]["hash"],
        "gas": gas_,
        "amount": amount_ / 100000000,
      });
      sender_ = null;
      amount_ = 0;
    }
    return Transaction_(response: response_);
  }
}

Future<List> getTransactions({List? dataBlock}) async {
  return Transaction_.fromJson(dataBlock!).response;
}

Future<List> getRecentTransactions() async {
  try {
    final data = await api.getTransactions(limit: 10);
    if (data.statusCode == 200) {
      return data.data!.asList();
    } else {
      throw Exception('Failed to create album.');
    }
  } finally {
    client.close();
  }
}

// Account Data
class Account {
  final String sequenceNumber;
  final String authenticationKey;
  final BuiltList<MoveResource> resources;
  // ignore: prefer_typing_uninitialized_variables
  final modules;
  // ignore: prefer_typing_uninitialized_variables
  final transactions;
  const Account({
    required this.sequenceNumber,
    required this.authenticationKey,
    required this.resources,
    required this.modules,
    required this.transactions,
  });

  bool isEmpty() {
    return sequenceNumber.isEmpty;
  }

  // Map printData() {
  //   return {
  //     "Sequence Number": sequenceNumber,
  //     "Authentication Key": authenticationKey,
  //     "Resources": resources,
  //     "Transactions": transactions,
  //   };
  // }
}

Future<Account> getAddressAccount(String address) async {
  try {
    final data = await api2.getAccount(address: address);
    final data2 = await api2.getAccountResources(address: address);
    final data3 = await api2.getAccountModules(address: address);
    final data4 = await api.getAccountTransactions(address: address);
    if (data.statusCode == 200) {
      return Account(
        authenticationKey: data.data!.authenticationKey,
        sequenceNumber: data.data!.sequenceNumber,
        resources: data2.data!,
        modules: data3.data!,
        transactions: data4.data,
      );
      // return data_;
    } else {
      throw Exception("Invalid Account");
    }
  } catch (e) {
    throw Exception("Invalid Account");
  }
}

// Block Data
final blockApi = AptosApiDart(basePathOverride: url).getBlocksApi();
final generalApi = AptosApiDart(basePathOverride: url).getGeneralApi();

Future<List> getRecentBlockTransactions(List data) async {
  if (data.isEmpty) {
    return [];
  }
  return data;
}

Future<Block> getBlock(String blockHeight) async {
  try {
    final data = await blockApi.getBlockByHeight(
        blockHeight: int.parse(blockHeight), withTransactions: true);
    if (data.statusCode == 200) {
      return data.data!;
    } else {
      throw Exception('Failed to create album.');
    }
  } finally {
    client.close();
  }
}

Future<List> getLatestBlocks() async {
  var response = [];
  try {
    // ignore: prefer_typing_uninitialized_variables
    var blockHeightBy;
    var height = await generalApi.getLedgerInfo();
    if (height.statusCode == 200) {
      blockHeightBy = height.data!.blockHeight;
    }
    for (var i = 0; i < 10; i++) {
      var blockHeight = (int.parse(blockHeightBy) - i);
      final data = await blockApi.getBlockByHeight(
          blockHeight: blockHeight, withTransactions: true);

      if (data.statusCode == 200) {
        response.add(data.data);
      } else {
        throw Exception('Failed to create album.');
      }
    }
    return response;
  } finally {
    client.close();
  }
}
