import 'package:flutter/material.dart';
import 'package:hackathon/models/address.dart';
import 'package:hackathon/models/detector.dart';

class AddressDetailsScreen extends StatelessWidget {
  final Address address;

  AddressDetailsScreen({required this.address});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(address.name),
      ),
      body: ListView.builder(
        itemCount: address.detectors.length,
        itemBuilder: (context, index) {
          final detector = address.detectors[index];
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Извещатель ${index + 1}'),
                  Text('Статус: ${detector.status}'),
                  Text('Заряд: ${detector.batteryLevel}%'),
                  Text('Загрязнение: ${detector.pollutionLevel}'),
                  Text('Чувствительность: ${detector.sensitivity}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}