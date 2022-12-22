import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/layout/WebviewPage.dart';
import 'package:e_commerce/shared/concents/concent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
Widget Grid_View(ListData)=> GridView.count(
    crossAxisCount:3,
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    mainAxisSpacing: 1,
    crossAxisSpacing: 1,
    childAspectRatio: 1/2.3,
    children: ListData,

    );

Widget Products_Item(ImageUri,productName,rateNamer,productPrice,product_Website_link,context)=>InkWell(
    onTap: (){
        isLoading=true;
       Navigator.push(context, MaterialPageRoute(builder:(context)=>WebViewPage(product_Website_link) ));
    },
  child:   Card(

      shape:RoundedRectangleBorder(

          borderRadius: BorderRadius.circular(10)

      ),

      child: Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children:

          [

              Expanded(

                  child: ClipRRect(

                      borderRadius: BorderRadius.circular(20),



                      child: CachedNetworkImage(

                          imageUrl: "$ImageUri",



                          placeholder: (context, ImageUri) =>  Icon(Icons.image_not_supported_outlined,),

                          errorWidget: (context, ImageUri, error) => Icon(Icons.image_not_supported_outlined,),

                      )

                  ),

              ),

              Text('$productName',style: TextStyle(),overflow: TextOverflow.ellipsis,maxLines: 2,),

              SizedBox(height: 5,),

              RatingBar.builder(

                  initialRating: rateNamer,

                  itemSize: 20,

                  direction: Axis.horizontal,

                  allowHalfRating: true,

                  itemCount: 5,

                  itemBuilder: (context, _) => Icon(

                      Icons.star,

                      color: Colors.amber,

                  ),

                  onRatingUpdate: (rating) {

                      print(rating);

                  },

              ),

              SizedBox(height: 5,),

              Text('$productPrice\$',textAlign: TextAlign.left,style: TextStyle(fontSize:15,color: Colors.blueAccent),),

          ],),

  ),
);


