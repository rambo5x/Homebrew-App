class UserData {
  bool _fpChecked;
  bool _dMChecked;
  int cupsConverted;

  UserData() {
    _fpChecked = false;
    _dMChecked = false;
    cupsConverted = 0;
  }

  void setMachine(bool fp, bool dm) {
    _fpChecked = fp;
    _dMChecked = dm;
  }

  void reset() {
    _fpChecked = false;
    _dMChecked = false;
    cupsConverted = 0;
  }

  void setCups(int num) {
    cupsConverted = num;
  }

  bool getFPC() {
    return _fpChecked;
  }

  bool getDPC() {
    return _dMChecked;
  }

  int getCups() {
    return cupsConverted;
  }
}
