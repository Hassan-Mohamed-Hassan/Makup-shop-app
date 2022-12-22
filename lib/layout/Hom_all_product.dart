import 'dart:ui';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_commerce/shared/Component/reusable_Component.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:e_commerce/modules/Cubit.dart';
import 'package:e_commerce/modules/states.dart';
import 'package:e_commerce/shared/concents/concent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class HomeProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<cubit,statesApp>(
      listener: (context, state) {},
      builder: (context,state){
        var Search_Controller=TextEditingController();
        cubit c=cubit.getcubit(context);
        return Card(
          color: Colors.white,
          child: Center(
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
              ),
        );
      },
    );

  }

}