import 'package:flutter/material.dart';
import 'package:ctse_flutter_app/edit/components/background.dart';
import 'package:ctse_flutter_app/components/rounded_button.dart';
import 'package:ctse_flutter_app/components/rounded_input_field.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.03),
            Text(
              "Details",
              style: TextStyle(fontFamily: 'Nunito'),
            ),
            RoundedInputField(
              hintText: "React",
              onChanged: (value) {},
            ),
            RoundedInputField(
              hintText: "https://www.youtube.com/watch?v=ExKYjqgswJg&t=135s",
              onChanged: (value) {},
            ),
            Text(
              "Description",
              style: TextStyle(fontFamily: 'Nunito'),
            ),
            RoundedInputField(
              hintText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur",
              onChanged: (value) {},
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset(
                  "assets/icons/trash.svg",
                  height: size.height * 0.05,
                ),
                SizedBox(width: size.width * 0.1),
                RoundedButton(
                  text: "UPDATE",
                  press: () {},
                ),
              ],
            ),
            SizedBox(height: size.height * 0.03),
          ],
        ),
      ),
    );
  }
}