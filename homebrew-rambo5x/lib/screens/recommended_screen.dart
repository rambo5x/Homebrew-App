import 'package:flutter/material.dart';
import 'package:homebrew/screens/choose_cups_screen.dart';
import 'package:homebrew/screens/choose_device_screen.dart';
import 'package:homebrew/utils/coffee_tools.dart';
import 'package:homebrew/models/UserData.dart';

class RecommendedScreen extends StatefulWidget {
  UserData data = new UserData();
  RecommendedScreen(this.data);

  @override
  _RecommendedScreenState createState() => _RecommendedScreenState();
}

class _RecommendedScreenState extends State<RecommendedScreen> {
  int cupsCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: new IconButton(
          key: Key("back-btn-recommended-key"),
          icon: new Icon(
            Icons.arrow_back_ios,
            color: Color(0xFF4C748B),
            size: 20,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, bottom: 200, top: 200),
              child: Container(
                decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                  side: BorderSide(
                      width: 2.0,
                      style: BorderStyle.solid,
                      color: Colors.blueGrey),
                  borderRadius: BorderRadius.circular(8.0),
                )),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Recommended",
                        style: new TextStyle(
                          color: Color(0xFF4C748B),
                          fontFamily: 'Kollektif',
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          letterSpacing: 1.5,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        color: Color(0xFF4C748B),
                        thickness: 1,
                        indent: 25,
                        endIndent: 25,
                        height: 0,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        CoffeeTools.coffeGramsForCups(widget.data.getCups(),
                                    widget.data.getDPC(), widget.data.getFPC())
                                .toStringAsFixed(0) +
                            "g - course ground coffee\n         " +
                            CoffeeTools.waterGramsForCups(widget.data.getCups())
                                .toStringAsFixed(0) +
                            "g - water",
                        key: Key("show coffee and water grams"),
                        style: new TextStyle(
                          color: Color(0xFF4C748B),
                          fontFamily: 'Kollektif',
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          letterSpacing: 1.5,
                        ),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      Text(
                        "Enjoy your delicious coffee",
                        style: new TextStyle(
                          color: Color(0xFF4C748B),
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic,
                          fontSize: 10,
                          letterSpacing: 1.5,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ]),
              ),
            ),
            Container(
              width: 275,
              height: 40,
              child: RaisedButton(
                key: Key("back-home-key"),
                onPressed: () {
                  //widget.data.reset();
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => ChooseDeviceScreen()),
                      (route) => false);
                },
                color: Color(0xFF4C748B),
                child: Text(
                  'Done',
                  style: new TextStyle(
                    color: Colors.white,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    letterSpacing: 1.5,
                  ),
                ),
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(8.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
