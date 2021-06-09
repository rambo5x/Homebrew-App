import 'package:flutter/material.dart';
import 'package:homebrew/screens/choose_cups_screen.dart';
import 'package:homebrew/models/UserData.dart';

class ChooseDeviceScreen extends StatefulWidget {
  UserData data = new UserData();

  @override
  _ChooseDeviceScreenState createState() => _ChooseDeviceScreenState();
}

class _ChooseDeviceScreenState extends State<ChooseDeviceScreen> {
  bool _fpChecked = false;
  bool _dMChecked = false;

  void toggledDM(bool value) {
    _dMChecked = !_dMChecked;
    setState(() {});
  }

  void toggledFP(bool value) {
    _fpChecked = !_fpChecked;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "What coffee maker are you using?",
              key: Key("coffee-maker-question"),
              style: new TextStyle(
                color: Color(0xFF4C748B),
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w400,
                fontSize: 18,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, bottom: 25, top: 25),
              child: Container(
                width: 350,
                height: 100,
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
                    Container(
                        height: 48,
                        child: RaisedButton(
                          key: Key("french-press-key"),
                          onPressed: () {
                            toggledFP(_fpChecked);
                            _dMChecked = false;
                          },
                          color: Colors.transparent,
                          elevation: 0,
                          padding: EdgeInsets.only(left: 35, top: 0),
                          child: Row(children: <Widget>[
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'French Press',
                                  key: Key("French-press-text"),
                                  style: new TextStyle(
                                    color: Color(0xFF4C748B),
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    letterSpacing: 1.5,
                                  ),
                                  textAlign: TextAlign.left,
                                )),
                            SizedBox(
                              width: 150,
                            ),
                            Icon(
                              Icons.check,
                              color: _fpChecked
                                  ? Color(0xFF4C748B)
                                  : Colors.transparent,
                            )
                          ]),
                        )),
                    Divider(
                      color: Color(0xFF4C748B),
                      thickness: 1,
                      indent: 0,
                      endIndent: 0,
                      height: 0,
                    ),
                    Container(
                        height: 48,
                        child: RaisedButton(
                          key: Key("drip-machine-key"),
                          onPressed: () {
                            toggledDM(_dMChecked);
                            _fpChecked = false;
                          },
                          color: Colors.transparent,
                          elevation: 0,
                          padding: EdgeInsets.only(left: 35, top: 0),
                          child: Row(children: <Widget>[
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Drip Machine',
                                  style: new TextStyle(
                                    color: Color(0xFF4C748B),
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    letterSpacing: 1.5,
                                  ),
                                  textAlign: TextAlign.left,
                                )),
                            SizedBox(
                              width: 146,
                            ),
                            Icon(
                              Icons.check,
                              color: _dMChecked
                                  ? Color(0xFF4C748B)
                                  : Colors.transparent,
                            )
                          ]),
                        )),
                  ],
                ),
              ),
            ),
            Container(
              width: 275,
              height: 40,
              child: RaisedButton(
                key: Key("press-continue-machine-button"),
                onPressed: () {
                  if (_dMChecked || _fpChecked) {
                    widget.data.setMachine(_fpChecked, _dMChecked);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              (ChooseCupsScreen(widget.data))),
                    );
                  }
                },
                color: _dMChecked || _fpChecked
                    ? Color(0xFF4C748B)
                    : Color(0xFFE2E2E2),
                child: Text(
                  'Continue',
                  style: new TextStyle(
                    color: _dMChecked || _fpChecked
                        ? Colors.white
                        : Color(0xFF757474),
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    letterSpacing: 1.5,
                  ),
                ),
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(15.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
