void main() {
  final userCity = "Lahore";

  // Agar hum change karne ki koshish karein:
  // userCity = "Karachi"; // ERROR! Dart allow nahi karega.

  // Real-life use: Jo value app chalne ke baad pata chalti hai
  final loginTime = DateTime.now(); // Jab user login karega, waqt lock ho jayega
  print(loginTime);
}