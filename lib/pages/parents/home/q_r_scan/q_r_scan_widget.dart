import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'q_r_scan_model.dart';
export 'q_r_scan_model.dart';

class QRScanWidget extends StatefulWidget {
  const QRScanWidget({Key? key}) : super(key: key);

  @override
  _QRScanWidgetState createState() => _QRScanWidgetState();
}

class _QRScanWidgetState extends State<QRScanWidget> {
  late QRScanModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QRScanModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFF483E95),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                FlutterFlowIconButton(
                  borderColor: Color(0xFF483E95),
                  borderRadius: 20.0,
                  borderWidth: 1.0,
                  fillColor: Color(0xFF483E95),
                  icon: Icon(
                    Icons.chevron_left,
                    color: FlutterFlowTheme.of(context).textColor,
                    size: 50.0,
                  ),
                  onPressed: () {
                    print('IconButton pressed ...');
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 80.0),
            child: Text(
              FFLocalizations.of(context).getText(
                'uje4aome' /* Verify Child Account */,
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Roboto',
                    color: Colors.white,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 100.0),
            child: BarcodeWidget(
              data: 'Barcode',
              barcode: Barcode.code128(),
              width: 300.0,
              height: 90.0,
              color: FlutterFlowTheme.of(context).textColor,
              backgroundColor: Colors.transparent,
              errorBuilder: (_context, _error) => SizedBox(
                width: 300.0,
                height: 90.0,
              ),
              drawText: true,
            ),
          ),
          FFButtonWidget(
            onPressed: () {
              print('Button pressed ...');
            },
            text: FFLocalizations.of(context).getText(
              'pkgmn37x' /* Scan from gallery */,
            ),
            options: FFButtonOptions(
              width: 250.0,
              height: 40.0,
              padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              color: Color(0xFFCEB0F0),
              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                    fontFamily: 'Roboto',
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
              elevation: 3.0,
              borderSide: BorderSide(
                color: Colors.transparent,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
        ],
      ),
    );
  }
}
