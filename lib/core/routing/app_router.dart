import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/di/service_locator.dart';
import 'package:fruit_hub/core/routing/routes.dart';
import 'package:fruit_hub/core/widgets/no_route_defined_screen.dart';
import 'package:fruit_hub/features/forgot_password/presentation/screens/forgot_password_screen.dart';
import 'package:fruit_hub/features/home/presentation/screens/home_screen.dart';
import 'package:fruit_hub/features/login/presentation/controller/login_cubit/login_cubit.dart';
import 'package:fruit_hub/features/login/presentation/screens/login_screen.dart';
import 'package:fruit_hub/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:fruit_hub/features/signup/presentation/controller/signup_cubit/signup_cubit.dart';
import 'package:fruit_hub/features/signup/presentation/screens/signup_screen.dart';
import 'package:fruit_hub/features/splash/presentation/screens/splash_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case Routes.onboarding:
        return MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),
        );
      case Routes.login:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );
      case Routes.signup:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SignupCubit>(),
            child: const SignupScreen(),
          ),
        );
      case Routes.forgotPassword:
        return MaterialPageRoute(
          builder: (_) => const ForgotPasswordScreen(),
        );
      case Routes.home:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const NoRouteDefinedScreen(),
        );
    }
  }
}
