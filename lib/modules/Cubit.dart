import 'dart:convert';

import 'package:e_commerce/layout/Catagores_products.dart';
import 'package:e_commerce/layout/Hom_all_product.dart';
import 'package:e_commerce/layout/HomePage.dart';
import 'package:e_commerce/layout/blushes_product_screen.dart';
import 'package:e_commerce/models/Product.dart';
import 'package:e_commerce/modules/states.dart';
import 'package:e_commerce/shared/concents/concent.dart';
import 'package:e_commerce/shared/network/remote/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class cubit extends Cubit<statesApp>{
  List<Product>productdata=[];
  List<Widget>Screens=[
    HomeProductScreen(),
   Products_Catagores(),
   Container(),
  ];
  int index=0;
  cubit() : super(InitalState());
  //get instance
  static cubit getcubit(context)=>BlocProvider.of(context);
  void ChangeNavBar(index){
  this.index=index;
  emit(changeNavBar());
  }

  Future get_All_Product_Data()async{
isLoading=true;
emit(ChangeLoadingState());
productdata=[];
 await DioClass.GetData(url: 'products.json').then((value){

   value.data.forEach((i){
       productdata.add(Product.fromJson(i));
    });
  });
   isLoading=false;
 emit(GetProductState());
   return productdata;
  }

  Future get_Product_Data_Blush_Type(context,product_type,title)async{
    isLoading=true;
    emit(ChangeLoadingState());
    await DioClass.GetData(url: 'products.json?product_type=$product_type').then((value){
      productdata=[];
      List<dynamic> data=value.data;
      data.forEach((i){
        productdata.add(Product.fromJson(i));
      });
    });
    Navigator.push(context, MaterialPageRoute(builder:(context)=>ProductTypeScreen('$title')));
    isLoading=false;
    emit(GetProductState());
    return productdata;
  }
  Future Search_any_Products_by_brand_name(brand)async{
    productdata=[];
    isLoading=true;
    emit(ChangeLoadingState());
    await DioClass.GetData(url: 'products.json?brand=$brand').then((value){
      List<dynamic> data=value.data;
      data.forEach((i){
        productdata.add(Product.fromJson(i));
      });
    });
    isLoading=false;
    emit(GetProductState());
    return productdata;
  }

  Widget Dropdown_Brands()=>Padding(
  padding: const EdgeInsets.only(right: 10,left: 15),
  child:   DropdownButton<String>(
     value: dropdownValue,
      underline:Container(height: 0,width: 0,) ,
      isExpanded: true,
      items: Name_Of_Brands.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,

          child: Text(
            value,
            style: TextStyle(fontSize: 16),
          ),
        );
      }).toList(),
      onChanged: (String? newValue) {
          dropdownValue = newValue!;
        Search_any_Products_by_brand_name(newValue);
        emit(dropdownValueChangeState());
      },
    ),
);
   rebuild()=>emit(ChangeLoadingState());
}