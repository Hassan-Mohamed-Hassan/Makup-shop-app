import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_commerce/modules/Cubit.dart';
import 'package:e_commerce/modules/states.dart';
import 'package:e_commerce/shared/concents/concent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  late String initialUrl_Of_website;

  WebViewPage(initialUrl) {
    initialUrl_Of_website = initialUrl;
  }

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  bool loading=true;

  final _key = UniqueKey();

  @override
  Widget build(BuildContext context) {
    WebViewController _controller;
    return BlocConsumer<cubit,statesApp>(
        builder: (context, state) {
          cubit c=cubit.getcubit(context);
          return  Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(60.0),
              child:AppBar(
                title: Text('Makeup',style: TextStyle(color: Colors.white),),
                backgroundColor: Colors.black,
              ),
            ),
            body:Stack(
          children: <Widget>[
          WebView(
            key: _key,
            initialUrl: widget.initialUrl_Of_website,
            javascriptMode: JavascriptMode.unrestricted,
            onPageFinished: (finish) {
              setState(() {
                loading = false;
              });
            },
          ),
          loading ? Center( child: LoadingAnimationWidget.discreteCircle(
              size: 50,
              secondRingColor: Colors.deepOrangeAccent,
              color: Colors.brown
          ),)
              : Stack(),
          ],
          ),
          );
        },
        listener: (context,state){});
  }
}
