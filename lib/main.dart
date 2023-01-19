import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:go_router/go_router.dart';
import './screens/screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final GoRouter _router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: ((context, state) => NavScreen()),
    ),
    GoRoute(
      path: '/otherScreen',
      builder: (context, state) => const OtherScreen(),
    )
  ]);
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Netflix UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.black,
      ),
      // initialRoute: Routes.navScreen,
      // getPages: [
      //   GetPage(name: Routes.otherScreen, page: () => NavScreen()),
      //   GetPage(
      //     name: '/otherScreen',
      //     page: () => const OtherScreen(),
      //   )
      // ],
      routerDelegate: _router.routerDelegate,
      routeInformationParser: _router.routeInformationParser,
      routeInformationProvider: _router.routeInformationProvider,

      // home: NavScreen(),
    );
    // GetMaterialApp.router(
    //   title: 'Flutter Netflix UI',
    //   debugShowCheckedModeBanner: false,
    //   theme: ThemeData(
    //     primarySwatch: Colors.blue,
    //     visualDensity: VisualDensity.adaptivePlatformDensity,
    //     scaffoldBackgroundColor: Colors.black,
    //   ),
    //   // initialRoute: Routes.navScreen,
    //   getPages: [
    //     GetPage(name: Routes.otherScreen, page: () => NavScreen()),
    //     GetPage(
    //       name: '/otherScreen',
    //       page: () => const OtherScreen(),
    //     )
    //   ],
    //   routerDelegate: AppRouterDelegate(),

    //   // home: NavScreen(),
    // );
  }
}

class AppRouterDelegate extends GetDelegate {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      onPopPage: (route, result) => route.didPop(result),
      pages: currentConfiguration != null
          ? [currentConfiguration!.currentPage!]
          : [GetNavConfig.fromRoute(Routes.navScreen)!.currentPage!],
    );
  }
}

abstract class Routes {
  static const navScreen = '/';
  static const otherScreen = '/otherScreen';
}
