import 'dart:async';

import 'package:flutter/material.dart';

import '../../core/extensions/num_extensions.dart';
import '../../core/resources/assets_manager.dart';
import '../../core/resources/color_manager.dart';
import '../../core/resources/values_manager.dart';
import '../../core/routing/navigation_services.dart';
import '../../core/routing/routes.dart';
import '../../core/widgets/status_bar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Time.t600);
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _animationController.forward();
    _afterAnimation();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _afterAnimation() {
    Timer(
      Time.t2000,
      () => NavigationService.pushReplacement(context, Routes.layoutScreen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DarkStatusBar(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Center(
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: Image.asset(
              AppImages.logo,
              width: 200.h,
              height: 200.h,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
