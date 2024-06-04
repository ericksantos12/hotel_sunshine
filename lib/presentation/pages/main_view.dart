import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_sunshine/presentation/pages/booking_page.dart';
import 'package:hotel_sunshine/presentation/pages/show_reservations_page.dart';
import 'package:material_symbols_icons/symbols.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final List<Widget> _pages = [const ShowReservationsPage(), BookingPage()];
  final _selectedIndex = 0.obs;

  void _onItemTapped(int index) {
    _selectedIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => _pages[_selectedIndex.value]),
      bottomNavigationBar: Obx(() => NavigationBar(
            selectedIndex: _selectedIndex.value,
            onDestinationSelected: _onItemTapped,
            destinations: const [
              NavigationDestination(
                icon: Icon(Symbols.format_list_bulleted_rounded),
                label: 'Reservations',
              ),
              NavigationDestination(
                icon: Icon(Symbols.checkbook),
                label: 'Booking',
              ),
            ],
          )),
    );
  }
}
