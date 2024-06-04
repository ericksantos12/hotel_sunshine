import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BookingController extends GetxController {
  final List<String> suites = [
    "Econômica",
    "Padrão",
    "Luxo",
    "Super Luxo",
    "Presidencial"
  ];
  final dateNow = DateTime.now();
  DateFormat dateFormat = DateFormat("dd/MM/yyyy");

  Rxn<DateTimeRange> dateSelected = Rxn<DateTimeRange>();
  final RxString dateStart = "".obs;
  final RxString dateEnd = "".obs;
  final suiteSelected = "Econômica".obs;

  void setDate(DateTimeRange date) {
    dateSelected.value = date;
    dateStart.value = dateFormat.format(date.start);
    dateEnd.value = dateFormat.format(date.end);
  }

  void setSuite(String suite) {
    suiteSelected.value = suite;
  }

  double calculateDaily() {
    if (dateSelected.value != null) {
      switch (suiteSelected.value) {
        case "Econômica":
          return (dateSelected.value!.duration.inDays + 1) * 150.00;
        case "Padrão":
          return (dateSelected.value!.duration.inDays + 1) * 250.00;
        case "Luxo":
          return (dateSelected.value!.duration.inDays + 1) * 400.00;
        case "Super Luxo":
          return (dateSelected.value!.duration.inDays + 1) * 600.00;
        case "Presidencial":
          return (dateSelected.value!.duration.inDays + 1) * 1200.00;
        default:
          return 0.0;
      }
    }
    return 0.0;
  }

