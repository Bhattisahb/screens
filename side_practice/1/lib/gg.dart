void main() {
  // 1. Parsing Strings into numbers
  String rawInputPrice = '49.95';
  String rawInputQuantity = '3';

  double parsedPrice = double.parse(rawInputPrice);
  int parsedQuantity = int.parse(rawInputQuantity);

  double subtotal = parsedPrice * parsedQuantity;

  // 2. Converting numbers back to String with formatting
  String formattedSubtotal = subtotal.toStringAsFixed(2);
  print('Subtotal: \$$formattedSubtotal');

  // 3. String expressions & boolean checks
  bool qualifiesForDiscount = subtotal > 100;
  String discountStatus = 'Discount applied: ${qualifiesForDiscount ? "10%" : "0%"}';
  print(discountStatus);

  // 4. num flexibility
  num flexibleValue = 10; // holds an int
  print('Value as int: $flexibleValue (is int: ${flexibleValue is int})');

  flexibleValue = 12.75; // re-assigned to a double
  print('Value as double: $flexibleValue (is double: ${flexibleValue is double})');
}