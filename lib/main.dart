import 'package:e_commerce/layout/Catagores_products.dart';
import 'package:e_commerce/layout/Hom_all_product.dart';
import 'package:e_commerce/layout/HomePage.dart';
import 'package:e_commerce/layout/onbording.dart';
import 'package:e_commerce/modules/Cubit.dart';
import 'package:e_commerce/shared/network/remote/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await DioClass.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit()..get_All_Product_Data(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(),
        home:Onbording()
      ),
    );
  }
}