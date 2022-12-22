import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_commerce/modules/Cubit.dart';
import 'package:e_commerce/modules/states.dart';
import 'package:e_commerce/shared/Component/reusable_Component.dart';
import 'package:e_commerce/shared/concents/concent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
class Products_Catagores extends StatelessWidget {
 @override
  Widget build(BuildContext context) {
    return BlocConsumer<cubit,statesApp>(builder: (context, state) {
      cubit c=cubit.getcubit(context);
      return  Card(
        child: Center(
          child:SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child:GridView.count(
                    crossAxisCount:2,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    mainAxisSpacing: 1,
                    crossAxisSpacing: 1,
                    childAspectRatio: 1/1.7,
                    children: List.generate(Catagores.length,(index)=>
                        products_Catatgorey(Catagores[index],c,context)),

                  ),
                )
            ),
        )
      );
    },
   listener: (context,state){}
    );
  }
}
Widget products_Catatgorey(Cataogres_list ,cubit c, context)=>InkWell(
  onTap: (){
    print(Cataogres_list['index']);
    switch(Cataogres_list['index']){
      case 0:c.get_Product_Data_Blush_Type(context,'Blush','Blush');
      break;
      case 1:c.get_Product_Data_Blush_Type(context,'Bronzer','Bronzer');
      break;
      case 2:c.get_Product_Data_Blush_Type(context,'Eyebrow','Eyebrow');
      break;
      case 3:c.get_Product_Data_Blush_Type(context,'Eyeliner','Eyeliner');
      break;
      case 4:c.get_Product_Data_Blush_Type(context,'Eyeshadow','Eyeshadow');
      break;
      case 5:c.get_Product_Data_Blush_Type(context,'Foundation','Foundation');
      break;
      case 6:c.get_Product_Data_Blush_Type(context,'Lip liner','Lipliner');
      break;
      case 7:c.get_Product_Data_Blush_Type(context,'Lipstick','Lipstick');
      break;
      case 8:c.get_Product_Data_Blush_Type(context,'Mascara','Mascara');
      break;
      case 9:c.get_Product_Data_Blush_Type(context,'Nail polish','Nailpolish');
      break;
    }
    },
  child:   Card(
    child:   Column(
    mainAxisAlignment: MainAxisAlignment.center,

    children:
    [

    Expanded(

    child: ClipRRect(

    borderRadius: BorderRadius.circular(20),

    child: Image.asset(Cataogres_list['image'],),

    )



    ),

    SizedBox(height: 7,),

    Text(Cataogres_list['Catagorey_name'],style: TextStyle(fontSize: 18),overflow: TextOverflow.ellipsis,maxLines: 2,),

      SizedBox(height: 10,),

    ]),

  ),
);