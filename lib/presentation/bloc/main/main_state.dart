part of 'main_bloc.dart';

enum MainStatus {
  initial,
  loading,
  success,
  error,
}

class MainState extends Equatable {
  final List<Store> stores;
  final MainStatus mainStatus;
  const MainState({
    required this.stores,
    required this.mainStatus,
  });

  @override
  List<Object> get props => [stores, mainStatus];

  @override
  String toString() => 'MainState(stores: $stores, mainStatus: $mainStatus)';

  factory MainState.initial() {
    return const MainState(mainStatus: MainStatus.initial, stores: []);
  }

  MainState copyWith({
    List<Store>? stores,
    MainStatus? mainStatus,
  }) {
    return MainState(
      stores: stores ?? this.stores,
      mainStatus: mainStatus ?? this.mainStatus,
    );
  }
}
