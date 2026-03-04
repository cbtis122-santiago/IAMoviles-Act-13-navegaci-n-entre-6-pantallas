import 'package:flutter/material.dart';

class SucursalesScreen extends StatelessWidget {
  const SucursalesScreen({super.key});

  static const List<Map<String, dynamic>> sucursales = [
    {
      'nombre': 'AnaPra',
      'direccion': 'Fracc. AnaPra, Cd. Juárez',
      'horario': 'Lun–Dom 10:00–22:00',
      'telefono': '656-100-0001',
      'color': Color(0xFF3D0000),
      'emoji': '📍',
    },
    {
      'nombre': 'Av. Ejército Nacional',
      'direccion': 'Av. Ejército Nacional, Cd. Juárez',
      'horario': 'Lun–Dom 10:00–23:00',
      'telefono': '656-100-0002',
      'color': Color(0xFF1A0A00),
      'emoji': '📍',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      appBar: AppBar(
        backgroundColor: const Color(0xFF3D0000),
        title: const Text(
          '📍 Sucursales',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu_book, color: Color(0xFFFFF176)),
            onPressed: () => Navigator.pushNamed(context, '/menu'),
            tooltip: 'Menú',
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined,
                color: Color(0xFFFFF176)),
            onPressed: () => Navigator.pushNamed(context, '/carrito'),
            tooltip: 'Carrito',
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Container(
              width: double.infinity,
              padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF3D0000), Color(0xFF1A0000)],
                ),
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '🔥 Encuéntranos',
                    style: TextStyle(
                        color: Color(0xFFFF6F00),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Dos ubicaciones para servirte en Cd. Juárez',
                    style: TextStyle(color: Colors.white60, fontSize: 13),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 18),

            // Tarjetas de sucursales
            ...sucursales.map((s) => _SucursalCard(sucursal: s)),

            const SizedBox(height: 20),

            // Mapa estático visual (ambas sucursales)
            const Text(
              'Mapa de ubicaciones',
              style: TextStyle(
                color: Color(0xFFFFF176),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            _MapaVisual(),

            const SizedBox(height: 20),

            // Footer info
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: const Color(0xFF1A1A1A),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFF3D0000)),
              ),
              child: const Column(
                children: [
                  Text(
                    '🍔 AlaBurger al Carbón',
                    style: TextStyle(
                        color: Color(0xFFFF6F00),
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Francisco Santiago Carrasco Correa · 6°I',
                    style: TextStyle(color: Colors.white38, fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF0D0D0D),
        selectedItemColor: const Color(0xFFFF6F00),
        unselectedItemColor: Colors.white38,
        currentIndex: 3,
        type: BottomNavigationBarType.fixed,
        onTap: (i) {
          if (i == 0) Navigator.pushNamed(context, '/inicio');
          if (i == 1) Navigator.pushNamed(context, '/menu');
          if (i == 2) Navigator.pushNamed(context, '/carrito');
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: 'Menú'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined), label: 'Carrito'),
          BottomNavigationBarItem(
              icon: Icon(Icons.place_outlined), label: 'Sucursales'),
        ],
      ),
    );
  }
}

