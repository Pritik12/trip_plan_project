import 'package:get/get.dart';
import 'package:jotrip/app/modules/sign_in/sign_in_screen.dart';
import '../modules/create_trip/bindings/create_trip_binding.dart';
import '../modules/create_trip/views/create_trip_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/sign_in/sign_in_binding.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SIGN_IN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_TRIP,
      page: () => const CreateTripView(),
      binding: CreateTripBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_IN,
      page: () =>  SignInScreen(),
      binding: SignInBinding(),
    ),

  ];
}
