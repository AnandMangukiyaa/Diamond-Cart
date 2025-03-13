part of 'constants.dart';

class AppColors {
  AppColors._();

  static const Color primary = Color(0xff895800);

  static const Color backgroundColor = Colors.white;

  static const Color primary10 = Color(0xfff5f5f5);

  static const Color secondary = Color(0xffFFFBE5);

  static const Color red = Color(0xffEE6C4D);

  static const Color lightGrey = Color(0xffF9F9F9);

  static const Color darkGrey = Color(0xff828382);

  static const Color lightBlue = Color(0xffA1CBFD);

  static const Color tertiary = Color(0xff895800);

  static const Color border = Color(0xffA1824D);

  static Color textColor1 = Color(0xff616161);

  static Color textColor2 = Color(0xff0A0A0A);

  static Color verticalDivider = Color(0xfff4c03d);

  static Color darkBsBg = Color(0xff2d2d2d);

  static Color blackWhite = Colors.white;

  static List<Color> gradient = [
      Color(0xffFEDEA0),
      Color(0xffCAA969),
    ];

  static List<Color> gradient2 = [
      Color(0xffFFF1C5),
      Colors.white,
    ];

  static List<Color> bgGradient = [
      Color(0xff2C2B2B),
      Color(0xff212121),
    ];

  static List<Color> cardBg = [
      Color(0xff222222),
      Color(0xff101010),
    ];


  static List<Color> walletSummary = [
      Color(0xffecc440),
      Color(0xffffff95),
      Color(0xffecc440),
  ];

  static List<Color> bannerGradient = [
      Color(0xff5A003C),
      Color(0xff75004E),
    Color(0xff5A003C),
  ];
}

MaterialColor generateMaterialColor(Color color) {
  return MaterialColor(color.value, {
    50: color,
    100: color,
    200: color,
    300: color,
    400: color,
    500: color,
    600: color,
    700: color,
    800: color,
    900: color,
  });
}
