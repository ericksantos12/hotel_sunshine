import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_sunshine/data/datasources/database_helper.dart';

class ShowReservationsController extends GetxController {
  final reservations = [].obs;

  loadReservations() async {
    final db = DatabaseHelper();
    reservations.value = await db.getReservations();
  }

  deleteReservation(int id) async {
    final db = DatabaseHelper();

    Get.defaultDialog(
        title: "Aviso",
        middleText: "Deseja realmente excluir esta reserva?",
        confirm: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                child: const Text("Sim"),
                onPressed: () async {
                  await db.deleteReservation(id);
                  loadReservations();
                  Get.back(closeOverlays: true);
                }),
            const SizedBox(width: 10),
            FilledButton(
              child: const Text("Não"),
              onPressed: () {
                Get.back(closeOverlays: true);
              },
            )
          ],
        ));
  }
}
