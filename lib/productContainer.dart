import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled4/models/product.dart';

import 'ProductPage.dart';

class ProductContainer extends StatelessWidget{
  Product product;
  ProductContainer(this.product);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder:(context) => ProductPage(product)));
      },
      child: Container(

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.green,
              blurRadius: 15.0,
              offset: Offset(0,0.75)
            )
          ]
        ),
        width: MediaQuery.of(context).size.width/4,
        height: MediaQuery.of(context).size.height/10,
        child: Column(

          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
                  child: Image.network(product.thumbnail,fit: BoxFit.fill,)),
            ),
            SizedBox(height:  MediaQuery.of(context).size.height/50,),

            Text(product.title),
            SizedBox(height:  MediaQuery.of(context).size.height/50,),
            Center(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                children: [
                SizedBox(width:  MediaQuery.of(context).size.width/20,),
                Text(product.price.toString(),style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18
                ),)
                ,
                Icon(Icons.attach_money_sharp,),
                Spacer(),
                InkWell(
                    onTap : (){},
                    child: Icon(Icons.favorite_border)),
                SizedBox(width:  MediaQuery.of(context).size.width/20,),


          ],
      ),
              ),
            )
          ],
        )
      ),
    );
  }

}