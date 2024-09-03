import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:mask_info_clean_arch/domain/entities/location.dart';
import 'package:mask_info_clean_arch/domain/repositories/location_repository.dart';

@prod
@Singleton(as: LocationRepository)
class LocationRepositoryImpl implements LocationRepository {
  @override
  Future<Location> getLocation() async {
    final position = await Geolocator.getCurrentPosition(
        locationSettings:
            const LocationSettings(accuracy: LocationAccuracy.high));

    return Location(latitude: position.latitude, longitude: position.longitude);
  }
}
