import 'package:flutter/material.dart';
import 'package:homebrew/screens/choose_device_screen.dart';
import 'package:homebrew/screens/recommended_screen.dart';
import 'package:flutter/services.dart';
import 'package:homebrew/models/UserData.dart';

class ChooseCupsScreen extends StatefulWidget {
  UserData data = new UserData();
  //ChooseDeviceScreen(this.data);
  ChooseCupsScreen(this.data);

  @override
  _ChooseCupsScreenState createState() => _ChooseCupsScreenState();
}

class _ChooseCupsScreenState extends State<ChooseCupsScreen> {
  bool _hasInput = false, _keyboardVisible = false;
  TextEditingController enterCups = TextEditingController();
  int cupsConverted = 0;

  void toggled(bool value) {
    _hasInput = !_hasInput;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    _keyboardVisible = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: new IconButton(
          key: Key("back-btn-cups-key"),
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
          children: [
            Text(
              "How many cups would you like?",
              key: Key("cups-question-key"),
              style: new TextStyle(
                color: Color(0xFF4C748B),
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w400,
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                width: 330,
                child: TextField(
                  key: Key("cups-amount-key"),
                  textAlign: TextAlign.left,
                  controller: enterCups,
                  keyboardType: TextInputType.number,
                  // inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  inputFormatters: [
                    new FilteringTextInputFormatter.allow(RegExp("[0-9]"))
                  ],
                  decoration: InputDecoration(
                    enabledBorder: new OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: new BorderSide(
                            color: Color(0xFF4C748B), width: 2.0)),
                    focusedBorder: new OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: new BorderSide(
                            color: Color(0xFF4C748B), width: 2.0)),
                    contentPadding: EdgeInsets.all(16),
                  ),
                  onChanged: (value) {
                    setState(() {
                      if (value != null && value.isNotEmpty && value != '0') {
                        _hasInput = true;
                      } else if (value.isEmpty) {
                        toggled(!_hasInput);
                      }
                    });
                  },
                )),
            SizedBox(
              height: 25,
            ),
            Container(
              width: 275,
              height: 40,
              child: RaisedButton(
                key: Key("press-continue-cups-button"),
                onPressed: () {
                  setState(() {
                    cupsConverted = int.tryParse(enterCups.text);
                    if (_hasInput &&
                        !_keyboardVisible &&
                        enterCups.text.isNotEmpty &&
                        cupsConverted > 0) {
                      widget.data.setCups(cupsConverted);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                (RecommendedScreen(widget.data))),
                      );
                    }
                  });
                },
                color: _hasInput && enterCups.text.isNotEmpty
                    ? Color(0xFF4C748B)
                    : Color(0xFFE2E2E2),
                child: Text(
                  'Continue',
                  style: new TextStyle(
                    color: _hasInput ? Colors.white : Color(0xFF757474),
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
            SizedBox(
              height: 150,
            ),
          ],
        ),
      ),
    );
  }
}
