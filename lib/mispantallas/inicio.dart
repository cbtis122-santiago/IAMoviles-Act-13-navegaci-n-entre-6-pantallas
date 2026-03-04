import 'package:flutter/material.dart';

class InicioScreen extends StatelessWidget {
  const InicioScreen({super.key});

  static const List<Map<String, String>> categorias = [
    {
      'nombre': 'Carne & Pollo',
      'imagen': 'https://raw.githubusercontent.com/cbtis122-santiago/UI_Exa1_0421_FSCC/refs/heads/main/hcarbon.jfif',
      'emoji': '🍖',
    },
    {
      'nombre': 'Triple',
      'imagen': 'https://raw.githubusercontent.com/cbtis122-santiago/UI_Exa1_0421_FSCC/refs/heads/main/hdoblefuego.jfif',
      'emoji': '🍔',
    },
    {
      'nombre': 'Ultra Queso',
      'imagen': 'https://raw.githubusercontent.com/cbtis122-santiago/UI_Exa1_0421_FSCC/refs/heads/main/hbbqmaster.jfif',
      'emoji': '🧀',
    },
    {
      'nombre': 'Gaseosas',
      'imagen': 'https://raw.githubusercontent.com/cbtis122-santiago/UI_Exa1_0421_FSCC/refs/heads/main/dc.jfif',
      'emoji': '🥤',
    },
    {
      'nombre': 'Vegana',
      'imagen': 'https://raw.githubusercontent.com/cbtis122-santiago/UI_Exa1_0421_FSCC/refs/heads/main/hcarbon.jfif',
      'emoji': '🥗',
    },
    {
      'nombre': 'Sencilla',
      'imagen': 'https://raw.githubusercontent.com/cbtis122-santiago/UI_Exa1_0421_FSCC/refs/heads/main/hdoblefuego.jfif',
      'emoji': '🍔',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      appBar: AppBar(
        backgroundColor: const Color(0xFFB71C1C),
        automaticallyImplyLeading: false,
        title: const Text(
          '🔥 AlaBurger | Inicio',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined, color: Colors.white),
            onPressed: () => Navigator.pushNamed(context, '/carrito'),
            tooltip: 'Carrito',
          ),
          IconButton(
            icon: const Icon(Icons.place_outlined, color: Colors.white),
            onPressed: () => Navigator.pushNamed(context, '/sucursales'),
            tooltip: 'Sucursales',
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Banner superior
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF3D0000), Color(0xFF1A1A1A)],
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '¡Bienvenido!',
                        style: TextStyle(
                          color: Color(0xFFFFF176),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Francisco Santiago · 6°I',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 54,
                  height: 54,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: const Color(0xFFFF6F00), width: 2),
                  ),
                  child: ClipOval(
                    child: Image.network(
                      'https://raw.githubusercontent.com/cbtis122-santiago/UI_Exa1_0421_FSCC/refs/heads/main/hcarbon.jfif',
                      fit: BoxFit.cover,
                      errorBuilder: (c, e, s) => Container(
                        color: const Color(0xFF3D0000),
                        child: const Icon(Icons.person, color: Color(0xFFFF6F00)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Barra de búsqueda
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 4),
            child: TextField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Buscar hamburguesas...',
                hintStyle: const TextStyle(color: Colors.white38),
                prefixIcon: const Icon(Icons.search, color: Color(0xFFFF6F00)),
                filled: true,
                fillColor: const Color(0xFF2C2C2C),
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Color(0xFFFF6F00)),
                ),
              ),
            ),
          ),

          // Título categorías
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              'Categorías',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // Grid 2x3
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1.05,
              ),
              itemCount: categorias.length,
              itemBuilder: (context, index) {
                final cat = categorias[index];
                return GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/menu'),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF2C2C2C),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: const Color(0xFF5D1010), width: 1.5),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFB71C1C),
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(14)),
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                Image.network(
                                  cat['imagen']!,
                                  fit: BoxFit.cover,
                                  errorBuilder: (c, e, s) => Container(
                                    color: const Color(0xFF3D0000),
                                    child: Center(
                                      child: Text(cat['emoji']!,
                                          style: const TextStyle(fontSize: 40)),
                                    ),
                                  ),
                                ),
                                // Gradiente sobre imagen
                                Positioned(
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  height: 30,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                        colors: [
                                          Colors.black,
                                          Colors.transparent,
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 7),
                          child: Text(
                            cat['nombre']!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ],
                    ),
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
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        onTap: (i) {
          if (i == 1) Navigator.pushNamed(context, '/menu');
          if (i == 2) Navigator.pushNamed(context, '/carrito');
          if (i == 3) Navigator.pushNamed(context, '/sucursales');
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: 'Menú'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: 'Carrito'),
          BottomNavigationBarItem(icon: Icon(Icons.place_outlined), label: 'Sucursales'),
        ],
      ),
    );
  }
}