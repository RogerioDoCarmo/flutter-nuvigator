import 'package:flutter/material.dart';
import 'package:proj/core/app_colors.dart';

import 'package:proj/models/producer_model.dart';
import 'package:proj/screens/favorites_screen.dart';

import 'package:proj/screens/home_screen.dart';
import 'package:proj/screens/package_details_screen.dart';
import 'package:proj/screens/payment_screen.dart';
import 'package:proj/screens/producer_details_screen.dart';
import 'package:proj/screens/profile_screen.dart';
import 'package:proj/screens/singup_screen.dart';

import 'screens/login_screen.dart';

class RouteGenetator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case 'home':
        return MaterialPageRoute(
          builder: (_) => HomeScreen(),
        );
      case 'login':
        return MaterialPageRoute(
          builder: (_) => LoginScreen(),
        );
      case 'sing-up':
        return MaterialPageRoute(
          builder: (_) => SingupScreen(),
        );
      case 'favorites':
        return MaterialPageRoute(
          builder: (_) => FavoritesScreen(),
        );
      case 'profile':
        return MaterialPageRoute(
          builder: (_) => ProfileScreen(),
        );
      case 'payment':
        return MaterialPageRoute(
          builder: (_) => PaymentScreen(),
        );

      case 'producer-details':
        if (args is Producer) {
          return MaterialPageRoute(
            builder: (_) => ProducerDetailsScreen(
              producer: args,
            ),
          );
        }

        return _errorRoute();
      case 'package-details':
        if (args is Map) {
          return MaterialPageRoute(
            builder: (_) => PackageDetailsScreen(
              package: args["package"],
              producer: args["producer"],
            ),
          );
        }

        return _errorRoute();
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.green,
            title: Text('Erro'),
          ),
          body: Center(
            child: Text('ERRO, rota não encontrada!'),
          ),
        ),
      );
    });
  }
}
