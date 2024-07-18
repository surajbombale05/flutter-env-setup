import 'dart:developer';

import 'package:env_setup/const/api_endpoints.dart';
import 'package:env_setup/const/bloc_provider.dart';
import 'package:env_setup/utils/api_base_model.dart';
import 'package:env_setup/utils/prefrences/local_prefrences.dart';
import 'package:env_setup/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_config.dart';

void main({String? env}) async {
  log("Starting app with env: $env"); // Add more detailed log statements
  WidgetsFlutterBinding.ensureInitialized();  // Ensure that the flutter engine is properly initialized and ready to handle tasks.
  await LocalStorageUtils.init(); // Initialize local storage in flutter
  final appConfig = await AppConfig().formEnviroment(env); // Setting environment variables in flutter
  Bloc.observer = MyBlocObserver();
  // usePathUrlStrategy(); // To remove # from the URL
  runApp(
    MultiBlocProvider(
      providers: blocProvider,
      child: MyApp(appConfig: appConfig),
    ),
  );
}

late ApiEndPoints apiEndPoints;

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
    required this.appConfig,
  });

  final ApiBaseModel appConfig;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _goRouter = Routes();

  @override
  void initState() {
    apiEndPoints = ApiEndPoints(apiBaseModel: widget.appConfig);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: Size(
        MediaQuery.of(context).size.width,
        MediaQuery.of(context).size.height,
      ),
      child: MaterialApp.router(
        title: 'env setup',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          pageTransitionsTheme: const PageTransitionsTheme(
            builders: {
              TargetPlatform.android: CupertinoPageTransitionsBuilder(),
              TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            },
          ),
        ),
        routeInformationParser: _goRouter.router.routeInformationParser,
        routerDelegate: _goRouter.router.routerDelegate,
        routeInformationProvider: _goRouter.router.routeInformationProvider,
      ),
    );
  }
}

class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    log("Created: $bloc");
    super.onCreate(bloc);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    log("Change in $bloc: $change");
    super.onChange(bloc, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    log("Transition in $bloc: $transition");
    super.onTransition(bloc, transition);
  }

  @override
  void onClose(BlocBase bloc) {
    log("Closed: $bloc");
    super.onClose(bloc);
  }
}
