import 'package:flutter/material.dart';
import 'package:hackathon/data/addresses.dart';
import 'package:hackathon/screens/address_details_screen.dart';

class AlarmScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final alarmAddresses = addresses.where((address) {
      return address.detectors.any((detector) => detector.status == 'Warning');
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Список адресов с тревогой'),
      ),
      body: ListView.builder(
        itemCount: alarmAddresses.length,
        itemBuilder: (context, index) {
          final address = alarmAddresses[index];
          return ListTile(
            title: Text(address.name),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => AddressDetailsScreen(address: address),
              ),
            ),
          );
        },
      ),
    );
  }
}