import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final List<Map<String, dynamic>> _productos = [
    {
      'nombre': 'Carne & Pollo',
      'precio': 180,
      'descripcion': 'Al carbón con verduras frescas',
      'emoji': '🍔',
      'imagen': 'https://raw.githubusercontent.com/cbtis122-santiago/UI_Exa1_0421_FSCC/refs/heads/main/hcarbon.jfif',
      'enCarrito': false,
    },
    {
      'nombre': 'Triple',
      'precio': 250,
      'descripcion': 'Triple carne con doble queso',
      'emoji': '🍔',
      'imagen': 'https://raw.githubusercontent.com/cbtis122-santiago/UI_Exa1_0421_FSCC/refs/heads/main/hdoblefuego.jfif',
      'enCarrito': false,
    },
    {
      'nombre': 'Ultra Queso',
      'precio': 250,
      'descripcion': 'Queso derretido extra y tocino',
      'emoji': '🧀',
      'imagen': 'https://raw.githubusercontent.com/cbtis122-santiago/UI_Exa1_0421_FSCC/refs/heads/main/hbbqmaster.jfif',
      'enCarrito': false,
    },
    {
      'nombre': 'Gaseosa',
      'precio': 25,
      'descripcion': 'Coca-Cola, Pepsi o refresco del día',
      'emoji': '🥤',
      'imagen': 'https://raw.githubusercontent.com/cbtis122-santiago/UI_Exa1_0421_FSCC/refs/heads/main/dc.jfif',
      'enCarrito': false,
    },
    {
      'nombre': 'Vegana',
      'precio': 150,
      'descripcion': 'Sin carne, llena de sabor',
      'emoji': '🥗',
      'imagen': 'https://raw.githubusercontent.com/cbtis122-santiago/UI_Exa1_0421_FSCC/refs/heads/main/hcarbon.jfif',
      'enCarrito': false,
    },
    {
      'nombre': 'Sencilla',
      'precio': 120,
      'descripcion': 'Clásica al carbón con queso',
      'emoji': '🍔',
      'imagen': 'https://raw.githubusercontent.com/cbtis122-santiago/UI_Exa1_0421_FSCC/refs/heads/main/hdoblefuego.jfif',
      'enCarrito': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: const Color(0xFF3D0000),
        title: const Text(
          '⭐ Menú AlaBurger',
          style: TextStyle(
            color: Color(0xFFFFF176),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined,
                color: Color(0xFFFFF176)),
            onPressed: () => Navigator.pushNamed(context, '/carrito'),
          ),
          IconButton(
            icon: const Icon(Icons.place_outlined, color: Color(0xFFFFF176)),
            onPressed: () => Navigator.pushNamed(context, '/sucursales'),
          ),
        ],
      ),
      body: Column(
        children: [
          // Header decorativo
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF3D0000), Color(0xFF121212)],
              ),
            ),
            child: const Text(
              '🔥  Sucursales Promo · Todo al carbón · Envío disponible',
              style: TextStyle(color: Color(0xFFFF6F00), fontSize: 12),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),

          // Lista de productos
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(12),
              itemCount: _productos.length,
              separatorBuilder: (_, __) => const SizedBox(height: 10),
              itemBuilder: (context, index) {
                final p = _productos[index];
                return Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF1E1E1E),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: const Color(0xFF5D1010)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      // Imagen del producto
                      ClipRRect(
                        borderRadius: const BorderRadius.horizontal(
                            left: Radius.circular(14)),
                        child: SizedBox(
                          width: 100,
                          height: 90,
                          child: Image.network(
                            p['imagen'],
                            fit: BoxFit.cover,
                            errorBuilder: (c, e, s) => Container(
                              color: const Color(0xFF3D0000),
                              child: Center(
                                child: Text(p['emoji'],
                                    style: const TextStyle(fontSize: 36)),
                              ),
                            ),
                          ),
                        ),
                      ),

                      // Info
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                p['nombre'],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(height: 3),
                              Text(
                                p['descripcion'],
                                style: const TextStyle(
                                    color: Colors.white54, fontSize: 12),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '\$${p['precio']} MXN',
                                    style: const TextStyle(
                                      color: Color(0xFFFF6F00),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _productos[index]['enCarrito'] =
                                            !_productos[index]['enCarrito'];
                                      });
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text(
                                            '${p['nombre']} ${_productos[index]['enCarrito'] ? 'agregado ✅' : 'quitado'}'),
                                        backgroundColor:
                                            const Color(0xFF3D0000),
                                        duration:
                                            const Duration(seconds: 1),
                                      ));
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 14, vertical: 6),
                                      decoration: BoxDecoration(
                                        color: p['enCarrito']
                                            ? const Color(0xFF2E7D32)
                                            : const Color(0xFFB71C1C),
                                        borderRadius:
                                            BorderRadius.circular(20),
                                      ),
                                      child: Text(
                                        p['enCarrito'] ? '✓ Listo' : '+ Agregar',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF0D0D0D),
        selectedItemColor: const Color(0xFFFF6F00),
        unselectedItemColor: Colors.white38,
        currentIndex: 1,
        type: BottomNavigationBarType.fixed,
        onTap: (i) {
          if (i == 0) Navigator.pushNamed(context, '/inicio');
          if (i == 2) Navigator.pushNamed(context, '/carrito');
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
}