class TimeFormate {
  static String formateSecond(int totalSecond){
    int hour = totalSecond ~/ 3600;
    int minutes = (totalSecond % 3600) ~/ 60;
    int second = totalSecond % 60;
    String hourStr = hour.toString().padLeft(2,'0');
    String minutesStr = minutes.toString().padLeft(2,'0');
    String secondStr = second.toString().padLeft(2,'0');
    return '$hourStr:$minutesStr:$secondStr';
  }

}