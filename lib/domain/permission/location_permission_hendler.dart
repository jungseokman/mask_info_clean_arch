import 'package:mask_info_clean_arch/domain/entities/permission.dart';

abstract interface class LocationPermissionHendler {
  Future<bool> isLocationServiceEnabled();
  Future<Permission> checkPermission();
  Future<Permission> requestPermission();
}
