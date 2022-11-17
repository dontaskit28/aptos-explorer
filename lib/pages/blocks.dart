import 'package:explorer/m_y_card/search.dart';
import 'package:flutter/material.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../m_y_card/block_card.dart';
import '../utils/get_recent_transactions.dart';

class BlocksPage extends StatefulWidget {
  const BlocksPage({super.key});

  @override
  State<BlocksPage> createState() => _BlocksPageState();
}

class _BlocksPageState extends State<BlocksPage> {
  Future<List> _blockData = getLatestBlocks();

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
                Text("Blocks", style: FlutterFlowTheme.of(context).title3),
                IconButton(
                  icon: Icon(
                    Icons.refresh,
                    color: FlutterFlowTheme.of(context).bodyText2.color,
                    size: 22,
                  ),
                  onPressed: () {
                    setState(() {
                      _blockData = getLatestBlocks();
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
            SearchBar(text: "Block"),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 4,
                    color: Color(0x3F14181B),
                    offset: Offset(0, 3),
                  )
                ],
              ),
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: FutureBuilder<List>(
                future: _blockData,
                builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const <Widget>[
                            SizedBox(
                              width: 40,
                              height: 40,
                              child: CircularProgressIndicator(),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Text(' Fetching Latest Blocks *_^'),
                            ),
                            SizedBox(
                              height: 20,
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
                                  _blockData = getLatestBlocks();
                                });
                              },
                            ),
                          ],
                        );
                      } else {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: snapshot.data!.map((ele) {
                              return blockCard(context, ele);
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
