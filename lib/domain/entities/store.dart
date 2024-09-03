import 'package:equatable/equatable.dart';

class Store extends Equatable {
  final String address;
  final String name;
  final num distance;
  final num lat;
  final num lng;
  final String remainStatus;

  const Store({
    required this.address,
    required this.name,
    this.distance = 0,
    required this.lat,
    required this.lng,
    required this.remainStatus,
  });

  @override
  List<Object> get props {
    return [
      address,
      name,
      distance,
      lat,
      lng,
      remainStatus,
    ];
  }

  Store copyWith({
    String? address,
    String? name,
    num? distance,
    num? lat,
    num? lng,
    String? remainStatus,
  }) {
    return Store(
      address: address ?? this.address,
      name: name ?? this.name,
      distance: distance ?? this.distance,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      remainStatus: remainStatus ?? this.remainStatus,
    );
  }
}
