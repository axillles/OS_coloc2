class Address {
  final String id;
  final String name;
  final List<Detector> detectors;

  Address({required this.id, required this.name, required this.detectors});
}

class Detector {
  final String id;
  final String status;
  final double batteryLevel;
  final double pollutionLevel;
  final double sensitivity;

  Detector({
    required this.id,
    required this.status,
    required this.batteryLevel,
    required this.pollutionLevel,
    required this.sensitivity,
  });
}