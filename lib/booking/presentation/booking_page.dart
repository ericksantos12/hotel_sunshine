import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_sunshine/booking/presentation/booking_controller.dart';

class BookingPage extends StatelessWidget {
  BookingPage({super.key});

  final BookingController controller = Get.put(BookingController());
  final dateNow = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
                child: Text("Reserve seu Quarto",
                    style: Theme.of(context).textTheme.headlineMedium)),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FilledButton(
                    onPressed: () {
                      Get.defaultDialog(
                          title: "Escolha a data",
                          content: SizedBox(
                            height: 500,
                            width: 300,
                            child: Column(
                              children: [
                                RangeDatePicker(
                                  maxDate: DateTime(
                                      controller.dateNow.year + 1,
                                      controller.dateNow.month,
                                      controller.dateNow.day),
                                  minDate: controller.dateNow,
                                  onRangeSelected: (value) {
                                    controller.setDate(value);
                                  },
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: const Text("Confirmar"),
                                )
                              ],
                            ),
                          ));
                    },
                    child: const Text(
                      "Escolha a data",
                    )),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Escolha sua Suite",
                        style: Theme.of(context).textTheme.labelLarge),
                    Obx(() => DropdownButton(
                        value: controller.suiteSelected.value,
                        items: controller.suites
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (suite) {
                          controller.setSuite(suite!);
                        })),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Divider(
              color: Theme.of(context).primaryColorLight,
              indent: 30,
              endIndent: 30,
            ),
            const SizedBox(
              height: 20,
            ),
            Obx(() => controller.dateSelected.value != null
                ? Text(
                    "${controller.dateStart.value} - ${controller.dateEnd.value}", style: Theme.of(context).textTheme.headlineSmall)
                : const SizedBox()),
            const SizedBox(
              height: 20,
            ),
            Obx(() => controller.dateSelected.value != null
                ? Text(
                    "Valor total: R\$ ${controller.calculateDaily().toStringAsFixed(2)}", style: Theme.of(context).textTheme.headlineSmall)
                : const SizedBox()),
          ],
        ),
      ),
    ));
  }
}
