// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:mask_info_clean_arch/data/mock_datas.dart' as _i399;
import 'package:mask_info_clean_arch/data/permission/location_permission_handler_impl.dart'
    as _i148;
import 'package:mask_info_clean_arch/data/repositories/location_repository_impl.dart'
    as _i472;
import 'package:mask_info_clean_arch/data/repositories/store_repository_impl.dart'
    as _i76;
import 'package:mask_info_clean_arch/domain/permission/location_permission_hendler.dart'
    as _i772;
import 'package:mask_info_clean_arch/domain/repositories/location_repository.dart'
    as _i51;
import 'package:mask_info_clean_arch/domain/repositories/store_repository.dart'
    as _i1018;
import 'package:mask_info_clean_arch/domain/usecases/get_near_by_stores_usecase.dart'
    as _i327;
import 'package:mask_info_clean_arch/presentation/bloc/main/main_bloc.dart'
    as _i1041;

const String _dev = 'dev';
const String _prod = 'prod';

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i51.LocationRepository>(
      () => _i399.MockLocationRepositoryImpl(),
      registerFor: {_dev},
    );
    gh.singleton<_i772.LocationPermissionHendler>(
      () => _i399.MockLocationPermissionHandler(),
      registerFor: {_dev},
    );
    gh.singleton<_i1018.StoreRepository>(
      () => _i399.MockStoreRepositoryImpl(),
      registerFor: {_dev},
    );
    gh.singleton<_i772.LocationPermissionHendler>(
      () => _i148.LocationPermissionHandlerImpl(),
      registerFor: {_prod},
    );
    gh.singleton<_i1018.StoreRepository>(
      () => _i76.StoreRepositoryImpl(),
      registerFor: {_prod},
    );
    gh.singleton<_i51.LocationRepository>(
      () => _i472.LocationRepositoryImpl(),
      registerFor: {_prod},
    );
    gh.singleton<_i327.GetNearByStoresUsecase>(
        () => _i327.GetNearByStoresUsecase(
              storeRepository: gh<_i1018.StoreRepository>(),
              locationRepository: gh<_i51.LocationRepository>(),
              locationPermissionHendler: gh<_i772.LocationPermissionHendler>(),
            ));
    gh.factory<_i1041.MainBloc>(
        () => _i1041.MainBloc(gh<_i327.GetNearByStoresUsecase>()));
    return this;
  }
}
