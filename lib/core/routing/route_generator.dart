import 'package:flutter/material.dart';
import 'package:mc_task/modules/products/screens/category_products_screen.dart';

import '../../modules/cart/screens/cart_screen.dart';
import '../../modules/layout/screens/layout.dart';
import '../../modules/products/screens/home_screen.dart';
import '../../modules/products/screens/product_details_screen.dart';
import '../../modules/ui_screens/splash_screen.dart';
import '../resources/strings_manager.dart';
import '../widgets/custom_text.dart';
import '../widgets/status_bar.dart';
import 'platform_routing.dart';
import 'routes.dart';

class RouteGenerator {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return platformPageRoute(const SplashScreen());
      case Routes.layoutScreen:
        return platformPageRoute(const LayoutScreen());
      case Routes.homeScreen:
        return platformPageRoute(const HomeScreen());
      case Routes.productDetailsScreen:
        final arguments = settings.arguments as Map<String, dynamic>;
        return platformPageRoute(ProductDetailsScreen(arguments["product_id"]));
      case Routes.categoryProductsScreen:
        final arguments = settings.arguments as Map<String, dynamic>;
        return platformPageRoute(
          CategoryProductsScreen(arguments["cat_id"], arguments["cat_name"]),
        );
      case Routes.cartScreen:
        return platformPageRoute(const CartScreen());
      default:
        return platformPageRoute(_noRouteScreen());
    }
  }

  static Widget _noRouteScreen() => const DarkStatusBar(
        child: Scaffold(
          body: Center(
            child: CustomText(AppStrings.noRouteFound),
          ),
        ),
      );
}
