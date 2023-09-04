import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:untitled4/cart.dart';
import 'package:untitled4/favs.dart';
import 'package:untitled4/mainScreen.dart';
import 'package:untitled4/settings.dart';

import 'Data/dio_helper.dart';
import 'models/product.dart';

void main() {
  runApp( MyApp());
}
class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  static List <Product>products = [];
  late final ScrollController? controller;


  @override
  _MyAppState createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  List <Widget>navigation=[const HomeScreen(), const FavScreen(), const cartScreen(), const settingsScreen()];
  var _selectedTab = _SelectedTab.home;


  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  getData();
  }
  
@override

  void hide(){}
  Future<void>getData () async {
  List productslist = await DioHelper().getProducts();
  MyApp.products = Product.convertToProduct(productslist);
  setState(() {});
}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          extendBody: true,
          // resizeToAvoidBottomInset: false,
        bottomNavigationBar: DotNavigationBar(
          
          splashColor: Colors.black,
            splashBorderRadius: 100,

            backgroundColor: Colors.green,
            currentIndex: _SelectedTab.values.indexOf(_selectedTab),
            dotIndicatorColor: Colors.green,
            unselectedItemColor: Colors.grey[300],
             enableFloatingNavBar: true,
            onTap: _handleIndexChanged,
            items: [
              /// Home
              DotNavigationBarItem(
                icon: const Icon(Icons.home),
                selectedColor: Colors.black54,
              ),

              /// favorites
              DotNavigationBarItem(
                icon: const Icon(Icons.favorite),
                selectedColor: Colors.black54,
              ),

              /// cart
              DotNavigationBarItem(
                icon: const Icon(Icons.shopping_bag),
                selectedColor: Colors.black54,
              ),

              /// settings
              DotNavigationBarItem(
                icon: const Icon(Icons.settings),
                selectedColor: Colors.black54,
              ),
            ],
          ),
          body: navigation[_selectedTab.index]
      ),
    );
  }
}
enum _SelectedTab { home, favorite, search, person }
