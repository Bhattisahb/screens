import 'dart:io';

void main() {
  print("Product ko rating dein (1 se 5 ke darmiyan, e.g. 5 ya 4.66):");

  // 1. User se keyboard input lena
  String? userInput = stdin.readLineSync();

  // 2. Text ko number mein convert karna (num.tryParse dono sambhal lega)
  num? rating = num.tryParse(userInput ?? '');

  // 3. App ka check karna
  if (rating == null) {
    print("Ghalti: Sahi number type karein!");
  } else if (rating < 1 || rating > 5) {
    print("Ghalti: Rating sirf 1 se 5 ke darmiyan honi chahiye!");
  } else if (rating is int) {
    // Agar poora number hai
    print("Rating: $rating / 5 Stars (Clean Rating)");
  } else if (rating is double) {
    // Agar point wala number hai to point ke baad sirf 1 digit rakho
    print("Rating: ${rating.toStringAsFixed(1)} / 5 Stars (Rounded Rating)");
  }
}