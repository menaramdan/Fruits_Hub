import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/core/routes/app_routes.dart';
import 'package:new_app/core/services/service_locator.dart';
import 'package:new_app/features/Auth/Domain/Auth_repo.dart';
import 'package:new_app/features/Auth/presentation/Cubit/cubit/signup_cubit.dart';
import 'package:new_app/features/Auth/presentation/Screens/login_screen.dart';
import 'package:new_app/features/Auth/presentation/Screens/signe_up_screen.dart';
import 'package:new_app/features/splash/presentation/screens/onboarding_screen.dart';
import 'package:new_app/features/splash/presentation/screens/splash_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.splashScreen:
      return MaterialPageRoute(builder: (_) => const SplashScreen());
    case AppRoutes.onboardingScreen:
      return MaterialPageRoute(builder: (_) => const OnboardingScreen());
    case AppRoutes.loginScreen:
      return MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (context) => SignupCubitCubit(getit<AuthRepo>()),
          child: const LoginScreen(),
        ),
      );
    case AppRoutes.signUpScreen:
      return MaterialPageRoute(builder: (_) => const SigneUpScreen());
    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(child: Text('No route defined for ${settings.name}')),
        ),
      );
  }
}
