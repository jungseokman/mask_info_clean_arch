import 'package:injectable/injectable.dart';
import 'package:mask_info_clean_arch/data/datasources/store_api.dart';
import 'package:mask_info_clean_arch/domain/entities/store.dart';
import 'package:mask_info_clean_arch/domain/repositories/store_repository.dart';

@prod
@Singleton(as: StoreRepository)
class StoreRepositoryImpl implements StoreRepository {
  final _api = StoreApi();

  @override
  Future<List<Store>> getStores() async {
    final result = await _api.getStoreResult();

    if (result.stores == null) {
      return [];
    }

    return result.stores!
        .where(
          (element) {
            return element.createdAt != null && element.stockAt != null;
          },
        )
        .map(
          (e) => Store(
            address: e.addr ?? "",
            name: e.name ?? "",
            lat: e.lng ?? 0,
            lng: e.lng ?? 0,
            remainStatus: e.remainStat!,
          ),
        )
        .toList();
  }
}
