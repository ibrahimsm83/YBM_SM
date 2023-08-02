import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ybm/presentation/forgot_Password/forgot_password_screen.dart';
import 'package:ybm/presentation/signup/signup_screen.dart';
import 'package:ybm/presentation/splash/splash_screen.dart';
import 'package:ybm/presentation/verify/email_verify_screen.dart';
import 'package:ybm/presentation/verify/otp_verify_screen.dart';
import 'package:ybm/presentation/verify/verified_code_screen.dart';
import '../login/login_screen.dart';

/// The route configuration.
final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
    ),
    GoRoute(
      path: '/LoginPage',
      builder: (BuildContext context, GoRouterState state) {
        return const LoginView();
      },
    ),
    GoRoute(
      path: '/SignUp',
      builder: (BuildContext context, GoRouterState state) {
        return const SignUpView();
      },
    ),
    GoRoute(
      path: '/ForgotPassword',
      builder: (BuildContext context, GoRouterState state) {
        return const ForgotPasswordView();
      },
    ),
    GoRoute(
      path: '/OtpVerify',
      builder: (BuildContext context, GoRouterState state) {
        return const OtpVerifyView();
      },
    ),
    GoRoute(
      path: '/verifiedCode',
      builder: (BuildContext context, GoRouterState state) {
        return const VerifiedCodeView();
      },
    ),
    GoRoute(
      path: '/EmailOtpVerify/:email',
      builder: (BuildContext context, GoRouterState state) {
        return  EmailOtpVerifyView(email: state.pathParameters['email']??"");
      },
    ),

    // GoRoute(
    //   path: '/ConformationCode/:email',
    //   builder: (BuildContext context, GoRouterState state) {
    //     return ConformationCodeView(
    //       email: state.pathParameters['email'],
    //     );
    //   },
    // ),
  ],
);
