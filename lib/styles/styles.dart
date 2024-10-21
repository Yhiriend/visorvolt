import 'package:flutter/material.dart';

class AppStyles {
  // Colores
  static const Color primaryColor = Color(0xFFFFE702);
  static const Color secondaryColor = Color(0xFF212121);
  static const Color successColor = Color(0xFFFFE702);
  static const Color cancelColor = Color(0xFFE0E0E0);
  static const Color defaultColor = Color(0xFF9E9E9E);
  static const Color errorColor = Color(0xFFF44336);
  static const Color alertColor = Color(0xFFD0521C);
  static const Color lightGray = Color(0xFFE0E0E0);
  static const Color darkGray = Color(0xFF616161);
  static const Color backgroundColor = Color(0xFFFFFFFF);
  static const Color darkBackgroundColor = Color(0xFF212121);
  static const Color textColor = Color(0xFF212121);
  static const Color textLightColor = Color(0xFFFFFFFF);
  static const Color defaultLoaderColor = Color(0xFF212121);
  static const Color defaultForeGroundButtonColor = Color(0xFF212121);
  static const Color defaultButtonTextColor = Color(0xFFFFFFFF);
  static const Color cancelButtonTextColor = Color(0xFF616161);
  static const Color stateOn = Color(0xFF007701);
  static const Color stateOff = Color(0xFF838383);

  // Tamaños de fuentes
  static const double titleFontSize = 24.0;
  static const double subtitleFontSize = 18.0;
  static const double paragraphFontSize = 16.0;
  static const double subparagraphFontSize = 14.0;

  // Estilos de texto
  static TextStyle titleStyle = TextStyle(
    fontSize: titleFontSize,
    fontWeight: FontWeight.bold,
    color: textColor,
  );

  static TextStyle subtitleStyle = TextStyle(
    fontSize: subtitleFontSize,
    fontWeight: FontWeight.w600,
    color: textColor,
  );

  static TextStyle paragraphStyle = TextStyle(
    fontSize: paragraphFontSize,
    fontWeight: FontWeight.normal,
    color: textColor,
  );

  static TextStyle subparagraphStyle = TextStyle(
    fontSize: subparagraphFontSize,
    fontWeight: FontWeight.normal,
    color: textColor,
  );

  static TextStyle buttonSuccessTextStyle = const TextStyle(
    fontSize: subtitleFontSize,
    fontWeight: FontWeight.w700,
  );
  static TextStyle buttonCancelTextStyle = TextStyle(
    fontSize: subtitleFontSize,
    fontWeight: FontWeight.w700,
  );
  static TextStyle buttonDefaultTextStyle = TextStyle(
    fontSize: subtitleFontSize,
    fontWeight: FontWeight.w700,
  );

  // Estilos de botones
  static const double buttonBorderRadius = 8.0; // Radio de bordes

  static ButtonStyle successButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: successColor,
    foregroundColor: defaultForeGroundButtonColor,
    textStyle: buttonSuccessTextStyle,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(buttonBorderRadius),
    ),
    padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
  );

  static ButtonStyle cancelButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: cancelColor,
    foregroundColor: defaultForeGroundButtonColor,
    textStyle: buttonCancelTextStyle,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(buttonBorderRadius),
    ),
    padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
  );

  static ButtonStyle defaultButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: defaultColor,
    foregroundColor: defaultForeGroundButtonColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(buttonBorderRadius),
    ),
    padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
  );

  static ButtonStyle successOutlinedButtonStyle = OutlinedButton.styleFrom(
    side: BorderSide(color: successColor),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(buttonBorderRadius),
    ),
    padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
  );

  static ButtonStyle cancelOutlinedButtonStyle = OutlinedButton.styleFrom(
    side: BorderSide(color: cancelColor),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(buttonBorderRadius),
    ),
    padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
  );

  static ButtonStyle defaultOutlinedButtonStyle = OutlinedButton.styleFrom(
    side: BorderSide(color: primaryColor),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(buttonBorderRadius),
    ),
    padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
  );

  static ButtonStyle errorButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: Colors.red,
    foregroundColor: defaultForeGroundButtonColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(buttonBorderRadius),
    ),
    padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
  );

  static ButtonStyle errorOutlinedButtonStyle = OutlinedButton.styleFrom(
    side: BorderSide(color: Colors.red),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(buttonBorderRadius),
    ),
    padding: EdgeInsets.all(16.0),
  );
}
