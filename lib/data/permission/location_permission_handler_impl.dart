import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:mask_info_clean_arch/domain/entities/permission.dart';
import 'package:mask_info_clean_arch/domain/permission/location_permission_hendler.dart';

@prod
@Singleton(as: LocationPermissionHendler)
class LocationPermissionHandlerImpl implements LocationPermissionHendler {
  @override
  Future<Permission> checkPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();

    return switch (permission) {
      LocationPermission.denied ||
      LocationPermission.unableToDetermine =>
        Permission.denied,
      LocationPermission.deniedForever => Permission.deniedForever,
      _ => Permission.always,
    };
  }

  @override
  Future<bool> isLocationServiceEnabled() async {
    return await Geolocator.isLocationServiceEnabled();
  }

  @override
  Future<Permission> requestPermission() async {
    LocationPermission permission = await Geolocator.requestPermission();

    return switch (permission) {
      LocationPermission.denied ||
      LocationPermission.unableToDetermine =>
        Permission.denied,
      LocationPermission.deniedForever => Permission.deniedForever,
      _ => Permission.always,
    };
  }
}
