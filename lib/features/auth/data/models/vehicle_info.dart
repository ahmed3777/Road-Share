class VehicleInfo {
  final String? type;
  final String? color;
  final String? plateNumber;

  VehicleInfo({
    this.type,
    this.color,
    this.plateNumber,
  });

  factory VehicleInfo.fromJson(Map<String, dynamic> json) {
    return VehicleInfo(
      type: json['type'],
      color: json['color'],
      plateNumber: json['plateNumber'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'color': color,
      'plateNumber': plateNumber,
    };
  }
}
