import 'package:flutter/material.dart';

class CarritoScreen extends StatefulWidget {
  const CarritoScreen({super.key});

  @override
  State<CarritoScreen> createState() => _CarritoScreenState();
}

class _CarritoScreenState extends State<CarritoScreen> {
  List<Map<String, dynamic>> items = [
    {
      'nombre': 'Carne & Pollo',
      'precio': 180,
      'cantidad': 1,
      'emoji': '🍔',
      'imagen': 'https://raw.githubusercontent.com/cbtis122-santiago/UI_Exa1_0421_FSCC/refs/heads/main/hcarbon.jfif',
    },
    {
      'nombre': 'Triple',
      'precio': 250,
      'cantidad': 1,
      'emoji': '🍔',
      'imagen': 'https://raw.githubusercontent.com/cbtis122-santiago/UI_Exa1_0421_FSCC/refs/heads/main/hdoblefuego.jfif',
    },
  ];

  int get _total =>
      items.fold(0, (sum, i) => sum + (i['precio'] as int) * (i['cantidad'] as int));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A0A00),
        title: const Text(
          '🛒 Carrito',
          style: TextStyle(
            color: Color(0xFFFF6F00),
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
            icon: const Icon(Icons.home, color: Color(0xFFFFF176)),
            onPressed: () => Navigator.pushNamed(context, '/inicio'),
            tooltip: 'Inicio',
          ),
        ],
      ),
      body: items.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('🛒', style: TextStyle(fontSize: 60)),
                  const SizedBox(height: 16),
                  const Text(
                    'Tu carrito está vacío',
                    style: TextStyle(color: Colors.white54, fontSize: 18),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFB71C1C)),
                    onPressed: () => Navigator.pushNamed(context, '/menu'),
                    child: const Text('Ver Menú',
                        style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            )
          : Column(
              children: [
                // Lista de items
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.all(14),
                    itemCount: items.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 10),
                    itemBuilder: (context, index) {
                      final item = items[index];
                      return Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF1E1E1E),
                          borderRadius: BorderRadius.circular(14),
                          border:
                              Border.all(color: const Color(0xFF5D1010)),
                        ),
                        child: Row(
                          children: [
                            // Imagen
                            ClipRRect(
                              borderRadius: const BorderRadius.horizontal(
                                  left: Radius.circular(14)),
                              child: SizedBox(
                                width: 85,
                                height: 80,
                                child: Image.network(
                                  item['imagen'],
                                  fit: BoxFit.cover,
                                  errorBuilder: (c, e, s) => Container(
                                    color: const Color(0xFF3D0000),
                                    child: Center(
                                      child: Text(item['emoji'],
                                          style:
                                              const TextStyle(fontSize: 30)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            // Info
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 8),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item['nombre'],
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      '\$${item['precio']} MXN',
                                      style: const TextStyle(
                                          color: Color(0xFFFF6F00),
                                          fontSize: 13),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // Controles de cantidad
                            Padding(
                              padding: const EdgeInsets.only(right: 12),
                              child: Row(
                                children: [
                                  _qtyBtn(
                                    icon: Icons.remove,
                                    onTap: () {
                                      setState(() {
                                        if (item['cantidad'] > 1) {
                                          items[index]['cantidad']--;
                                        } else {
                                          items.removeAt(index);
                                        }
                                      });
                                    },
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Text(
                                      '${item['cantidad']}',
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  _qtyBtn(
                                    icon: Icons.add,
                                    onTap: () =>
                                        setState(() => items[index]['cantidad']++),
                                    color: const Color(0xFFB71C1C),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                // Resumen y botón
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    color: Color(0xFF1A1A1A),
                    border: Border(
                        top: BorderSide(color: Color(0xFF3D0000), width: 1.5)),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Subtotal:',
                              style: TextStyle(
                                  color: Colors.white54, fontSize: 14)),
                          Text('\$$_total MXN',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 14)),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('Envío:',
                              style: TextStyle(
                                  color: Colors.white54, fontSize: 14)),
                          Text('Gratis 🔥',
                              style: TextStyle(
                                  color: Color(0xFF66BB6A), fontSize: 14)),
                        ],
                      ),
                      const Divider(color: Color(0xFF3D0000), height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'TOTAL:',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '\$$_total MXN',
                            style: const TextStyle(
                              color: Color(0xFFFF6F00),
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 14),
                      SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFB71C1C),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                backgroundColor: const Color(0xFF1E1E1E),
                                title: const Text('🔥 ¡Pedido confirmado!',
                                    style: TextStyle(color: Color(0xFFFF6F00))),
                                content: Text(
                                    'Tu pedido por \$$_total MXN está en camino.',
                                    style:
                                        const TextStyle(color: Colors.white70)),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      setState(() => items.clear());
                                    },
                                    child: const Text('OK',
                                        style: TextStyle(
                                            color: Color(0xFFFF6F00))),
                                  ),
                                ],
                              ),
                            );
                          },
                          child: const Text(
                            '🔥  CONFIRMAR PEDIDO',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF0D0D0D),
        selectedItemColor: const Color(0xFFFF6F00),
        unselectedItemColor: Colors.white38,
        currentIndex: 2,
        type: BottomNavigationBarType.fixed,
        onTap: (i) {
          if (i == 0) Navigator.pushNamed(context, '/inicio');
          if (i == 1) Navigator.pushNamed(context, '/menu');
          if (i == 3) Navigator.pushNamed(context, '/sucursales');
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

  Widget _qtyBtn(
      {required IconData icon,
      required VoidCallback onTap,
      Color color = const Color(0xFF2C2C2C)}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Icon(icon, color: Colors.white, size: 16),
      ),
    );
  }
}