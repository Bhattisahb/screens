void main(){

  DateTime now= DateTime.now();
  int hour12= now.hour>12 ? now.hour-12:(now.hour==12?12:now.hour);
  String mint= now.minute.toString().padLeft(2,"0");
  String period= now.hour>=12?'PM':'AM';



  print('${hour12}:${mint} ${period}');





}