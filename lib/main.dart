import 'package:diamond_cart/core/constants/constants.dart';
import 'package:diamond_cart/core/routes/app_routes.dart';
import 'package:diamond_cart/core/utils/utils.dart';
import 'package:diamond_cart/injector.dart';
import 'package:diamond_cart/model/cart.dart';
import 'package:diamond_cart/model/diamond.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(DiamondAdapter());
  Hive.registerAdapter(CartAdapter());
  await Hive.openBox<Diamond>('diamonds'); // Box for diamonds
  await Hive.openBox<Cart>('cart');
  Injector.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeUtils.theme,
      navigatorKey: navigatorKey,
      initialRoute: Routes.dashboard,
      onGenerateRoute: RouteGenerator.generateRoute,
      builder: (context, child) {
        print("main");

        return ScrollConfiguration(
          behavior: const ScrollBehaviorModified(),
          child: LayoutBuilder(
            builder: (context, constraints) {
              print("main ${constraints.constrainWidth()}");

              return OrientationBuilder(builder: (context, orientation){
                print("main $orientation");
                if(orientation == Orientation.portrait){
                  print("main portrait");
                  ScreenUtil.init(
                    constraints,
                    designSize: Size(430, 932),
                  );
                  return child ?? const SizedBox.shrink();
                }else{
                  ScreenUtil.init(
                    constraints,
                    designSize: Size(932, 430),
                  );
                  return child ?? const SizedBox.shrink();
                }
              });

            },
          ),
        );
      },
    );
  }
}



class ScrollBehaviorModified extends ScrollBehavior {
  const ScrollBehaviorModified();
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    switch (getPlatform(context)) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return const ClampingScrollPhysics();
    }
  }
}