class _SucursalCard extends StatelessWidget {
  final Map<String, dynamic> sucursal;
  const _SucursalCard({required this.sucursal});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFF5D1010), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFB71C1C),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Mapa mini simulado
          ClipRRect(
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(14)),
            child: Container(
              height: 130,
              width: double.infinity,
              color: const Color(0xFF1B4D1B),
              child: Stack(
                children: [
                  // Calles simuladas
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 55,
                    child: Container(height: 22, color: const Color(0xFFE0C48A)),
                  ),
                  Positioned(
                    top: 0,
                    bottom: 0,
                    left: 80,
                    child: Container(width: 20, color: const Color(0xFFE0C48A)),
                  ),
                  Positioned(
                    top: 0,
                    bottom: 0,
                    right: 90,
                    child: Container(width: 14, color: const Color(0xFFD4B87A)),
                  ),
                  // Manzanas verdes
                  Positioned(
                    left: 10,
                    top: 10,
                    child: Container(
                        width: 60,
                        height: 42,
                        color: const Color(0xFF2D7A2D)),
                  ),
                  Positioned(
                    right: 10,
                    top: 10,
                    child: Container(
                        width: 80,
                        height: 42,
                        color: const Color(0xFF2D7A2D)),
                  ),
                  Positioned(
                    left: 10,
                    bottom: 8,
                    child: Container(
                        width: 60,
                        height: 38,
                        color: const Color(0xFF2D7A2D)),
                  ),
                  Positioned(
                    right: 10,
                    bottom: 8,
                    child: Container(
                        width: 80,
                        height: 38,
                        color: const Color(0xFF2D7A2D)),
                  ),
                  // Pin de ubicación
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 36,
                          height: 36,
                          decoration: const BoxDecoration(
                            color: Color(0xFFB71C1C),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black54,
                                  blurRadius: 8,
                                  offset: Offset(0, 3)),
                            ],
                          ),
                          child: const Icon(Icons.local_fire_department,
                              color: Colors.white, size: 22),
                        ),
                        Container(
                          width: 4,
                          height: 12,
                          color: const Color(0xFFB71C1C),
                        ),
                      ],
                    ),
                  ),
                  // Etiqueta del nombre
                  Positioned(
                    top: 8,
                    left: 10,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: const Color(0xFFB71C1C),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        sucursal['nombre'],
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Información
          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${sucursal['emoji']}  ${sucursal['nombre']}',
                  style: const TextStyle(
                    color: Color(0xFFFF6F00),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                _infoRow(Icons.location_on_outlined, sucursal['direccion']),
                const SizedBox(height: 4),
                _infoRow(Icons.access_time, sucursal['horario']),
                const SizedBox(height: 4),
                _infoRow(Icons.phone_outlined, sucursal['telefono']),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: Colors.white38, size: 15),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(color: Colors.white60, fontSize: 13),
          ),
        ),
      ],
    );
  }
}

class _MapaVisual extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF1B4D1B),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFF3D0000)),
      ),
      child: Stack(
        children: [
          // Calles horizontales
          Positioned(
              left: 0,
              right: 0,
              top: 60,
              child: Container(height: 18, color: const Color(0xFFE0C48A))),
          Positioned(
              left: 0,
              right: 0,
              top: 110,
              child: Container(height: 14, color: const Color(0xFFD4B87A))),
          // Calle vertical
          Positioned(
              top: 0,
              bottom: 0,
              left: 120,
              child: Container(width: 16, color: const Color(0xFFE0C48A))),
          Positioned(
              top: 0,
              bottom: 0,
              right: 80,
              child: Container(width: 12, color: const Color(0xFFD4B87A))),
          // Manzanas
          Positioned(
              left: 10,
              top: 10,
              child: Container(
                  width: 100,
                  height: 46,
                  color: const Color(0xFF2D7A2D))),
          Positioned(
              right: 10,
              top: 10,
              child: Container(
                  width: 70,
                  height: 46,
                  color: const Color(0xFF2D7A2D))),
          Positioned(
              left: 10,
              bottom: 10,
              child: Container(
                  width: 100,
                  height: 34,
                  color: const Color(0xFF2D7A2D))),
          Positioned(
              right: 10,
              bottom: 10,
              child: Container(
                  width: 70,
                  height: 34,
                  color: const Color(0xFF2D7A2D))),
          // Pin 1 - AnaPra
          Positioned(
            left: 60,
            top: 20,
            child: _pin('AnaPra'),
          ),
          // Pin 2 - Ejército Nacional
          Positioned(
            right: 40,
            top: 20,
            child: _pin('Ej. Nacional'),
          ),
        ],
      ),
    );
  }

  Widget _pin(String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
          decoration: BoxDecoration(
            color: const Color(0xFFB71C1C),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(label,
              style:
                  const TextStyle(color: Colors.white, fontSize: 8)),
        ),
        Container(
          width: 3,
          height: 8,
          color: const Color(0xFFB71C1C),
        ),
        const Icon(Icons.location_on,
            color: Color(0xFFFF6F00), size: 18),
      ],
    );
  }
}