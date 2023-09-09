import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'set_limit_model.dart';
export 'set_limit_model.dart';

class SetLimitWidget extends StatefulWidget {
  const SetLimitWidget({Key? key}) : super(key: key);

  @override
  _SetLimitWidgetState createState() => _SetLimitWidgetState();
}

class _SetLimitWidgetState extends State<SetLimitWidget> {
  late SetLimitModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SetLimitModel());

    _model.textController ??= TextEditingController();
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
      backgroundColor: FlutterFlowTheme.of(context).textColor,
      appBar: AppBar(
        backgroundColor: Color(0xFF483E95),
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30.0,
          borderWidth: 1.0,
          buttonSize: 60.0,
          icon: Icon(
            Icons.chevron_left,
            color: Colors.white,
            size: 28.0,
          ),
          onPressed: () async {
            context.pop();
          },
        ),
        title: Text(
          FFLocalizations.of(context).getText(
            'txgk33np' /* Set Limit */,
          ),
          style: FlutterFlowTheme.of(context).headlineSmall.override(
                fontFamily: 'Roboto',
                color: FlutterFlowTheme.of(context).textColor,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 2.0,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: 100.0,
            height: 176.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).textColor,
              borderRadius: BorderRadius.circular(0.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(80.0),
                  child: Image.network(
                    'https://media.licdn.com/dms/image/C4E03AQETVq6FT_-hcA/profile-displayphoto-shrink_800_800/0/1645017926676?e=1698883200&v=beta&t=_bKH_SlhnIU8kHG_k13p7eiic9CaMrgjjBoN_607V1I',
                    width: 120.0,
                    height: 120.0,
                    fit: BoxFit.contain,
                  ),
                ),
                Text(
                  FFLocalizations.of(context).getText(
                    'lxvp477b' /* Dylan */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Roboto',
                        color: FlutterFlowTheme.of(context).darkBackground,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
            child: TextFormField(
              controller: _model.textController,
              autofocus: true,
              obscureText: false,
              decoration: InputDecoration(
                labelText: FFLocalizations.of(context).getText(
                  'mhk1k8bk' /* Enter Amount (RM) */,
                ),
                labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                      fontFamily: 'Roboto',
                      color: FlutterFlowTheme.of(context).darkBackground,
                      fontSize: 18.0,
                    ),
                hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                      fontFamily: 'Roboto',
                      color: FlutterFlowTheme.of(context).darkBackground,
                    ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).alternate,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).primary,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).error,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                focusedErrorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).error,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Roboto',
                    color: FlutterFlowTheme.of(context).darkBackground,
                  ),
              validator: _model.textControllerValidator.asValidator(context),
            ),
          ),
          FlutterFlowDropDown<String>(
            controller: _model.dropDownValueController ??=
                FormFieldController<String>(null),
            options: [
              FFLocalizations.of(context).getText(
                'ffm9qaxn' /* Entertainment */,
              ),
              FFLocalizations.of(context).getText(
                '7u55t6zb' /* Food */,
              ),
              FFLocalizations.of(context).getText(
                'nmd8amq0' /* Academics */,
              ),
              FFLocalizations.of(context).getText(
                'spz4m1s1' /* Clothings */,
              ),
              FFLocalizations.of(context).getText(
                'qn0br7d8' /* Others */,
              )
            ],
            onChanged: (val) => setState(() => _model.dropDownValue = val),
            width: 300.0,
            height: 50.0,
            textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Roboto',
                  color: FlutterFlowTheme.of(context).textColor,
                  fontSize: 18.0,
                ),
            hintText: FFLocalizations.of(context).getText(
              'r0rlh532' /* Select Category */,
            ),
            icon: Icon(
              Icons.keyboard_arrow_down_rounded,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 24.0,
            ),
            fillColor: Color(0xFF483E95),
            elevation: 2.0,
            borderColor: Color(0xFF483E95),
            borderWidth: 2.0,
            borderRadius: 8.0,
            margin: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
            hidesUnderline: true,
            isSearchable: false,
            isMultiSelect: false,
          ),
          FlutterFlowCalendar(
            color: Color(0xFF483E95),
            iconColor: FlutterFlowTheme.of(context).secondaryText,
            weekFormat: false,
            weekStartsMonday: true,
            rowHeight: 64.0,
            onChange: (DateTimeRange? newSelectedDate) {
              setState(() => _model.calendarSelectedDay = newSelectedDate);
            },
            titleStyle: FlutterFlowTheme.of(context).headlineSmall.override(
                  fontFamily: 'Roboto',
                  color: FlutterFlowTheme.of(context).darkBackground,
                ),
            dayOfWeekStyle: FlutterFlowTheme.of(context).labelLarge.override(
                  fontFamily: 'Roboto',
                  color: Color(0xFF483E95),
                ),
            dateStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Roboto',
                  color: FlutterFlowTheme.of(context).darkBackground,
                ),
            selectedDateStyle: FlutterFlowTheme.of(context).titleSmall.override(
                  fontFamily: 'Roboto',
                  color: FlutterFlowTheme.of(context).textColor,
                ),
            inactiveDateStyle: FlutterFlowTheme.of(context).labelMedium,
            locale: FFLocalizations.of(context).languageCode,
          ),
          FFButtonWidget(
            onPressed: () {
              print('Button pressed ...');
            },
            text: FFLocalizations.of(context).getText(
              'ss8exe1i' /* Submit */,
            ),
            options: FFButtonOptions(
              height: 40.0,
              padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              color: Color(0xFF483E95),
              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                    fontFamily: 'Roboto',
                    color: Colors.white,
                  ),
              elevation: 3.0,
              borderSide: BorderSide(
                color: Colors.transparent,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ],
      ),
    );
  }
}
