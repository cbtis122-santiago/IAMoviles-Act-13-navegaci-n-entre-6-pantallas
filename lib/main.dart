import 'package:flutter/material.dart';
import 'mispantallas/splash.dart';
import 'mispantallas/login.dart';
import 'mispantallas/inicio.dart';
import 'mispantallas/menu.dart';
import 'mispantallas/carrito.dart';
import 'mispantallas/sucursales.dart';

void main() {
  runApp(const AlaBurgerApp());
}

class AlaBurgerApp extends StatelessWidget {
  const AlaBurgerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AlaBurger al Carbón',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFB71C1C)),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/':          (context) => const SplashScreen(),
        '/login':     (context) => const LoginScreen(),
        '/inicio':    (context) => const InicioScreen(),
        '/menu':      (context) => const MenuScreen(),
        '/carrito':   (context) => const CarritoScreen(),
        '/sucursales':(context) => const SucursalesScreen(),
      },
    );
  }
}