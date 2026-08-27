void main(){

  String name = 'HUSNAIN';
  String age  =  '24';
  String batch = '19';


  double parsedage = double.parse(age);

  double parsedbatch =  double.parse(batch);
  double division = parsedage/parsedbatch;

  print(division);

  String formatteddivision = division.toStringAsFixed(2);


  print(formatteddivision);
}
