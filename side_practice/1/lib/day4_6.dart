import 'package:intl/intl.dart';

void main() {
  DateTime now = DateTime.now();

  print(DateFormat('dd/MM/yyyy').format(now));       // 27/08/2026
  print(DateFormat('d MMM yyyy').format(now));        // 27 Aug 2026
  print(DateFormat('EEEE, d MMMM').format(now));     // Thursday, 27 August
  print(DateFormat('hh:mm a').format(now));          // 10:02 AM
  print(DateFormat('HH:mm:ss').format(now));         // 10:02:35 (24-hr)
}