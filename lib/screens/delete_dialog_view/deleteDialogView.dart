import 'package:flutter/material.dart';

import 'components/dialog_footer.dart';
import 'components/dialog_header.dart';
import 'components/dialog_message.dart';

class DeleteDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: _buildChild(context),
    );
  }

  _buildChild(BuildContext context) => Container(
        height: 330,
        decoration: BoxDecoration(
            color: Colors.deepPurple.shade300,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Column(
          children: <Widget>[
            DialogHeader(),
            SizedBox(height: 30),
            DialogMessage(),
            SizedBox(height: 30),
            DialogFooter()
          ],
        ),
      );
}
