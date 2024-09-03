import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mask_info_clean_arch/domain/entities/store.dart';
import 'package:mask_info_clean_arch/domain/usecases/get_near_by_stores_usecase.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final GetNearByStoresUsecase _getNearByStoresUsecase;

  MainBloc(
    this._getNearByStoresUsecase,
  ) : super(MainState.initial()) {
    on<GetStores>((event, emit) async {
      emit(state.copyWith(mainStatus: MainStatus.loading));

      emit(state.copyWith(
        stores: await _getNearByStoresUsecase.execute(),
        mainStatus: MainStatus.success,
      ));
    });
  }
}
