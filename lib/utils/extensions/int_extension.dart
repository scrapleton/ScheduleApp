extension IntToTimeExtension on int {

  //Convert a int into a string hh:mm
  String toTimeString() {
    String h = (this ~/ 60).toString();
    String m = (this % 60).toString();

    if (h == '0') {
      h = '00';
    }
    if (m.length == 1) {
      m = '0$m';
    }
    return '$h:$m';
  }
}
