import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeText {
  static final headlineB = GoogleFonts.dosis(
    textStyle: _headlineB.copyWith(
      fontSize: ScreenUtil().setSp(32),
    ),
  );
  static final subheadB = GoogleFonts.dosis(
    textStyle: _subHeadB.copyWith(
      fontSize: ScreenUtil().setSp(16),
    ),
  );
  static const _headlineB = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.italic,
  );
  static const _subHeadB = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.italic,
  );
    static final headlineW = GoogleFonts.dosis(
    textStyle: _headlineW.copyWith(
      fontSize: ScreenUtil().setSp(32),
    ),
  );
  static final subheadW = GoogleFonts.dosis(
    textStyle: _subHeadW.copyWith(
      fontSize: ScreenUtil().setSp(16),
    ),
  );
  static const _headlineW = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.italic,
  );
  static const _subHeadW = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.italic,
  );
}
