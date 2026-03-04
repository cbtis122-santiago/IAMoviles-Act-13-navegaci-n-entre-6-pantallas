import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnim;
  late Animation<double> _scaleAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1200));
    _fadeAnim  = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _scaleAnim = Tween<double>(begin: 0.7, end: 1.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.elasticOut));
    _controller.forward();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/login');
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF0D0D0D),
              Color(0xFF1A0000),
              Color(0xFF3D0000),
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: FadeTransition(
              opacity: _fadeAnim,
              child: ScaleTransition(
                scale: _scaleAnim,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Imagen de hamburguesa grande
                    Container(
                      width: 180,
                      height: 180,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFFFF6F00),
                            blurRadius: 40,
                            spreadRadius: 10,
                          ),
                        ],
                      ),
                      child: ClipOval(
                        child: Image.network(
                          'https://raw.githubusercontent.com/cbtis122-santiago/UI_Exa1_0421_FSCC/refs/heads/main/hcarbon.jfif',
                          fit: BoxFit.cover,
                          errorBuilder: (c, e, s) => Container(
                            color: const Color(0xFF3D0000),
                            child: const Icon(Icons.local_fire_department,
                                color: Color(0xFFFF6F00), size: 80),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),

                    // Título principal
                    const Text(
                      '🔥 ALA BURGER',
                      style: TextStyle(
                        color: Color(0xFFFF6F00),
                        fontSize: 38,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 3,
                        shadows: [
                          Shadow(
                            color: Color(0xFFB71C1C),
                            blurRadius: 12,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'AL CARBÓN',
                      style: TextStyle(
                        color: Color(0xFFFFF176),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 6,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      width: 200,
                      height: 2,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            Color(0xFFFF6F00),
                            Colors.transparent
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Francisco Santiago Carrasco Correa\n6°I',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white38,
                        fontSize: 13,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(height: 60),
                    const SizedBox(
                      width: 28,
                      height: 28,
                      child: CircularProgressIndicator(
                        color: Color(0xFFFF6F00),
                        strokeWidth: 2.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}