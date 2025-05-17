import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Product {
  final String id;
   final String name;
  final double price;

  Product({required this.id, required this.name, required this.price});
}


class CartProvider with ChangeNotifier {
  final List<Product> Items = [];

  List<Product> get items => Items;
  int get itemCount => Items.length;

  void addCart(Product product) {
    Items.add(product);
    notifyListeners();
  }
}

class ecommerce extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple E-Commerce',
      home: ProductListScreen(),
    );
  }
}


class ProductListScreen extends StatelessWidget {
  final List<Product> products = [
    Product(id: '1', name: 'T-shirt', price: 20.0),
    Product(id: '2', name: 'Shoes', price: 50.0),
    Product(id: '3', name: 'Hat', price: 15.0),
  ];

  @override
  Widget build(BuildContext context) {
      final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Products',),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => CartScreen()),
                  );
                },),

              Positioned(right: 5,
                top: 2,
                child: Container(
                  height: 21,
                  width: 21,
                  //padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text('${cart.itemCount}',
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ),
                ),
                )],
          )
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (ctx, index) {
          final product = products[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(product.name),
              subtitle: Text('\$${product.price}'),
              trailing: ElevatedButton(
                onPressed: () {
                  cart.addCart(product);
                },
                child: Text('Add to Cart',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
              ),
            ),
          );


        },
      ),
    );}
}


class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Cart')),
      body: ListView.builder(
        itemCount: cart.items.length,
        itemBuilder: (ctx, index) {
           final item = cart.items[index];
             return ListTile(title: Text(item.name),
                  subtitle: Text('\$${item.price}'),
          );
        },),

    );
  }
}
