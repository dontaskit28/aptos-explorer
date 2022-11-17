import 'package:aptos_api_dart/aptos_api_dart.dart';
import 'package:explorer/payment_details/block_details.dart';
import 'package:explorer/utils/get_recent_transactions.dart';
import 'package:flutter/material.dart';
import 'package:searchbar_animation/searchbar_animation.dart';
import '../pages/account.dart';
import '../payment_details/transaction_detail.dart';

// ignore: must_be_immutable
class SearchBar extends StatefulWidget {
  final String text;
  Block? data;
  SearchBar({super.key, required this.text});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  late TextEditingController searchText;

  @override
  void initState() {
    super.initState();
    searchText = TextEditingController();
  }

  void random(String blockHeight) async {
    await getBlock(blockHeight).then((value) {
      setState(() {
        widget.data = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SearchBarAnimation(
      onEditingComplete: () {
        var temp = searchText.text;
        random(temp);
        setState(() {
          searchText.text = '';
        });
        widget.text == "Account"
            ? Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AccountWidget(address: temp),
                ),
              )
            : widget.text == "Block"
                ? Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlockDetail(height: temp),
                    ),
                  )
                : Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TransactionWidget(version: temp),
                    ),
                  );
      },
      searchBoxWidth: MediaQuery.of(context).size.width * 0.95,
      textEditingController: searchText,
      hintText: "${widget.text} Address",
      isOriginalAnimation: false,
      enableKeyboardFocus: true,
      onPressButton: (isSearchBarOpens) {},
      trailingWidget: const Icon(
        Icons.search,
        size: 20,
        color: Colors.black,
      ),
      isSearchBoxOnRightSide: true,
      secondaryButtonWidget: const Icon(
        Icons.close,
        size: 20,
        color: Colors.black,
      ),
      buttonWidget: const Icon(
        Icons.search,
        size: 20,
        color: Colors.black,
      ),
      durationInMilliSeconds: 200,
    );
  }
}
