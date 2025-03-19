import 'package:hackathon/models/address.dart';
import 'package:hackathon/models/detector.dart';

List<Address> addresses = [
  Address(
    id: '1',
    name: 'Улица Мира, 15',
    detectors: [
      Detector(
        id: '1-1',
        status: 'OK',
        batteryLevel: 90.0,
        pollutionLevel: 20.0,
        sensitivity: 50.0,
      ),
      Detector(
        id: '1-2',
        status: 'Warning',
        batteryLevel: 30.0,
        pollutionLevel: 40.0,
        sensitivity: 60.0,
      ),
    ],
  ),
  // Добавьте другие адреса
];