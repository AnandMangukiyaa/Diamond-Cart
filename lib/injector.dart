
import 'package:diamond_cart/blocs/cart/cart_bloc.dart';
import 'package:diamond_cart/blocs/filter/filter_cubit.dart';
import 'package:get_it/get_it.dart';

class Injector {
  Injector._();

  static void init() {
    // Repositories
    GetIt.I.registerLazySingleton(() => FilterCubit());
    GetIt.I.registerLazySingleton(() => CartCubit());
  }
}
