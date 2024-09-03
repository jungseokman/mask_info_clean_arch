import 'package:mask_info_clean_arch/domain/entities/location.dart';
import 'package:mask_info_clean_arch/domain/entities/permission.dart';
import 'package:mask_info_clean_arch/domain/entities/store.dart';
import 'package:mask_info_clean_arch/domain/permission/location_permission_hendler.dart';
import 'package:mask_info_clean_arch/domain/repositories/location_repository.dart';
import 'package:mask_info_clean_arch/domain/repositories/store_repository.dart';

class GetNearByStoresUsecase {
  final StoreRepository _storeRepository;
  final LocationRepository _locationRepository;
  final LocationPermissionHendler _locationPermissionHendler;

  GetNearByStoresUsecase({
    required StoreRepository storeRepository,
    required LocationRepository locationRepository,
    required LocationPermissionHendler locationPermissionHendler,
  })  : _storeRepository = storeRepository,
        _locationRepository = locationRepository,
        _locationPermissionHendler = locationPermissionHendler;

  Future<List<Store>> execute() async {
    final stores = await _storeRepository.getStores();

    //> 기기 위치 서비스 확인
    final isServiceEnabled =
        await _locationPermissionHendler.isLocationServiceEnabled();

    //> 권한 체크
    if (isServiceEnabled) {
      //>> 현재 위치 권한 정보
      final permission = await _locationPermissionHendler.checkPermission();

      //>> 거부 -> 정렬없이 리턴
      if (permission == Permission.denied) {
        print("거부");
        return stores;
      }

      //>> 2번 거부 -> 정렬없이 리턴
      if (permission == Permission.deniedForever) {
        print("2번 거부");
        return stores;
      }

      //>> 승인 -> 정렬 해서 리턴
      final location = await _locationRepository.getLocation();

      return stores.map((store) {
        return store.copyWith(
          distance: location.distanceBetween(
            Location(latitude: store.lat, longitude: store.lng),
          ),
        );
      }).toList()
        ..sort(
          (a, b) => a.distance.compareTo(b.distance),
        );
    }

    return stores;
  }
}
