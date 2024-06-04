import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_sunshine/presentation/controllers/show_reservations_controllers.dart';
import 'package:intl/intl.dart';

class ShowReservationsPage extends StatefulWidget {
  const ShowReservationsPage({super.key});

  @override
  State<ShowReservationsPage> createState() => _ShowReservationsPageState();
}

class _ShowReservationsPageState extends State<ShowReservationsPage> {
  DateFormat dateFormat = DateFormat("dd/MM/yyyy");
  final controller = Get.put(ShowReservationsController());
  @override
  void initState() {
    controller.loadReservations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Reservas")),
        ),
        body: Obx(() {
          if (controller.reservations.isEmpty) {
            return const Center(
              child: Text("Nenhuma reserva encontrada"),
            );
          } else {
            return ListView.builder(
              itemCount: controller.reservations.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(controller.reservations[index].suiteName),
                  subtitle: Text(
                      "${dateFormat.format(controller.reservations[index].startDate)} - ${dateFormat.format(controller.reservations[index].endDate)}"),
                  trailing: Text(
                      "R\$ ${controller.reservations[index].finalPrice.toStringAsFixed(2)}"),
                  onTap: () {
                    controller
                        .deleteReservation(controller.reservations[index].id);
                  },
                );
              },
            );
          }
        }));
  }
}
