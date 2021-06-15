import 'package:flutter/material.dart';
import 'package:technology_app/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:technology_app/model/category.dart';
import 'package:technology_app/details_screen.dart';
import 'package:technology_app/screens/delete_view/deleteView.dart';

import 'add_screen.dart';

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context)
        .size; //this gonna give us total height and with of our device
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            // Here the height of the container is 45% of our total height
            height: size.height * .52,
            decoration: BoxDecoration(
              color: primary,
              image: DecorationImage(
                scale: 2.5,
                alignment: Alignment.centerRight,
                image: AssetImage("assets/images/menuBackground.png"),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                        alignment: Alignment.center,
                        height: 52,
                        width: 52,
                        decoration: BoxDecoration(
                          color: primaryDarkSemi,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                            icon: SvgPicture.asset("assets/icons/menu.svg"),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DeleteView()),
                              );
                            })),
                  ),
                  Text("Welcome,", style: mainMenuHeading),
                  Text("Technology is best when it brings \npeople together",
                      style: mainMenuSubHeadingNormal),
                  SizedBox(height: 80),
                  Text("Category", style: mainMenuSubHeading),
                  Expanded(
                    child: StaggeredGridView.countBuilder(
                      padding: EdgeInsets.only(top: 15),
                      crossAxisCount: 2,
                      itemCount: categories.length,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            print("Click event on Container");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailsScreen()),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(20),
                            height: index.isEven ? 200 : 240,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: DecorationImage(
                                image: AssetImage(categories[index].image),
                                fit: BoxFit.fill,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  categories[index].name,
                                  style: kTitleTextStyle,
                                ),
                                Text(
                                  '${categories[index].numOfMinutes} Minutes Read',
                                  style: TextStyle(
                                    color: kTextColor.withOpacity(.5),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                      staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
