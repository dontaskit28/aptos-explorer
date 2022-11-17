import 'package:explorer/m_y_card/details_card_widget.dart';
import 'package:explorer/m_y_card/search.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class MYCardWidget extends StatefulWidget {
  const MYCardWidget({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MYCardWidgetState createState() => _MYCardWidgetState();
}

class _MYCardWidgetState extends State<MYCardWidget>
    with TickerProviderStateMixin {
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
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        toolbarHeight: 70,
        title: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.83,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: const Image(
                    image: NetworkImage(
                        "https://stakingcrypto.info/static/assets/coins/aptos-logo.png"),
                    height: 40,
                    width: 40,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Text("Aptos Explorer",
                    style: FlutterFlowTheme.of(context).title1),
              ],
            ),
          ),
        ),
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 20, 10),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      " Total Transactions : ",
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Lexend',
                          color: FlutterFlowTheme.of(context).textColor,
                          fontSize: 16),
                    ),
                    Text(
                      "101,010,101",
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Lexend',
                            color: FlutterFlowTheme.of(context).textColor,
                          ),
                    ),
                  ],
                ),
              ).animateOnPageLoad(animationsMap['rowOnPageLoadAnimation']!),
              SearchBar(
                text: "Account",
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(6, 16, 6, 16),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    detailsCardWidget(
                            context, "Total Supply", "184,492,760,435.03")
                        .animateOnPageLoad(
                            animationsMap['containerOnPageLoadAnimation1']!),
                    const SizedBox(
                      height: 12,
                    ),
                    detailsCardWidget(
                            context, "Actively Staked", "492,760,435.03")
                        .animateOnPageLoad(
                            animationsMap['containerOnPageLoadAnimation1']!),
                    const SizedBox(
                      height: 12,
                    ),
                    detailsCardWidget(
                            context, "Transactions per Second (TPS)", "103")
                        .animateOnPageLoad(
                            animationsMap['containerOnPageLoadAnimation1']!),
                    const SizedBox(
                      height: 12,
                    ),
                    detailsCardWidget(context, " Active Validators", "893")
                        .animateOnPageLoad(
                            animationsMap['containerOnPageLoadAnimation1']!),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
