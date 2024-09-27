import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _hoverAnimation;

  // List of products
  List<Product> products = [
    Product(
      color: const Color(0xff000000),
      path: 'assets/black.png',
    ),
    Product(
      color: const Color(0xfffcecd0),
      path: 'assets/cream.png',
    ),
    Product(
      color: const Color(0xffb6d7e4),
      path: 'assets/blue.png',
    ),
  ];

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    
    // Initialize animation controller
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    )..repeat(reverse: true);

    // Set up hover animation with a slight bounce effect
    _hoverAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0, 0.02),
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff292929),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Hovering product image
            SlideTransition(
              position: _hoverAnimation,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                child: Image.asset(
                  products[currentIndex].path,
                  key: ValueKey<int>(currentIndex),
                  height: 300, // You can adjust this to your preference
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'BOAT ROCKERZ 450 PRO',
              style: TextStyle(
                color: Colors.white,
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Bluetooth Headphones',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 30),
            // Color selection dots
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(products.length, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: products[index].color,
                      shape: BoxShape.circle,
                      border: currentIndex == index
                          ? Border.all(color: Colors.white, width: 3)
                          : null,
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 30),
            const Text(
              'Rs. 1,699',
              style: TextStyle(
                color: Colors.red,
                fontSize: 28,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 30),
            // Notify me button
            GestureDetector(
              onTap: () {
                // Handle "Notify Me" action here
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Text(
                    'NOTIFY ME',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Product {
  final Color color;
  final String path;

  Product({required this.color, required this.path});
}
