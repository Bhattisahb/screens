void main(){

  DateTime now= DateTime.now();

  String hour12= (now.hour>12?now.hour-12:now.hour).toString().padLeft(2,'0');
  String AMkPM= now.hour>=12?"PM":"AM";
  String minute= now.minute.toString().padLeft(2,'0');

  print('${hour12}:${minute}:${AMkPM}');



}