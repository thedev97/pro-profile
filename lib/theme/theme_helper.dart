import '../core/pro_profile_export.dart';

/// Helper class for managing themes and colors.
class ThemeManager {
  static String _themeData = 'primary';

  static void setThemeData(String theme) {
    _themeData = theme;
  }

  static String getThemeData() {
    return _themeData;
  }
}

class ThemeHelper {
  // The current app theme
  final _appTheme = ThemeManager.getThemeData();

// A map of custom color themes supported by the app
  final Map<String, PrimaryColors> _supportedCustomColor = {
    'primary': PrimaryColors()
  };

// A map of color schemes supported by the app
  final Map<String, ColorScheme> _supportedColorScheme = {
    'primary': ColorSchemes.primaryColorScheme
  };

  /// Returns the primary colors for the current theme.
  PrimaryColors _getThemeColors() {
    //throw exception to notify given theme is not found or not generated by the generatorif (!_supportedCustomColor.containsKey(_appTheme)){  throw Exception(               "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");      } //return theme from map
    return _supportedCustomColor[_appTheme] ?? PrimaryColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    //throw exception to notify given theme is not found or not generated by the generator if (!_supportedColorScheme.containsKey(_appTheme)){   throw Exception(                "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");       }  //return theme from map
    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.primaryColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      scaffoldBackgroundColor: colorScheme.primaryContainer,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: colorScheme.onError.withOpacity(0.36),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            shadowColor: colorScheme.primary,
            elevation: 4,
            visualDensity: const VisualDensity(
              vertical: -4,
              horizontal: -4,
            ),
            padding: EdgeInsets.zero),
      ),
      dividerTheme: DividerThemeData(
          thickness: 24, space: 24, color: colorScheme.onPrimaryContainer),
    );
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        displaySmall: GoogleFonts.manrope(
            color: colorScheme.onPrimaryContainer,
            fontSize: 35.0,
            fontWeight: FontWeight.w700,
            shadows: [
              const Shadow(
                  color: Colors.black54, offset: Offset(2, 2), blurRadius: 3),
            ]),
        titleLarge: GoogleFonts.manrope(
            color: colorScheme.onPrimaryContainer,
            fontSize: 20.0,
            fontWeight: FontWeight.w800,
            shadows: [
              const Shadow(
                  color: Colors.black54, offset: Offset(2, 2), blurRadius: 3),
            ]),
        titleMedium: GoogleFonts.manrope(
            color: colorScheme.onPrimaryContainer,
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
            shadows: [
              const Shadow(
                  color: Colors.black54, offset: Offset(2, 2), blurRadius: 3),
            ]),
        titleSmall: GoogleFonts.manrope(
            color: Colors.grey[800],
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
            shadows: [
              const Shadow(
                  color: Colors.black, offset: Offset(0, 0), blurRadius: 1),
            ]),
      );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static const primaryColorScheme = ColorScheme.light(
    // Primary colors
    primary: Color(0X3F000000),
    primaryContainer: Color(0XFF202020),

    // Error colors
    errorContainer: Color(0XFF949494),
    onError: Color(0XFFFFFFFF),

    // On colors(text colors)
    onPrimary: Color(0X44313131),
    onPrimaryContainer: Color(0XFFDEDEDE),
  );
}

/// Class containing custom colors for a primary theme.
class PrimaryColors {
  // Olive
  Color get olive => const Color(0XFFF7F3D7);

  // White
  Color get white => const Color(0XFFFFFFFF);

  // Brown
  Color get brown200 => const Color(0XFF937131);
}

class ProProfileDecoration {
  static BoxDecoration get appBarDecoration => BoxDecoration(
        color: theme.colorScheme.onPrimary,
        image: DecorationImage(
            image: AssetImage(ProProfileImageConstant.banner),
            fit: BoxFit.cover),
      );

