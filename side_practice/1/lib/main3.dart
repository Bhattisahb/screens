void main(){

String  rawprice = '49.95';
String rawquantity = '3';

double parsedprice = double.parse(rawprice);
double parsedquantity = double.parse(rawquantity);
print(parsedprice * parsedquantity);

num subtotal = parsedprice * parsedquantity ;

print('Subtotal: \$$subtotal');

String fixedsubtotal = subtotal.toStringAsFixed(2);
print('\$$fixedsubtotal');

}