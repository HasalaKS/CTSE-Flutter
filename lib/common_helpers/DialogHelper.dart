import 'package:flutter/material.dart';
import 'package:technology_app/screens/delete_dialog_view/deleteDialogView.dart';

class DialogHelper {
  static deleteConform(context) =>
      showDialog(context: context, builder: (context) => DeleteDialog());
}
