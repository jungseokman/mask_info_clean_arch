import 'package:flutter_test/flutter_test.dart';
import 'package:mask_info_clean_arch/data/mock_datas.dart';
import 'package:mask_info_clean_arch/domain/usecases/get_near_by_stores_usecase.dart';

void main() {
  final useCase = GetNearByStoresUsecase(
    storeRepository: MockStoreRepositoryImpl(),
    locationRepository: MockLocationRepositoryImpl(),
    locationPermissionHendler: MockLocationPermissionHandler(),
  );
  test('약국 정보가 가까운 순서대로 오름차순 정렬되어야 한다', () async {
    final stores = await useCase.execute();

    expect(stores[0].name, "인천약국");
    expect(stores[1].name, "대전약국");
    expect(stores[2].name, "서울약국");
  });
}