  static BoxDecoration get drawerHeaderDecoration => BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(ProProfileImageConstant.profile),
          fit: BoxFit.cover,
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.modulate),
        ),
      );

  static BoxDecoration get drawerHeaderDecoration1 => BoxDecoration(
        color: Colors.black54,
        image: DecorationImage(
            image: AssetImage(ProProfileImageConstant.banner),
            fit: BoxFit.cover),
      );

  static BoxDecoration get learMoreDecoration => BoxDecoration(
        color: Colors.black54,
        image: DecorationImage(
            image: AssetImage(ProProfileImageConstant.imgLearnMore),
            fit: BoxFit.cover),
      );

  static BoxDecoration get contactMeDecoration => BoxDecoration(
        color: Colors.black54,
        image: DecorationImage(
            image: AssetImage(ProProfileImageConstant.imgContactMe),
            fit: BoxFit.cover),
      );

  static BoxDecoration get normalDecoration =>
      const BoxDecoration(color: Colors.transparent);

  static BoxDecoration get normalDecoration1 => BoxDecoration(
      color: theme.colorScheme.primaryContainer,
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15), topRight: Radius.circular(15)));

  static NeumorphicStyle get normalNeumorphicDecoration => NeumorphicStyle(
      shape: NeumorphicShape.concave,
      depth: 2,
      intensity: 0.5,
      color: Colors.black.withOpacity(0.2),
      shadowLightColor: Colors.grey[600]);

  static NeumorphicStyle get featuredDecoration => NeumorphicStyle(
      shape: NeumorphicShape.concave,
      depth: 2,
      intensity: 0.5,
      color: Colors.black,
      shadowLightColor: Colors.grey[600]);

  static NeumorphicStyle get drawerDecoration => NeumorphicStyle(
      shape: NeumorphicShape.convex,
      intensity: 0.5,
      color: Colors.transparent,
      shadowLightColor: Colors.grey[600]);

  static NeumorphicStyle get backButtonDecoration => NeumorphicStyle(
      shape: NeumorphicShape.convex,
      intensity: 0.5,
      color: Colors.white,
      shadowLightColor: Colors.grey[600]);

  static NeumorphicStyle get elevatedButtonDecoration => NeumorphicStyle(
      depth: 8,
      intensity: 0,
      shape: NeumorphicShape.convex,
      color: Colors.white24,
      shadowLightColor: Colors.grey[600]);

  static NeumorphicStyle get elevatedButtonDecoration1 => NeumorphicStyle(
      depth: 8,
      intensity: 0,
      shape: NeumorphicShape.convex,
      color: Colors.blue,
      shadowLightColor: Colors.lightBlue[600]);

  static NeumorphicStyle get iconButtonDecoration => NeumorphicStyle(
      shape: NeumorphicShape.convex,
      depth: 4,
      intensity: 0.5,
      color: Colors.grey.withOpacity(0.2),
      shadowLightColor: Colors.grey[800]);

  static NeumorphicStyle get textDecoration => NeumorphicStyle(
        color: Colors.white,
        depth: -6,
        intensity: 0.7,
        shadowLightColor: Colors.white,
        shadowDarkColor: Colors.grey.withOpacity(0.4),
      );
}

class BorderRadiusStyle {
  static BorderRadius get roundedBorder5 => BorderRadius.circular(5.0);
}

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

class ProProfileTextStyles {
  // Display text style
  static get displaySmall =>
      theme.textTheme.displaySmall!.copyWith(fontSize: 30.0, height: 1.35);

  // Title text style
  static get titleMediumOnError => theme.textTheme.titleMedium!.copyWith(
      color: theme.colorScheme.onError.withOpacity(0.6),
      fontWeight: FontWeight.w700);

  static get titleMediumOnPrimaryContainer =>
      theme.textTheme.titleMedium!.copyWith(
          color: theme.colorScheme.onPrimaryContainer,
          fontWeight: FontWeight.w700);

  static get titleMediumOnPrimarySemiBold =>
      theme.textTheme.titleMedium!.copyWith(
          color: theme.colorScheme.onPrimaryContainer,
          fontWeight: FontWeight.w600);

  static get titleMediumSemiBold => theme.textTheme.titleMedium!
      .copyWith(fontSize: 16.0, fontWeight: FontWeight.w600);

  static get titleMediumSemiBold_1 =>
      theme.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w600);

  static get titleMedium => theme.textTheme.titleMedium!.copyWith(
      color: const Color(0XFF949494),
      fontSize: 16.0,
      fontWeight: FontWeight.w600);

  static get titleMedium1 => theme.textTheme.titleMedium!.copyWith(
      color: const Color(0XFFEBEBEB),
      fontSize: 16.0,
      fontWeight: FontWeight.w600);

  static get titleMedium2 => theme.textTheme.titleMedium!.copyWith(
      color: theme.colorScheme.errorContainer,
      fontSize: 16.0,
      fontWeight: FontWeight.w600);
}

class ProProfileButtonStyles {
  // Text button style
  static ButtonStyle get none => ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
      elevation: MaterialStateProperty.all<double>(0));
}

/// Class containing custom colors for a primary theme.
PrimaryColors get appTheme => ThemeHelper().themeColor();

ThemeData get theme => ThemeHelper().themeData();
