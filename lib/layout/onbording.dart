import 'package:e_commerce/layout/HomePage.dart';
import 'package:e_commerce/shared/concents/concent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class Onbording extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var boardController = PageController();
    return Scaffold(
        appBar: PreferredSize(
          preferredSize:Size.fromHeight(80.0),
          child: AppBar(
            backgroundColor: Colors.black,
            title: Text('Mackup App'),
            actions: [TextButton(onPressed: ()
            {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));},
                child: Text('SKIP'))],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    physics: BouncingScrollPhysics(),
                    controller: boardController,
                    itemBuilder: (context, index) =>list_of_border[index],
                    itemCount: list_of_border.length,
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Center(
                        child: SmoothPageIndicator(
                          controller: boardController,
                          effect: ExpandingDotsEffect(
                            dotColor: Colors.grey,
                            activeDotColor: Colors.blue,
                            dotHeight: 10,
                            expansionFactor: 5,
                            dotWidth: 15,
                            spacing: 10.0,
                          ),
                          count: list_of_border.length,
                        ),
                      ),
                    ),
                    FloatingActionButton(
                      backgroundColor: Colors.white,
                      onPressed: () {
                       if(boardController.page==2.0){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                      }
                       else
                        boardController.nextPage(
                          duration: Duration(
                            milliseconds: 750,
                          ),
                          curve: Curves.fastLinearToSlowEaseIn,
                        );
                      },
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.blue,
                      ),
                    ),

                  ],
                ),


              ]
          ),
        )
    );
  }
}
