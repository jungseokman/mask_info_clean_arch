import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mask_info_clean_arch/presentation/bloc/main/main_bloc.dart';
import 'package:mask_info_clean_arch/presentation/pages/main/widgets/store_item.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
    context.read<MainBloc>().add(GetStores());
  }

  @override
  Widget build(BuildContext context) {
    final mainBloc = context.watch<MainBloc>();
    final state = mainBloc.state;

    return Scaffold(
      appBar: AppBar(
        title: Text('마스크 재고 있는 곳: ${state.stores.length}곳'),
        centerTitle: true,
      ),
      body: switch (state.mainStatus) {
        MainStatus.initial => const SizedBox(),
        MainStatus.loading => const Center(
            child: CircularProgressIndicator(),
          ),
        MainStatus.success => ListView(
            children: state.stores
                .map(
                  (e) => StoreItem(store: e),
                )
                .toList()),
        MainStatus.error => const SizedBox(),
      },
    );
  }
}
