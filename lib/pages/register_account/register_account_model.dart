import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RegisterAccountModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for emailAddress widget.
  TextEditingController? emailAddressController;
  String? Function(BuildContext, String?)? emailAddressControllerValidator;
  // State field(s) for password-Create widget.
  TextEditingController? passwordCreateController;
  late bool passwordCreateVisibility;
  String? Function(BuildContext, String?)? passwordCreateControllerValidator;
  // State field(s) for passwordConfirm widget.
  TextEditingController? passwordConfirmController1;
  late bool passwordConfirmVisibility1;
  String? Function(BuildContext, String?)? passwordConfirmController1Validator;
  // State field(s) for passwordConfirm widget.
  TextEditingController? passwordConfirmController2;
  late bool passwordConfirmVisibility2;
  String? Function(BuildContext, String?)? passwordConfirmController2Validator;
  // State field(s) for passwordConfirm widget.
  TextEditingController? passwordConfirmController3;
  late bool passwordConfirmVisibility3;
  String? Function(BuildContext, String?)? passwordConfirmController3Validator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    passwordCreateVisibility = false;
    passwordConfirmVisibility1 = false;
    passwordConfirmVisibility2 = false;
    passwordConfirmVisibility3 = false;
  }

  void dispose() {
    emailAddressController?.dispose();
    passwordCreateController?.dispose();
    passwordConfirmController1?.dispose();
    passwordConfirmController2?.dispose();
    passwordConfirmController3?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
