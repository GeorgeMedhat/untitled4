import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:floating_navbar/floating_navbar.dart';
import 'package:floating_navbar/floating_navbar_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled4/Data/dio_helper.dart';
import 'package:untitled4/productContainer.dart';
import 'package:untitled4/settings.dart';
import 'cart.dart';
import 'favs.dart';
import 'models/product.dart';

class ApiConst {
  static const String baseUrl='https://dummyjson.com';
  static const String endPoint ='/products';

}

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState()=>HomeScreenState();

}
class HomeScreenState extends State<HomeScreen>{

  List <Product>products = [];
void initState(){
  super.initState();
  getData();
}
Future<void>getData () async {
  List productslist = await DioHelper().getProducts();
  products = Product.convertToProduct(productslist);
  setState(() {

  });
}



  List<ProductContainer> list =[];
  @override
  Widget build(BuildContext context) {
    for (var product in products)
    list.add(ProductContainer(product));
  print(products.length);
    return Scaffold(

      body:Scaffold(
        backgroundColor: CupertinoColors.black,
        body: SingleChildScrollView(
          child: Container(
            color: Colors.black54,
            child: Center(
              child: Column(

                children: [
                  SizedBox(height:  MediaQuery.of(context).size.height/5,),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12.0,
                        mainAxisExtent: 300,
                        mainAxisSpacing: 12.0
                      ),
                      itemCount: products.length,
                      itemBuilder: (_,index){
                            return ProductContainer(products[index]);
                      },
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      )
    );
  }

}



