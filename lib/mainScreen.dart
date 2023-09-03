import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:floating_navbar/floating_navbar.dart';
import 'package:floating_navbar/floating_navbar_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled4/Data/dio_helper.dart';
import 'package:untitled4/Most%20selling.dart';
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
  print("object");
  getData();
}
Future<void>getData () async {
  List productslist = await DioHelper().getProducts();
  products = Product.convertToProduct(productslist);
  setState(() {});
}
//felgeb
  @override
  Widget build(BuildContext context) {
  print(products.length);
  if(products.length==0){
    return Scaffold(
      backgroundColor: CupertinoColors.black,

      body:Center(child: CircularProgressIndicator(color: Colors.green,)) ,
    );
  }
    else
    return Scaffold(
        backgroundColor: CupertinoColors.black,
        body: SafeArea(
          child: Column(

            children: [
              SizedBox(height: MediaQuery.of(context).size.height/10,),
              Row(
                children: [
                  SizedBox(width:  MediaQuery.of(context).size.width/20,),
                  Text("Most selling",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.white
                  ),)
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height/30,),
              Expanded(child: MostSelling(products)),

              SizedBox(height: MediaQuery.of(context).size.height/30,),
              Row(
                children: [
                  SizedBox(width:  MediaQuery.of(context).size.width/20,),
                  Text("All Products",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.white
                  ),)
                ],
              ),
              Expanded(
                child: GridView.builder(

                  clipBehavior: Clip.none,

                  padding: EdgeInsets.all(8),
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12.0,
                      mainAxisExtent: 300,
                      mainAxisSpacing: 12.0
                  ),
                  itemCount: products.length,
                  itemBuilder: (_,index){
                    return GridTile(child: ProductContainer(products[index]));
                  },
                ),
              ),
            ],
          ),
        ),
      );
  }

}



