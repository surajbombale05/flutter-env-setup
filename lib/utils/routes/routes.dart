
import 'package:env_setup/app_features/home_screen/home_screen.dart';
import 'package:go_router/go_router.dart';


class Routes {
  static const String homeScreen = '/homescreen';

  GoRouter get router => _goRouter;

  late final GoRouter _goRouter = GoRouter(
    initialLocation: homeScreen,
    routes: [
      GoRoute(
        path: homeScreen,
        builder: (context, state) => const HomeScreen(),
      ),
      
    ],
  );
}
