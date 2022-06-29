import 'package:aa/screens/components/background.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool shrinkWrap;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,

      ),
      body: SingleChildScrollView(

        child: Stack(
        children: <Widget> [
         Stack(
              alignment: Alignment.bottomRight,
              children: <Widget> [
                Expanded(
                  flex: 2,

                    child:
                Container(

                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Colors.red.shade50,

                  ),
                  alignment: const Alignment (1,1),
                  height: 600,
                  width: 550,

                  child: SingleChildScrollView(
                    child: Column(
                      children: const  [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 40, 10, 40),
                          child: Text(
                            "Ankara Yenimahalle 5+1 Satılık Ev",
                            style: TextStyle(
                                fontSize: 24,
                                color: Color(0xff262626),
                                fontWeight: FontWeight.w700),
                            textAlign: TextAlign.left,
                          )



                        ),

                        Image(
                          image:AssetImage("assets/images/home1.PNG") ,

                        ),
                        Padding(padding: const EdgeInsets.fromLTRB(10, 40, 10, 40), child: Text(
                          "Ankara Sincan 2+1 Satılık Ev",
                          style: TextStyle(
                              fontSize: 24,
                              color: Color(0xff262626),
                              fontWeight: FontWeight.w700),
                          textAlign: TextAlign.left,
                        ),
                        ),
                        Image(
                          image:AssetImage("assets/images/home2.PNG") ,
                          fit: BoxFit.fill,

                        ),

                      ],
                    ),
                  ),
                ),
                )]
          ),
        ],
      ),
)
    );
  }
}
