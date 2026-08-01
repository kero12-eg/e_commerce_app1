import 'package:e_commerce_app/Core/Routing/app_router.dart';
import 'package:e_commerce_app/Core/Styling/app_assets.dart';
import 'package:e_commerce_app/Core/utils/service_locator.dart';
import 'package:e_commerce_app/Core/utils/storage_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController animationcontroller;
  late Animation<double> animation;
  @override
  void initState() {
    super.initState();
    animationcontroller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500,seconds: 1),
    );
    animationcontroller.repeat(reverse: true);
    animation = CurvedAnimation(
      parent: animationcontroller,
      curve: Curves.easeOut,
    );
    waitAndNavigate();
  }
  void waitAndNavigate() async {
    await Future.delayed(const Duration(seconds: 3));
    checkLogin();
  }
 Future<void> checkLogin() async {
  final accessToken = await sl<StorageHelper>().getAccessToken();
  final refreshToken = await sl<StorageHelper>().getRefreshToken();

  if (accessToken != null &&
      accessToken.isNotEmpty &&
      refreshToken != null &&
      refreshToken.isNotEmpty) {
    context.pushReplacementNamed(AppRouter.home);
  }
  else {
    context.pushReplacementNamed(AppRouter.login);
  }
}
@override
  void dispose() {
    animationcontroller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ScaleTransition(
          scale: animation,
          child: Image.asset(AppAssets.logo, width: 200.w, height: 200.h),
        ),
      ),
    );
  }
}
