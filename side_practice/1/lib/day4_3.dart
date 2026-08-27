void main(){

  DateTime now= DateTime.now();
   String cleanhour= now.hour.toString().padLeft(2,'0');
  String cleanminute= now.minute.toString().padLeft(2,'0');

  print('${cleanhour} : ${cleanminute}');


}