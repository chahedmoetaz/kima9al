import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kima9al/ui/common/quote_widget.dart';
import 'package:random_color/random_color.dart';

final Firestore _firestore = Firestore();
final RandomColor _randomColor = RandomColor();
//final ColorSwatch _randomColor = [Colors.teal,Colors.yellowAccent];

class QuoteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 340, height: 660);
    return Scaffold(
      body: StreamBuilder(
        stream: _firestore.collection('quotes').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return _LoadingIndicator();
          if(snapshot.hasError==true) {
            print(snapshot.connectionState.index);
            return _NoInternet( );
          }return PageView.builder(
            physics: ClampingScrollPhysics(),
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) {
              final document = snapshot.data.documents[index];
              return QuoteWidget(
                backgroundColor: RandomColor().colorRandomizer(),
                quote: document['quote'].toString(),
                author: document['author'].toString(),
              );
            },
          );
        },
      ),
    );
  }

}
class RandomColor<Colors> {
  List<Color> colors = [
    Color(0xfff3eee8),
    Color(0xff292929),
    Color(0xff000000),
  ];

  var index = Random().nextInt(3);

  Color colorRandomizer() {
    print(colors[index]);
    return colors[index];
  }
}
class _LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color:Color(0xfff3eee8),
      child: Center(
        child: SpinKitRotatingCircle(
          color: Colors.black45,
          size: 30.0,
        ),
      ),
    );
  }
}
class _NoInternet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color:Color(0xfff3eee8),
      child: Center(
        child: Image.asset('assets/noInternet.png',color: Colors.black45,),
      ),
    );
  }
}
