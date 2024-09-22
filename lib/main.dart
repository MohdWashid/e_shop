import 'package:e_shop/core/cubitinjector.dart';
import 'package:e_shop/core/size_config.dart';
import 'package:e_shop/feautures/auth/presentation/signup.dart';
import 'package:e_shop/firebaseoption.dart';
import 'package:e_shop/helper/quickhelp.dart';
import 'package:e_shop/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

Future<void> initializeRemoteConfig() async {
  final remoteConfig = FirebaseRemoteConfig.instance;
  await remoteConfig.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(minutes: 1),
    minimumFetchInterval: const Duration(hours: 1),
  ));
  await remoteConfig.setDefaults({
    'show_discounted_price': true,
  });
  await remoteConfig.fetchAndActivate();
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initializeRemoteConfig();
  CubitsInjector();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return LayoutBuilder(
          builder: (context, constraints) {
            SizeConfig().init(constraints, MediaQuery.of(context).orientation);
            return MultiBlocProvider(
              providers: CubitsInjector.blocProviders,
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'eShop',
                theme: ThemeData(
                  scaffoldBackgroundColor: Colors.white,
                  colorScheme:
                      ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                  useMaterial3: true,
                ),
                darkTheme: ThemeData(
                  scaffoldBackgroundColor:
                      const Color.fromARGB(255, 10, 10, 10),
                  colorScheme: const ColorScheme.dark(
                    primary: Colors.deepPurple,
                    secondary: Colors.deepPurpleAccent,
                  ),
                  useMaterial3: true,
                ),
                themeMode: ThemeMode.system,
                onGenerateRoute: AppRoutes.onGenerateRoute,
                initialRoute: QuickHelp.getInitialRoute(),
                home: SignupScreen(),
              ),
            );
          },
        );
      },
    );
  }
}
