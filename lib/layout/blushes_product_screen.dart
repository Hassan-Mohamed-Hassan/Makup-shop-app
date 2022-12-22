import 'dart:ui';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_commerce/shared/Component/reusable_Component.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:e_commerce/modules/Cubit.dart';
import 'package:e_commerce/modules/states.dart';
import 'package:e_commerce/shared/concents/concent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class ProductTypeScreen extends StatelessWidget {
  String ?title;

  ProductTypeScreen(this.title);

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<cubit,statesApp>(
      listener: (context, state) {},
      builder: (context,state){
        var Search_Controller=TextEditingController();
        cubit c=cubit.getcubit(context);
      return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(120.0),
            child:Stack(
              alignment: Alignment.bottomCenter,
              clipBehavior: Clip.antiAlias,
              children: [
                AppBar(
                  shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(30)),
                title: Text('$title',style: TextStyle(color: Colors.white),),
                  backgroundColor: Colors.black,
          ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)
                  ),
                  width: MediaQuery.of(context).size.width*.9,
                  child: c.Dropdown_Brands(),
                ),
              ],
            ),),
          bottomNavigationBar: BottomNavigationBar(
           selectedItemColor: Colors.orangeAccent,
            showUnselectedLabels: false,
            unselectedItemColor:  Colors.black38,
            elevation: 0,
            onTap: (index){
             c.ChangeNavBar(index);
            },
            currentIndex: c.index,
            type:BottomNavigationBarType.fixed ,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home),label:'home'),
              BottomNavigationBarItem(icon: Icon(Icons.apps),label: 'catagores'),
              BottomNavigationBarItem(icon: Icon(Icons.favorite),label: 'favorites'),
              BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'settings'),
            ],

          ),
          body:Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: ConditionalBuilder(
                 condition: !isLoading,
                 builder: (context) =>  Grid_View(List.generate(c.productdata.length,(index)=>
                     Products_Item(
                       c.productdata[index].imageLink,
                       c.productdata[index].name,
                       c.productdata[index].rating,
                       c.productdata[index].price,
                       c.productdata[index].productLink,
                       context
                     ),),

                 ),
                 fallback: (context) => LoadingAnimationWidget.discreteCircle(
                   size: 50,
                   secondRingColor: Colors.deepOrangeAccent,
                   color: Colors.brown
                 ),
                    ),
              ),
            ),
          )
      );
      },
    );

  }

}

