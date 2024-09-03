import 'package:injectable/injectable.dart';
import 'package:mask_info_clean_arch/domain/entities/location.dart';
import 'package:mask_info_clean_arch/domain/entities/permission.dart';
import 'package:mask_info_clean_arch/domain/entities/store.dart';
import 'package:mask_info_clean_arch/domain/permission/location_permission_hendler.dart';
import 'package:mask_info_clean_arch/domain/repositories/location_repository.dart';
import 'package:mask_info_clean_arch/domain/repositories/store_repository.dart';

@dev
@Singleton(as: StoreRepository)
class MockStoreRepositoryImpl implements StoreRepository {
  @override
  Future<List<Store>> getStores() async {
    await Future.delayed(const Duration(seconds: 1));

    return [
      const Store(
        address: "address",
        name: "인천약국",
        lat: 1,
        lng: 1,
        remainStatus: "remainStatus",
      ),
      const Store(
        address: "address",
        name: "서울약국",
        lat: 3,
        lng: 3,
        remainStatus: "remainStatus",
      ),
      const Store(
        address: "address",
        name: "대전약국",
        lat: 2,
        lng: 2,
        remainStatus: "remainStatus",
      ),
    ];
  }
}

@dev
@Singleton(as: LocationRepository)
class MockLocationRepositoryImpl implements LocationRepository {
  @override
  Future<Location> getLocation() async {
    return const Location(latitude: 0, longitude: 0);
  }
}

@dev
@Singleton(as: LocationPermissionHendler)
class MockLocationPermissionHandler implements LocationPermissionHendler {
  @override
  Future<Permission> checkPermission() async {
    return Permission.always;
  }

  @override
  Future<bool> isLocationServiceEnabled() async {
    return true;
  }

  @override
  Future<Permission> requestPermission() async {
    return Permission.always;
  }
}
