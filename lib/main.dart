import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/resources/theme_manager.dart';
import 'core/services/bloc_observer.dart';
import 'core/services/network/dio_factory.dart';
import 'core/routing/route_generator.dart';
import 'core/routing/routes.dart';
import 'core/services/local_database/cart_database.dart';
import 'modules/cart/view_models/cart_viewmodel/cart_viewmodel.dart';
import 'modules/layout/viewmodels/layout_viewmodel/layout_view_model.dart';
import 'modules/products/viewmodels/products_viewmodel/products_viewmodel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioFactory.init();
  await CartDatabaseHelper.instance.database;

  BlocOverrides.runZoned(
    () {
      runApp(
        MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => LayoutViewModel(),
            ),
            BlocProvider(
              create: (_) => ProductsViewModel(),
            ),
            BlocProvider(
              create: (_) => CartViewModel(),
            ),
          ],
          child: const MyApp(),
        ),
      );
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Matrix clouds task',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: Routes.splashScreen,
      onGenerateRoute: RouteGenerator.generateRoute,
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child!,
        );
      },
    );
  }
}
