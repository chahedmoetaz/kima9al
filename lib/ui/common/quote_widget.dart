import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui'as ui;
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kima9al/ui/styleguide/theme_text.dart';

class QuoteWidget extends StatefulWidget {
  final Color backgroundColor;
  final String quote, author;

  const QuoteWidget({
    Key key,
    @required this.backgroundColor,
    @required this.quote,
    @required this.author,
  }) : super(key: key);
  @override
  _QuoteWidgetState createState() => _QuoteWidgetState();
}


class _QuoteWidgetState extends State<QuoteWidget> {
  // ignore: must_call_super
  initState(){
    print(widget.backgroundColor.value);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil.screenWidthDp,
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(16),
        vertical: ScreenUtil().setHeight(48),
      ),
      color: widget.backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Image.asset(
            'assets/quote_icon.png',
            color: Colors.white.withOpacity(0.4),
            height: ScreenUtil().setHeight(100),
            width: ScreenUtil().setWidth(100),
          ),
      RepaintBoundary(
        key: _globalKey,

        child:
        Container(
          height: 350,
          padding: new EdgeInsets.only(left: 16.0, bottom: 8.0, right: 16.0),
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: widget.backgroundColor.value==4294176488?AssetImage('assets/black.JPG')
              : AssetImage('assets/Capture.JPG'),
              fit: BoxFit.cover,
            ),
          ),
              alignment: Alignment.center,
            child: Stack(children: [
              Container(
                alignment: Alignment.center,
                child: Expanded(
                  child: Text(widget.quote,
                    style: widget.backgroundColor.value!=4294176488?ThemeText.headlineB:ThemeText.headlineW,
                  ),
                ),
              ),

              Container(alignment: Alignment.bottomCenter,
                child: Text(
                  widget.author,
                  style: widget.backgroundColor.value!=4294176488?ThemeText.subheadB:ThemeText.subheadW,
                ),
              ),
            ],)
        ),



      ),


          Container(
            width: 40,
            margin: const EdgeInsets.only(left: 4),
            decoration: BoxDecoration(
              color: Colors.grey,
              shape: BoxShape.circle,
            ),
            child: IconButton(color: Colors.black,
              onPressed:(){

                _capturePng();
              },
              icon: Icon(Icons.share),
            ),
          )
        ],
      ),
    );
  }

  GlobalKey _globalKey = new GlobalKey();

  Future<Uint8List> _capturePng() async {
    try {

      print('inside');
      RenderRepaintBoundary boundary =
      _globalKey.currentContext.findRenderObject();
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData byteData =
      await image.toByteData(format: ui.ImageByteFormat.png);
      var pngBytes = byteData.buffer.asUint8List();
      var bs64 = base64Encode(pngBytes);
      print(pngBytes);
      print(bs64);
      await Share.file('Kima9al', 'Kima9al.jpg', pngBytes, 'image/png');
      return pngBytes;
    } catch (e) {
      print(e);
    }
  }
}
