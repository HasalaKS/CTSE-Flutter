import 'package:ctse_flutter_app/screens/delete_dialog_view/deleteDialogView.dart';
import 'package:flutter/material.dart';

class DialogHelper {

  static deleteConform(context) => showDialog(context: context, builder: (context) => DeleteDialog());
}