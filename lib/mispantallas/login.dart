import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController    = TextEditingController();
  final _passController     = TextEditingController();
  bool _obscure = true;

  InputDecoration _inputDec(String hint, IconData icon) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: Colors.white38),
      prefixIcon: Icon(icon, color: const Color(0xFFFF6F00)),
      filled: true,
      fillColor: const Color(0xFF2A0A0A),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFF5D1010)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFFF6F00), width: 2),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF110000),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A0000),
        elevation: 0,
        title: const Text(
          '🔥 AlaBurger | Inicio Sesión',
          style: TextStyle(
            color: Color(0xFFFF6F00),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.local_fire_department, color: Color(0xFFFFF176)),
            onPressed: () {},
            tooltip: 'Promociones',
          ),
          IconButton(
            icon: const Icon(Icons.help_outline, color: Color(0xFFFFF176)),
            onPressed: () {},
            tooltip: 'Ayuda',
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Logo pequeño + título
            Center(
              child: Column(
                children: [
                  Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: const Color(0xFFFF6F00), width: 3),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFFF6F00),
                          blurRadius: 20,
                          spreadRadius: 4,
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
                              color: Color(0xFFFF6F00), size: 40),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  const Text(
                    'Bienvenido de vuelta',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                      letterSpacing: 1,
                    ),
                  ),
                  const Text(
                    'Inicia sesión para ordenar',
                    style: TextStyle(
                      color: Color(0xFFFF6F00),
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 36),

            // Correo electrónico
            const Text(
              '📧  Correo Electrónico',
              style: TextStyle(
                color: Color(0xFFFFF176),
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              style: const TextStyle(color: Colors.white),
              decoration: _inputDec('tucorreo@email.com', Icons.email_outlined),
            ),

            const SizedBox(height: 20),

            // Contraseña
            const Text(
              '🔒  Contraseña',
              style: TextStyle(
                color: Color(0xFFFFF176),
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _passController,
              obscureText: _obscure,
              style: const TextStyle(color: Colors.white),
              decoration: _inputDec('••••••••', Icons.lock_outline).copyWith(
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscure ? Icons.visibility_off : Icons.visibility,
                    color: const Color(0xFFFF6F00),
                  ),
                  onPressed: () => setState(() => _obscure = !_obscure),
                ),
              ),
            ),

            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  '¿Olvidaste tu contraseña?',
                  style: TextStyle(color: Color(0xFFFF6F00), fontSize: 12),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Botón INGRESAR
            SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFB71C1C),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)),
                  elevation: 6,
                  shadowColor: const Color(0xFFFF6F00),
                ),
                onPressed: () => Navigator.pushReplacementNamed(context, '/inicio'),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.local_fire_department, size: 20),
                    SizedBox(width: 8),
                    Text(
                      'INGRESAR',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Registrarse
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('¿No tienes cuenta? ',
                    style: TextStyle(color: Colors.white54, fontSize: 13)),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/inicio'),
                  child: const Text(
                    'Regístrate aquí',
                    style: TextStyle(
                      color: Color(0xFFFF6F00),
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      decoration: TextDecoration.underline,
                      decorationColor: Color(0xFFFF6F00),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 40),

            // Footer
            Center(
              child: Text(
                'Francisco Santiago Carrasco Correa · 6°I',
                style: TextStyle(color: Colors.white, fontSize: 11),
              ),
            ),
          ],
        ),
      ),
    );
  }
}