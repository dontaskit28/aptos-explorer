import 'package:explorer/m_y_card/search.dart';
import 'package:explorer/m_y_card/transaction_card.dart';
import 'package:flutter/material.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../utils/get_recent_transactions.dart';

class TransactionsContainer extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final data;
  const TransactionsContainer({super.key, this.data});

  @override
  State<TransactionsContainer> createState() => _TransactionsContainerState();
}

class _TransactionsContainerState extends State<TransactionsContainer> {
  Future<List> transactionData = getRecentTransactions();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        title: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.83,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Transactions",
                    style: FlutterFlowTheme.of(context).title3),
                IconButton(
                  icon: Icon(
                    Icons.refresh,
                    color: FlutterFlowTheme.of(context).bodyText2.color,
                    size: 22,
                  ),
                  onPressed: () {
                    setState(() {
                      transactionData = getRecentTransactions();
                    });
                  },
                ),
              ],
            ),
          ),
        ),
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SearchBar(text: "Transaction"),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 4,
                    color: Color(0x3F14181B),
                    offset: Offset(0, 3),
                  )
                ],
                // borderRadius: BorderRadius.circular(8),
              ),
              child: FutureBuilder<List>(
                future: transactionData,
                builder: (BuildContext context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            SizedBox(
                              width: 40,
                              height: 40,
                              child: CircularProgressIndicator(),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Text(' Fetching resent Transactions *_^'),
                            ),
                          ],
                        ),
                      );
                    default:
                      if (snapshot.hasError) {
                        return Column(
                          children: [
                            const Icon(Icons.error),
                            const Text('Failed to fetch data.'),
                            IconButton(
                              icon: const Icon(Icons.restart_alt_rounded),
                              onPressed: () {
                                setState(() {
                                  transactionData = getRecentTransactions();
                                });
                              },
                            ),
                          ],
                        );
                      } else {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: snapshot.data!.map((e) {
                              return transactionsCard(context, e);
                            }).toList(),
                          ),
                        );
                      }
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
