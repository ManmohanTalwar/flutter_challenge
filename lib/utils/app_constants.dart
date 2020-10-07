import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppConstants {
  AppConstants._();

  static const Color notWhite = Color(0xFFEDF0F2);
  static const Color walletYellow = Color(0xFFFFB92D);
  static const Color blueBg = Color(0xFF08A2A2);
  static const Color blueBg2 = Color(0xFF01D2D2);
  static const Color cardBg1 = Color(0xFF707070);
  static const Color cardBg2 = Color(0xFF363535);
  static const Color tabBg = Color(0xFF474747);
  static const Color buttonBlue = Color(0xFF82D0DB);
  static const Color bottomBarColor = Color(0xFF294E4E);
  static const Color yellowValueColor = Color(0xFFFFCB63);
  static const Color orangeBg = Color(0xFFE27F6B);
  static const Color orangeBg2 = Color(0xFFFFCB63);
  static const Color greenish = Color(0xFFC9C994);
  static const Color nearlyWhite = Color(0xFFFEFEFE);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color appBackground = Color(0xFF1C1C1C);
  static const Color nearlyBlack = Color(0xFF213333);
  static const Color grey = Color(0xFF3A5160);
  static const Color lightGrey = Color(0xFF7E7E7E);
  static const Color boxBgRed = Color(0xFFd54747);
  static const Color lightBoxBgRed = Color(0xFFf8e1e1);
  static const Color dark_grey = Color(0xFF313A44);
  static const Color red = const Color(0xffe52f2f);
  static const Color confirm = const Color(0xffe52f2f);
  static const Color lightConfirm = const Color(0xfffce5e5);
  static const Color lightActive = const Color(0xffdadbff);
  static const Color lightDeceased = const Color(0xffe9e8e8);
  static const Color lightRecovered = const Color(0xffdaead8);
  static const Color bg = Color(0xFFf3f3f3);
  static Color entityBg = const Color(0xff9dcdea).withOpacity(0.13);
//  static Color whatsApp = const Color(0xff2ab200);
  static Color whatsApp = const Color(0xff53BC33);
  static Color calling = const Color(0xff0a99fa);
  static Color walletBg1 = const Color(0xff3E3E3E);
  static Color walletBg2 = const Color(0xff1F1F1F);
  static Color walletButton22 = const Color(0xffD4D3D3);
  static Color walletButton21 = const Color(0xffc1c1c1);
  static Color walletButton23 = const Color(0xffE1DFDF);

  static Color ticketCardBg1 = const Color(0xff3B3939);
  static Color ticketCardBg2 = const Color(0xff2D2C2C);
  static Color ticketCardBg3 = const Color(0xff202020);

  static const Color helpLineBg1 = const Color(0xffF8C7CF);
  static const Color helpLineBg2 = const Color(0xffC1172F);
  static const Color helpDeskBg1 = const Color(0xffDEF4D4);
  static const Color helpDeskBg2 = const Color(0xff5BAB39);
  static const Color districtReportBg1 = const Color(0xffCAE8F8);
  static const Color districtReportBg2 = const Color(0xff2388B9);

  static Color pieRecovered = const Color(0xff7BAAF7);
  static Color pieDeceased = const Color(0xffC6DAFC);
  static Color pieActive = const Color(0xff3367D6);

  static const Color darkText = Color(0xFF253840);
  static const Color darkerText = Color(0xFF17262A);
  static const Color lightText = Color(0xFF4A6572);
  static const Color deactivatedText = Color(0xFF767676);
  static const Color dismissibleBackground = Color(0xFF364A54);
  static const Color chipBackground = Color(0xFFEEF1F3);
  static const Color spacer = Color(0xFFF2F2F2);
  static const Color green = Color(0xFF00ff11);
  static const Color recovered = const Color(0xff24981a);
  static const Color deceased = const Color(0xff574c4c);

//  static const Color background = Color(0xFFF2F3F8);
  static const Color background = const Color(0xfff9fcfd);
  static const Color nearlyDarkBlue = Color(0xFF2633C5);
  static const Color active = const Color(0xff000afc);
  static const Color wearMask = const Color(0xff397CFF);
  static const Color washHand = const Color(0xff2B9B22);
  static const Color socialDistance = const Color(0xffFB2B2B);

  static const Color primaryColor = const Color(0xFF00A9DE);
  static const Color selectedBlackColor = const Color(0xFF0a0a0a);
  static const String fontName = 'WorkSans';

  static TextStyle appBarText(double size) => GoogleFonts.montserrat(
        color: white,
        fontWeight: FontWeight.bold,
        fontSize: size,
      );

  static TextStyle gridText(double size) => GoogleFonts.montserrat(
        color: white,
        fontWeight: FontWeight.w500,
        fontSize: size,
      );

  static TextStyle headlineLight(double size) => GoogleFonts.montserrat(
        // h5 -> headline
        fontWeight: FontWeight.bold,
        fontSize: size,
//        letterSpacing: 0.27,
        color: darkerText,
      );

  static TextStyle headlineDark(double size) => GoogleFonts.montserrat(
        // h5 -> headline
        fontWeight: FontWeight.bold,
        fontSize: size,
        color: white,
      );

  static TextStyle subtitleLight(double size) => GoogleFonts.montserrat(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        letterSpacing: -0.04,
        color: black.withOpacity(0.5),
      );
  static TextStyle subtitleDark(double size) => GoogleFonts.montserrat(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: white.withOpacity(0.7),
      );

  static TextStyle body2Light = GoogleFonts.montserrat(
    fontWeight: FontWeight.normal,
    fontSize: 14,
    letterSpacing: 1.2,
    color: white,
  );
  static TextStyle body2Dark = GoogleFonts.montserrat(
    fontWeight: FontWeight.w600,
    fontSize: 14,
    color: white,
  );

  static TextStyle body1Light = GoogleFonts.montserrat(
    fontWeight: FontWeight.normal,
    fontSize: 16,
    letterSpacing: 1.5,
    color: white,
  );
  static TextStyle body1Dark = GoogleFonts.montserrat(
    fontWeight: FontWeight.w600,
    fontSize: 16,
    color: white,
  );

  static TextStyle customNormal({
    double size,
    Color color,
  }) =>
      GoogleFonts.montserrat(
        fontWeight: FontWeight.w200,
        fontSize: size,
        color: color, // was lightText
      );
  static TextStyle customBold({
    double size,
    Color color,
  }) =>
      GoogleFonts.montserrat(
        fontWeight: FontWeight.bold,
        fontSize: size,
        color: color, // was lightText
      );
  static TextStyle customStyle({
    double size,
    Color color,
    FontWeight weight,
    FontStyle style,
  }) =>
      GoogleFonts.montserrat(
        fontWeight: weight,
        fontSize: size,
        fontStyle: style ?? FontStyle.normal,
        color: color,
      );
  static TextStyle customStyleSpacing({
    double size,
    Color color,
    FontWeight weight,
    double letterSpace,
    FontStyle style,
  }) =>
      GoogleFonts.montserrat(
        fontWeight: weight,
        fontSize: size,
        fontStyle: style,
        color: color,
        letterSpacing: letterSpace,
//        foreground: Paint()
//          ..style = PaintingStyle.stroke
//          ..strokeWidth = 1
//          ..color = Colors.black,
      );
}
