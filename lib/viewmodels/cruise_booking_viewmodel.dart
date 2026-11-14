import 'package:flutter/material.dart';
import '../models/cruise_destiantion.dart';

class CruiseBookingViewModel extends ChangeNotifier {
  final CruiseDestination destination = const CruiseDestination(
    name: 'Rajang River Cruise',
    location: 'Sibu, Sarawak',
    description:
    'Enjoy a relaxing cruise along the Rajang River in Sibu, Sarawak. '
        'Discover the river scenery and experience the local heritage '
        'while enjoying your journey.',
    initialStarCount: 41,
  );

  DateTime? selectedDate;

  String selectedPackage = 'Private River Cruise';

  bool isDarkMode = false;

  late int starCount = destination.initialStarCount;

  final List<String> cruisePackages = [
    'Private River Cruise',
    'Sunset Cruise',
    'Sunrise Cruise',
    'Rural Cruise',
    'SMI Park Cruise',
  ];

  void selectDate(DateTime date) {
    selectedDate = date;
    notifyListeners();
  }

  void selectPackage(String package) {
    selectedPackage = package;
    notifyListeners();
  }

  void toggleTheme(bool value) {
    isDarkMode = value;
    notifyListeners();
  }

  void increaseStarCount() {
    starCount++;
    notifyListeners();
  }
}