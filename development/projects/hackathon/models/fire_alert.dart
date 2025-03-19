// models/fire_alert.dart
class FireAlert {
  final String sensorId;
  final String location;
  final double temperature;
  final bool isEmergency;

  FireAlert({
    required this.sensorId,
    required this.location,
    required this.temperature,
    required this.isEmergency,
  });

  factory FireAlert.fromJson(Map<String, dynamic> json) {
    return FireAlert(
      sensorId: json['sensor_id'],
      location: json['location'],
      temperature: json['temperature']?.toDouble() ?? 0.0,
      isEmergency: json['is_emergency'] ?? false,
    );
  }
}