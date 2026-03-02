import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/button_widget.dart';
import '/components/drawer_menu_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'top_page_widget.dart' show TopPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TopPageModel extends FlutterFlowModel<TopPageWidget> {
  ///  Local state fields for this page.

  List<VocabsRecord> vocabsRecordList = [];
  void addToVocabsRecordList(VocabsRecord item) => vocabsRecordList.add(item);
  void removeFromVocabsRecordList(VocabsRecord item) =>
      vocabsRecordList.remove(item);
  void removeAtIndexFromVocabsRecordList(int index) =>
      vocabsRecordList.removeAt(index);
  void insertAtIndexInVocabsRecordList(int index, VocabsRecord item) =>
      vocabsRecordList.insert(index, item);
  void updateVocabsRecordListAtIndex(
          int index, Function(VocabsRecord) updateFn) =>
      vocabsRecordList[index] = updateFn(vocabsRecordList[index]);

  ///  State fields for stateful widgets in this page.

  // Model for button component.
  late ButtonModel buttonModel;
  // State field(s) for Checkbox widget.
  bool? checkboxValue1;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for Checkbox widget.
  Map<VocabsRecord, bool> checkboxValueMap2 = {};
  List<VocabsRecord> get checkboxCheckedItems2 => checkboxValueMap2.entries
      .where((e) => e.value)
      .map((e) => e.key)
      .toList();

  // Model for drawerMenu component.
  late DrawerMenuModel drawerMenuModel;

  @override
  void initState(BuildContext context) {
    buttonModel = createModel(context, () => ButtonModel());
    drawerMenuModel = createModel(context, () => DrawerMenuModel());
  }

  @override
  void dispose() {
    buttonModel.dispose();
    drawerMenuModel.dispose();
  }
}
