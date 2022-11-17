// ignore: file_names
import 'package:flutter/material.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../m_y_card/transaction_card.dart';

// ignore: must_be_immutable
class AccountData extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final data;
  String name;
  AccountData({super.key, required this.data, required this.name});

  @override
  State<AccountData> createState() => _AccountDataState();
}

class _AccountDataState extends State<AccountData> {
  bool isResourceClosed = true;
  List someData = [];
  @override
  void initState() {
    super.initState();
    if (widget.name != "Transactions") {
      for (var element in widget.data) {
        someData.add(element.data);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.97,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: const [
          BoxShadow(
            blurRadius: 4,
            color: Color(0x3F14181B),
            offset: Offset(0, 3),
          )
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20, 4, 20, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.name,
                  style: FlutterFlowTheme.of(context).bodyText2,
                ),
                IconButton(
                    onPressed: () {
                      setState(() {
                        isResourceClosed = !isResourceClosed;
                      });
                    },
                    icon: isResourceClosed
                        ? const Icon(
                            Icons.arrow_right,
                            size: 30,
                          )
                        : const Icon(
                            Icons.arrow_drop_down_outlined,
                            size: 30,
                          ))
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.87,
            child: const Divider(
              color: Colors.black,
              thickness: 2.5,
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(8, 4, 8, 4),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: isResourceClosed
                  ? null
                  : Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(4, 0, 4, 3),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 0, 0, 5),
                            child: widget.name == "Transactions"
                                ? Column(children: <Widget>[
                                    for (var e in widget.data)
                                      transactionsCard(context, e)
                                  ])
                                : Text(
                                    prettyJSON(
                                      someData,
                                    ),
                                  ),
                          ),
                        ],
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

String prettyJSON(List json) {
  if (json.isEmpty) {
    return "No Data Found";
  }
  return json.join("\n");
  // JsonDecoder decoder = const JsonDecoder();
  // JsonEncoder encoder = JsonEncoder.withIndent(" " * 4);
  // var object = decoder.convert(json);
  // var prettyString = encoder.convert(json);
  // return prettyString;
}
