import 'dart:async';

import 'package:flutter/material.dart';
import 'package:technology_app/screens/delete_dialog_view/deleteDialogView.dart';

class DialogHelper {

  static Timer _timer;

  static deleteConform(context) => showDialog(context: context, builder: (context) {
    _timer = Timer(Duration(milliseconds: 1000), () {
      Navigator.of(context).pop();
    });
    return DeleteDialog();});
  }
