import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mask_info_clean_arch/di/di_setup.dart';
import 'package:mask_info_clean_arch/presentation/bloc/main/main_bloc.dart';
import 'package:mask_info_clean_arch/presentation/pages/main/main_page.dart';

final router = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => BlocProvider(
        create: (context) => getIt.get<MainBloc>(),
        child: const MainPage(),
      ),
    ),
  ],
);
