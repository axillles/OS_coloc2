import 'package:flutter/material.dart';
import 'package:hackathon/data/addresses.dart';
import 'package:hackathon/screens/address_details_screen.dart';

class AllAddressesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Список всех адресов'),
      ),
      body: ListView.builder(
        itemCount: addresses.length,
        itemBuilder: (context, index) {
          final address = addresses[index];
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