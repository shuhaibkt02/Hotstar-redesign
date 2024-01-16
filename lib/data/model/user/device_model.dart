import 'package:equatable/equatable.dart';

class DeviceModel extends Equatable {
  final String deviceID;
  final String deviceName;
  final String deviceType;

  const DeviceModel({
    required this.deviceID,
    required this.deviceName,
    required this.deviceType,
  });

  factory DeviceModel.fromJson(Map<String, dynamic> json) {
    return DeviceModel(
      deviceID: json['deviceID'] as String,
      deviceName: json['deviceName'] as String,
      deviceType: json['deviceType'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'deviceID': deviceID,
      'deviceName': deviceName,
      'deviceType': deviceType,
    };
  }

  DeviceModel copyWith({
    String? deviceID,
    String? deviceName,
    String? deviceType,
  }) {
    return DeviceModel(
      deviceID: deviceID ?? this.deviceID,
      deviceName: deviceName ?? this.deviceName,
      deviceType: deviceType ?? this.deviceType,
    );
  }

  @override
  List<Object?> get props => [deviceID, deviceName, deviceType];
}
