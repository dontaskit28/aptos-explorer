import 'package:explorer/flutter_flow/flutter_flow_animations.dart';
import 'package:explorer/flutter_flow/flutter_flow_theme.dart';
import 'package:explorer/payment_details/transaction_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/effects/fade_effect.dart';
import 'package:flutter_animate/effects/move_effect.dart';
import 'package:flutter_animate/effects/scale_effect.dart';
import 'package:flutter_animate/extensions/num_duration_extensions.dart';

Widget transactionsCard(BuildContext context, dynamic transactionDetails) {
  final animationsMap = {
    'rowOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(0, 30),
          end: const Offset(0, 0),
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
        ),
      ],
    ),
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(0, 49),
          end: const Offset(0, 0),
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
        ),
      ],
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 50.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 50.ms,
          duration: 600.ms,
          begin: const Offset(0, 51),
          end: const Offset(0, 0),
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 50.ms,
          duration: 600.ms,
        ),
      ],
    ),
    'containerOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 80.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 80.ms,
          duration: 600.ms,
          begin: const Offset(0, 69),
          end: const Offset(0, 0),
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 80.ms,
          duration: 600.ms,
        ),
      ],
    ),
  };

  return // Generated code for this Container Widget...
      Padding(
    padding: const EdgeInsetsDirectional.fromSTEB(16, 4, 16, 6),
    child: InkWell(
      onTap: () async {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TransactionWidget(
              version: transactionDetails.oneOf.value.version.toString(),
            ),
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.93,
        decoration: BoxDecoration(
          color: const Color.fromARGB(
              255, 0, 116, 106), //FlutterFlowTheme.of(context).grayDark,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(12, 12, 12, 3),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 + 20,
                      child: Text(
                        // Transaction().oneOf.valueType.toString()
                        transactionDetails.oneOf.value.version.toString(),
                        style: FlutterFlowTheme.of(context).bodyText2.override(
                              fontFamily: 'Lexend',
                              color: FlutterFlowTheme.of(context).alternate,
                              fontSize: 15,
                            ),
                        // overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          child: transactionDetails.oneOf.typeIndex == 3
                              // "state_checkpoint_transaction"
                              ? Icon(
                                  Icons.emoji_flags_rounded,
                                  color: transactionDetails.oneOf.value.success
                                      ? FlutterFlowTheme.of(context)
                                          .tertiaryColor
                                      : FlutterFlowTheme.of(context).errorRed,
                                  size: 19,
                                )
                              : (transactionDetails.oneOf.typeIndex == 0
                                  // "block_metadata_transaction"
                                  ? Icon(
                                      Icons.subtitles_outlined,
                                      color:
                                          transactionDetails.oneOf.value.success
                                              ? FlutterFlowTheme.of(context)
                                                  .tertiaryColor
                                              : FlutterFlowTheme.of(context)
                                                  .errorRed,
                                      size: 19,
                                    )
                                  : Icon(
                                      Icons.swap_horiz_rounded,
                                      color:
                                          transactionDetails.oneOf.value.success
                                              ? FlutterFlowTheme.of(context)
                                                  .tertiaryColor
                                              : FlutterFlowTheme.of(context)
                                                  .errorRed,
                                      size: 21,
                                    )),
                        ),
                        const SizedBox(width: 10),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: FlutterFlowTheme.of(context).textColor,
                          size: 16,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.77,
                  height: 32,
                  margin: const EdgeInsets.only(left: 0, top: 5),
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 17,
                        color: Color(0x3F14181B),
                        offset: Offset(0, 3),
                      )
                    ],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(5, 2, 0, 0),
                          child: transactionDetails.oneOf.typeIndex == 3
                              ? Text(
                                  'hash : ',
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .title1
                                      .override(
                                        fontFamily: 'Lexend',
                                        color: FlutterFlowTheme.of(context)
                                            .tertiaryColor,
                                        fontSize: 18,
                                      ),
                                )
                              : transactionDetails.oneOf.typeIndex == 0
                                  ? Text(
                                      'proposer : ',
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .title1
                                          .override(
                                            fontFamily: 'Lexend',
                                            color: FlutterFlowTheme.of(context)
                                                .tertiaryColor,
                                            fontSize: 18,
                                          ),
                                    )
                                  : Text(
                                      'sender : ',
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .title1
                                          .override(
                                            fontFamily: 'Lexend',
                                            color: FlutterFlowTheme.of(context)
                                                .tertiaryColor,
                                            fontSize: 18,
                                          ),
                                    ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
                          child: transactionDetails.oneOf.typeIndex == 3
                              ? Text(
                                  toShortAddres(
                                      address: transactionDetails
                                          .oneOf.value.hash
                                          .toString(),
                                      index: 12),
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .title1
                                      .override(
                                        fontFamily: 'Lexend',
                                        color: FlutterFlowTheme.of(context)
                                            .tertiaryColor,
                                        fontSize: 18,
                                      ),
                                )
                              : Text(
                                  toShortAddres(
                                      address: transactionDetails
                                          .oneOf.value.hash
                                          .toString(),
                                      index: 9),
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .title1
                                      .override(
                                        fontFamily: 'Lexend',
                                        color: FlutterFlowTheme.of(context)
                                            .tertiaryColor,
                                        fontSize: 18,
                                      ),
                                ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              5, 8, 10, 12),
                          child: InkWell(
                            onTap: () {
                              Clipboard.setData(
                                  const ClipboardData(text: "walletAddress"));
                            },
                            child: const Icon(
                              Icons.copy_outlined,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ).animateOnPageLoad(
                    animationsMap['containerOnPageLoadAnimation1']!),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      DateTime.fromMicrosecondsSinceEpoch(int.parse(
                              transactionDetails.oneOf.value.timestamp))
                          .toString()
                          .substring(0, 19),
                      style: FlutterFlowTheme.of(context).bodyText2.override(
                            fontFamily: 'Lexend',
                            color: const Color(0xB3FFFFFF),
                            fontWeight: FontWeight.w300,
                          ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        "Gas: ${transactionDetails.oneOf.value.gasUsed.toString()} APT ",
                        textAlign: TextAlign.end,
                        style: FlutterFlowTheme.of(context).bodyText2.override(
                              fontFamily: 'Lexend',
                              color: const Color(0xB3FFFFFF),
                              fontWeight: FontWeight.w300,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

String toShortAddres({required String address, required int index}) {
  return "${address.substring(0, index)}...${address.substring(address.length - 3, address.length)}";
}
