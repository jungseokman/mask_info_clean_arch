import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

class Location extends Equatable {
  final num latitude;
  final num longitude;

  const Location({required this.latitude, required this.longitude});

  @override
  List<Object> get props => [latitude, longitude];
}

extension DistanceBetween on Location {
  num distanceBetween(Location other) {
    return Geolocator.distanceBetween(
      latitude.toDouble(),
      longitude.toDouble(),
      other.latitude.toDouble(),
      other.longitude.toDouble(),
    );
  }
}
