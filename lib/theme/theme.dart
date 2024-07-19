import 'package:json_theme/json_theme.dart';

class MyTheme {
  static get themeData {
    return ThemeDecoder.decodeThemeData(themeJson);
  }

  static get themeJson {
    return {
      "applyElevationOverlayColor": false,
      "brightness": "light",
      "buttonTheme": {
        "alignedDropdown": false,
        "colorScheme": {
          "background": "#fff8f9ff",
          "brightness": "light",
          "error": "#ffba1a1a",
          "errorContainer": "#ffffdad6",
          "inversePrimary": "#ffa0cafd",
          "inverseSurface": "#ff2e3135",
          "onBackground": "#ff191c20",
          "onError": "#ffffffff",
          "onErrorContainer": "#ff410002",
          "onInverseSurface": "#ffeff0f7",
          "onPrimary": "#ffffffff",
          "onPrimaryContainer": "#ff001d36",
          "onSecondary": "#ffffffff",
          "onSecondaryContainer": "#ff101c2b",
          "onSurface": "#ff191c20",
          "onSurfaceVariant": "#ff43474e",
          "onTertiary": "#ffffffff",
          "onTertiaryContainer": "#ff251431",
          "outline": "#ff73777f",
          "outlineVariant": "#ffc3c7cf",
          "primary": "#ff0161a3",
          "primaryContainer": "#ffd1e4ff",
          "scrim": "#ff000000",
          "secondary": "#ff535f70",
          "secondaryContainer": "#ffd7e3f7",
          "shadow": "#ff000000",
          "surface": "#fff8f9ff",
          "surfaceContainerHighest": "#ffe1e2e8",
          "surfaceTint": "#ff36618e",
          "tertiary": "#ff6b5778",
          "tertiaryContainer": "#fff2daff"
        },
        "height": 36,
        "layoutBehavior": "padded",
        "minWidth": 88,
        "padding": {"bottom": 0, "left": 16, "right": 16, "top": 0},
        "shape": {
          "borderRadius": {
            "bottomLeft": {"type": "elliptical", "x": 2, "y": 2},
            "bottomRight": {"type": "elliptical", "x": 2, "y": 2},
            "topLeft": {"type": "elliptical", "x": 2, "y": 2},
            "topRight": {"type": "elliptical", "x": 2, "y": 2},
            "type": "only"
          },
          "side": {
            "color": "#ff000000",
            "strokeAlign": -1,
            "style": "none",
            "width": 0
          },
          "type": "rounded"
        },
        "textTheme": "normal"
      },
      "canvasColor": "#fff8f9ff",
      "cardColor": "#fff8f9ff",
      "colorScheme": {
        "background": "#fff8f9ff",
        "brightness": "light",
        "error": "#ffba1a1a",
        "errorContainer": "#ffffdad6",
        "inversePrimary": "#ffa0cafd",
        "inverseSurface": "#ff2e3135",
        "onBackground": "#ff191c20",
        "onError": "#ffffffff",
        "onErrorContainer": "#ff410002",
        "onInverseSurface": "#ffeff0f7",
        "onPrimary": "#ffffffff",
        "onPrimaryContainer": "#ff001d36",
        "onSecondary": "#ffffffff",
        "onSecondaryContainer": "#ff101c2b",
        "onSurface": "#ff191c20",
        "onSurfaceVariant": "#ff43474e",
        "onTertiary": "#ffffffff",
        "onTertiaryContainer": "#ff251431",
        "outline": "#ff73777f",
        "outlineVariant": "#ffc3c7cf",
        "primary": "#ff0161a3",
        "primaryContainer": "#ffd1e4ff",
        "scrim": "#ff000000",
        "secondary": "#ff535f70",
        "secondaryContainer": "#ffd7e3f7",
        "shadow": "#ff000000",
        "surface": "#fff8f9ff",
        "surfaceContainerHighest": "#ffe1e2e8",
        "surfaceTint": "#ff36618e",
        "tertiary": "#ff6b5778",
        "tertiaryContainer": "#fff2daff"
      },
      "dialogBackgroundColor": "#fff8f9ff",
      "disabledColor": "#61000000",
      "dividerColor": "#1f191c20",
      "focusColor": "#1f000000",
      "highlightColor": "#66bcbcbc",
      "hintColor": "#99000000",
      "hoverColor": "#0a000000",
      "iconTheme": {"color": "#dd000000"},
      "indicatorColor": "#ffffffff",
      "inputDecorationTheme": {
        "alignLabelWithHint": false,
        "filled": false,
        "floatingLabelAlignment": "start",
        "floatingLabelBehavior": "auto",
        "isCollapsed": false,
        "isDense": false
      },
      "materialTapTargetSize": "shrinkWrap",
      "platform": "macOS",
      "primaryColor": "#ff0161a3",
      "primaryColorDark": "#ff1976d2",
      "primaryColorLight": "#ffbbdefb",
      "primaryIconTheme": {"color": "#ffffffff"},
      "primaryTextTheme": {
        "bodyLarge": {
          "color": "#fff8f9ff",
          "decoration": "none",
          "decorationColor": "#fff8f9ff",
          "fontFamily": ".AppleSystemUIFont",
          "fontSize": 16,
          "fontWeight": "w400",
          "inherit": false,
          "letterSpacing": 0.5,
          "textBaseline": "alphabetic"
        },
        "bodyMedium": {
          "color": "#fff8f9ff",
          "decoration": "none",
          "decorationColor": "#fff8f9ff",
          "fontFamily": ".AppleSystemUIFont",
          "fontSize": 14,
          "fontWeight": "w400",
          "inherit": false,
          "letterSpacing": 0.25,
          "textBaseline": "alphabetic"
        },
        "bodySmall": {
          "color": "#fff8f9ff",
          "decoration": "none",
          "decorationColor": "#fff8f9ff",
          "fontFamily": ".AppleSystemUIFont",
          "fontSize": 12,
          "fontWeight": "w400",
          "inherit": false,
          "letterSpacing": 0.4,
          "textBaseline": "alphabetic"
        },
        "displayLarge": {
          "color": "#fff8f9ff",
          "decoration": "none",
          "decorationColor": "#fff8f9ff",
          "fontFamily": ".AppleSystemUIFont",
          "fontSize": 96,
          "fontWeight": "w300",
          "inherit": false,
          "letterSpacing": -1.5,
          "textBaseline": "alphabetic"
        },
        "displayMedium": {
          "color": "#fff8f9ff",
          "decoration": "none",
          "decorationColor": "#fff8f9ff",
          "fontFamily": ".AppleSystemUIFont",
          "fontSize": 60,
          "fontWeight": "w300",
          "inherit": false,
          "letterSpacing": -0.5,
          "textBaseline": "alphabetic"
        },
        "displaySmall": {
          "color": "#fff8f9ff",
          "decoration": "none",
          "decorationColor": "#fff8f9ff",
          "fontFamily": ".AppleSystemUIFont",
          "fontSize": 48,
          "fontWeight": "w400",
          "inherit": false,
          "letterSpacing": 0,
          "textBaseline": "alphabetic"
        },
        "headlineLarge": {
          "color": "#fff8f9ff",
          "decoration": "none",
          "decorationColor": "#fff8f9ff",
          "fontFamily": ".AppleSystemUIFont",
          "fontSize": 40,
          "fontWeight": "w400",
          "inherit": false,
          "letterSpacing": 0.25,
          "textBaseline": "alphabetic"
        },
        "headlineMedium": {
          "color": "#fff8f9ff",
          "decoration": "none",
          "decorationColor": "#fff8f9ff",
          "fontFamily": ".AppleSystemUIFont",
          "fontSize": 34,
          "fontWeight": "w400",
          "inherit": false,
          "letterSpacing": 0.25,
          "textBaseline": "alphabetic"
        },
        "headlineSmall": {
          "color": "#fff8f9ff",
          "decoration": "none",
          "decorationColor": "#fff8f9ff",
          "fontFamily": ".AppleSystemUIFont",
          "fontSize": 24,
          "fontWeight": "w400",
          "inherit": false,
          "letterSpacing": 0,
          "textBaseline": "alphabetic"
        },
        "labelLarge": {
          "color": "#fff8f9ff",
          "decoration": "none",
          "decorationColor": "#fff8f9ff",
          "fontFamily": ".AppleSystemUIFont",
          "fontSize": 14,
          "fontWeight": "w500",
          "inherit": false,
          "letterSpacing": 1.25,
          "textBaseline": "alphabetic"
        },
        "labelMedium": {
          "color": "#fff8f9ff",
          "decoration": "none",
          "decorationColor": "#fff8f9ff",
          "fontFamily": ".AppleSystemUIFont",
          "fontSize": 11,
          "fontWeight": "w400",
          "inherit": false,
          "letterSpacing": 1.5,
          "textBaseline": "alphabetic"
        },
        "labelSmall": {
          "color": "#fff8f9ff",
          "decoration": "none",
          "decorationColor": "#fff8f9ff",
          "fontFamily": ".AppleSystemUIFont",
          "fontSize": 10,
          "fontWeight": "w400",
          "inherit": false,
          "letterSpacing": 1.5,
          "textBaseline": "alphabetic"
        },
        "titleLarge": {
          "color": "#fff8f9ff",
          "decoration": "none",
          "decorationColor": "#fff8f9ff",
          "fontFamily": ".AppleSystemUIFont",
          "fontSize": 20,
          "fontWeight": "w500",
          "inherit": false,
          "letterSpacing": 0.15,
          "textBaseline": "alphabetic"
        },
        "titleMedium": {
          "color": "#fff8f9ff",
          "decoration": "none",
          "decorationColor": "#fff8f9ff",
          "fontFamily": ".AppleSystemUIFont",
          "fontSize": 16,
          "fontWeight": "w400",
          "inherit": false,
          "letterSpacing": 0.15,
          "textBaseline": "alphabetic"
        },
        "titleSmall": {
          "color": "#fff8f9ff",
          "decoration": "none",
          "decorationColor": "#fff8f9ff",
          "fontFamily": ".AppleSystemUIFont",
          "fontSize": 14,
          "fontWeight": "w500",
          "inherit": false,
          "letterSpacing": 0.1,
          "textBaseline": "alphabetic"
        }
      },
      "scaffoldBackgroundColor": "#fff8f9ff",
      "secondaryHeaderColor": "#ffe3f2fd",
      "shadowColor": "#ff000000",
      "splashColor": "#66c8c8c8",
      "splashFactory": "ripple",
      "textTheme": {
        "bodyLarge": {
          "color": "#ff191c20",
          "decoration": "none",
          "decorationColor": "#ff191c20",
          "fontFamily": ".AppleSystemUIFont",
          "fontSize": 16,
          "fontWeight": "w400",
          "inherit": false,
          "letterSpacing": 0.5,
          "textBaseline": "alphabetic"
        },
        "bodyMedium": {
          "color": "#ff191c20",
          "decoration": "none",
          "decorationColor": "#ff191c20",
          "fontFamily": ".AppleSystemUIFont",
          "fontSize": 14,
          "fontWeight": "w400",
          "inherit": false,
          "letterSpacing": 0.25,
          "textBaseline": "alphabetic"
        },
        "bodySmall": {
          "color": "#ff191c20",
          "decoration": "none",
          "decorationColor": "#ff191c20",
          "fontFamily": ".AppleSystemUIFont",
          "fontSize": 12,
          "fontWeight": "w400",
          "inherit": false,
          "letterSpacing": 0.4,
          "textBaseline": "alphabetic"
        },
        "displayLarge": {
          "color": "#ff191c20",
          "decoration": "none",
          "decorationColor": "#ff191c20",
          "fontFamily": ".AppleSystemUIFont",
          "fontSize": 96,
          "fontWeight": "w300",
          "inherit": false,
          "letterSpacing": -1.5,
          "textBaseline": "alphabetic"
        },
        "displayMedium": {
          "color": "#ff191c20",
          "decoration": "none",
          "decorationColor": "#ff191c20",
          "fontFamily": ".AppleSystemUIFont",
          "fontSize": 60,
          "fontWeight": "w300",
          "inherit": false,
          "letterSpacing": -0.5,
          "textBaseline": "alphabetic"
        },
        "displaySmall": {
          "color": "#ff191c20",
          "decoration": "none",
          "decorationColor": "#ff191c20",
          "fontFamily": ".AppleSystemUIFont",
          "fontSize": 48,
          "fontWeight": "w400",
          "inherit": false,
          "letterSpacing": 0,
          "textBaseline": "alphabetic"
        },
        "headlineLarge": {
          "color": "#ff191c20",
          "decoration": "none",
          "decorationColor": "#ff191c20",
          "fontFamily": ".AppleSystemUIFont",
          "fontSize": 40,
          "fontWeight": "w400",
          "inherit": false,
          "letterSpacing": 0.25,
          "textBaseline": "alphabetic"
        },
        "headlineMedium": {
          "color": "#ff191c20",
          "decoration": "none",
          "decorationColor": "#ff191c20",
          "fontFamily": ".AppleSystemUIFont",
          "fontSize": 34,
          "fontWeight": "w400",
          "inherit": false,
          "letterSpacing": 0.25,
          "textBaseline": "alphabetic"
        },
        "headlineSmall": {
          "color": "#ff191c20",
          "decoration": "none",
          "decorationColor": "#ff191c20",
          "fontFamily": ".AppleSystemUIFont",
          "fontSize": 24,
          "fontWeight": "w400",
          "inherit": false,
          "letterSpacing": 0,
          "textBaseline": "alphabetic"
        },
        "labelLarge": {
          "color": "#ff191c20",
          "decoration": "none",
          "decorationColor": "#ff191c20",
          "fontFamily": ".AppleSystemUIFont",
          "fontSize": 14,
          "fontWeight": "w500",
          "inherit": false,
          "letterSpacing": 1.25,
          "textBaseline": "alphabetic"
        },
        "labelMedium": {
          "color": "#ff191c20",
          "decoration": "none",
          "decorationColor": "#ff191c20",
          "fontFamily": ".AppleSystemUIFont",
          "fontSize": 11,
          "fontWeight": "w400",
          "inherit": false,
          "letterSpacing": 1.5,
          "textBaseline": "alphabetic"
        },
        "labelSmall": {
          "color": "#ff191c20",
          "decoration": "none",
          "decorationColor": "#ff191c20",
          "fontFamily": ".AppleSystemUIFont",
          "fontSize": 10,
          "fontWeight": "w400",
          "inherit": false,
          "letterSpacing": 1.5,
          "textBaseline": "alphabetic"
        },
        "titleLarge": {
          "color": "#ff191c20",
          "decoration": "none",
          "decorationColor": "#ff191c20",
          "fontFamily": ".AppleSystemUIFont",
          "fontSize": 20,
          "fontWeight": "w500",
          "inherit": false,
          "letterSpacing": 0.15,
          "textBaseline": "alphabetic"
        },
        "titleMedium": {
          "color": "#ff191c20",
          "decoration": "none",
          "decorationColor": "#ff191c20",
          "fontFamily": ".AppleSystemUIFont",
          "fontSize": 16,
          "fontWeight": "w400",
          "inherit": false,
          "letterSpacing": 0.15,
          "textBaseline": "alphabetic"
        },
        "titleSmall": {
          "color": "#ff191c20",
          "decoration": "none",
          "decorationColor": "#ff191c20",
          "fontFamily": ".AppleSystemUIFont",
          "fontSize": 14,
          "fontWeight": "w500",
          "inherit": false,
          "letterSpacing": 0.1,
          "textBaseline": "alphabetic"
        }
      },
      "typography": {
        "black": {
          "bodyLarge": {
            "color": "#ff191c20",
            "decoration": "none",
            "decorationColor": "#ff191c20",
            "fontFamily": ".AppleSystemUIFont",
            "inherit": true
          },
          "bodyMedium": {
            "color": "#ff191c20",
            "decoration": "none",
            "decorationColor": "#ff191c20",
            "fontFamily": ".AppleSystemUIFont",
            "inherit": true
          },
          "bodySmall": {
            "color": "#ff191c20",
            "decoration": "none",
            "decorationColor": "#ff191c20",
            "fontFamily": ".AppleSystemUIFont",
            "inherit": true
          },
          "displayLarge": {
            "color": "#ff191c20",
            "decoration": "none",
            "decorationColor": "#ff191c20",
            "fontFamily": ".AppleSystemUIFont",
            "inherit": true
          },
          "displayMedium": {
            "color": "#ff191c20",
            "decoration": "none",
            "decorationColor": "#ff191c20",
            "fontFamily": ".AppleSystemUIFont",
            "inherit": true
          },
          "displaySmall": {
            "color": "#ff191c20",
            "decoration": "none",
            "decorationColor": "#ff191c20",
            "fontFamily": ".AppleSystemUIFont",
            "inherit": true
          },
          "headlineLarge": {
            "color": "#ff191c20",
            "decoration": "none",
            "decorationColor": "#ff191c20",
            "fontFamily": ".AppleSystemUIFont",
            "inherit": true
          },
          "headlineMedium": {
            "color": "#ff191c20",
            "decoration": "none",
            "decorationColor": "#ff191c20",
            "fontFamily": ".AppleSystemUIFont",
            "inherit": true
          },
          "headlineSmall": {
            "color": "#ff191c20",
            "decoration": "none",
            "decorationColor": "#ff191c20",
            "fontFamily": ".AppleSystemUIFont",
            "inherit": true
          },
          "labelLarge": {
            "color": "#ff191c20",
            "decoration": "none",
            "decorationColor": "#ff191c20",
            "fontFamily": ".AppleSystemUIFont",
            "inherit": true
          },
          "labelMedium": {
            "color": "#ff191c20",
            "decoration": "none",
            "decorationColor": "#ff191c20",
            "fontFamily": ".AppleSystemUIFont",
            "inherit": true
          },
          "labelSmall": {
            "color": "#ff191c20",
            "decoration": "none",
            "decorationColor": "#ff191c20",
            "fontFamily": ".AppleSystemUIFont",
            "inherit": true
          },
          "titleLarge": {
            "color": "#ff191c20",
            "decoration": "none",
            "decorationColor": "#ff191c20",
            "fontFamily": ".AppleSystemUIFont",
            "inherit": true
          },
          "titleMedium": {
            "color": "#ff191c20",
            "decoration": "none",
            "decorationColor": "#ff191c20",
            "fontFamily": ".AppleSystemUIFont",
            "inherit": true
          },
          "titleSmall": {
            "color": "#ff191c20",
            "decoration": "none",
            "decorationColor": "#ff191c20",
            "fontFamily": ".AppleSystemUIFont",
            "inherit": true
          }
        },
        "dense": {
          "bodyLarge": {
            "fontSize": 16,
            "fontWeight": "w400",
            "height": 1.5,
            "inherit": false,
            "leadingDistribution": "even",
            "letterSpacing": 0.5,
            "textBaseline": "ideographic"
          },
          "bodyMedium": {
            "fontSize": 14,
            "fontWeight": "w400",
            "height": 1.43,
            "inherit": false,
            "leadingDistribution": "even",
            "letterSpacing": 0.25,
            "textBaseline": "ideographic"
          },
          "bodySmall": {
            "fontSize": 12,
            "fontWeight": "w400",
            "height": 1.33,
            "inherit": false,
            "leadingDistribution": "even",
            "letterSpacing": 0.4,
            "textBaseline": "ideographic"
          },
          "displayLarge": {
            "fontSize": 57,
            "fontWeight": "w400",
            "height": 1.12,
            "inherit": false,
            "leadingDistribution": "even",
            "letterSpacing": -0.25,
            "textBaseline": "ideographic"
          },
          "displayMedium": {
            "fontSize": 45,
            "fontWeight": "w400",
            "height": 1.16,
            "inherit": false,
            "leadingDistribution": "even",
            "letterSpacing": 0,
            "textBaseline": "ideographic"
          },
          "displaySmall": {
            "fontSize": 36,
            "fontWeight": "w400",
            "height": 1.22,
            "inherit": false,
            "leadingDistribution": "even",
            "letterSpacing": 0,
            "textBaseline": "ideographic"
          },
          "headlineLarge": {
            "fontSize": 32,
            "fontWeight": "w400",
            "height": 1.25,
            "inherit": false,
            "leadingDistribution": "even",
            "letterSpacing": 0,
            "textBaseline": "ideographic"
          },
          "headlineMedium": {
            "fontSize": 28,
            "fontWeight": "w400",
            "height": 1.29,
            "inherit": false,
            "leadingDistribution": "even",
            "letterSpacing": 0,
            "textBaseline": "ideographic"
          },
          "headlineSmall": {
            "fontSize": 24,
            "fontWeight": "w400",
            "height": 1.33,
            "inherit": false,
            "leadingDistribution": "even",
            "letterSpacing": 0,
            "textBaseline": "ideographic"
          },
          "labelLarge": {
            "fontSize": 14,
            "fontWeight": "w500",
            "height": 1.43,
            "inherit": false,
            "leadingDistribution": "even",
            "letterSpacing": 0.1,
            "textBaseline": "ideographic"
          },
          "labelMedium": {
            "fontSize": 12,
            "fontWeight": "w500",
            "height": 1.33,
            "inherit": false,
            "leadingDistribution": "even",
            "letterSpacing": 0.5,
            "textBaseline": "ideographic"
          },
          "labelSmall": {
            "fontSize": 11,
            "fontWeight": "w500",
            "height": 1.45,
            "inherit": false,
            "leadingDistribution": "even",
            "letterSpacing": 0.5,
            "textBaseline": "ideographic"
          },
          "titleLarge": {
            "fontSize": 22,
            "fontWeight": "w400",
            "height": 1.27,
            "inherit": false,
            "leadingDistribution": "even",
            "letterSpacing": 0,
            "textBaseline": "ideographic"
          },
          "titleMedium": {
            "fontSize": 16,
            "fontWeight": "w500",
            "height": 1.5,
            "inherit": false,
            "leadingDistribution": "even",
            "letterSpacing": 0.15,
            "textBaseline": "ideographic"
          },
          "titleSmall": {
            "fontSize": 14,
            "fontWeight": "w500",
            "height": 1.43,
            "inherit": false,
            "leadingDistribution": "even",
            "letterSpacing": 0.1,
            "textBaseline": "ideographic"
          }
        },
        "englishLike": {
          "bodyLarge": {
            "fontSize": 16,
            "fontWeight": "w400",
            "height": 1.5,
            "inherit": false,
            "leadingDistribution": "even",
            "letterSpacing": 0.5,
            "textBaseline": "alphabetic"
          },
          "bodyMedium": {
            "fontSize": 14,
            "fontWeight": "w400",
            "height": 1.43,
            "inherit": false,
            "leadingDistribution": "even",
            "letterSpacing": 0.25,
            "textBaseline": "alphabetic"
          },
          "bodySmall": {
            "fontSize": 12,
            "fontWeight": "w400",
            "height": 1.33,
            "inherit": false,
            "leadingDistribution": "even",
            "letterSpacing": 0.4,
            "textBaseline": "alphabetic"
          },
          "displayLarge": {
            "fontSize": 57,
            "fontWeight": "w400",
            "height": 1.12,
            "inherit": false,
            "leadingDistribution": "even",
            "letterSpacing": -0.25,
            "textBaseline": "alphabetic"
          },
          "displayMedium": {
            "fontSize": 45,
            "fontWeight": "w400",
            "height": 1.16,
            "inherit": false,
            "leadingDistribution": "even",
            "letterSpacing": 0,
            "textBaseline": "alphabetic"
          },
          "displaySmall": {
            "fontSize": 36,
            "fontWeight": "w400",
            "height": 1.22,
            "inherit": false,
            "leadingDistribution": "even",
            "letterSpacing": 0,
            "textBaseline": "alphabetic"
          },
          "headlineLarge": {
            "fontSize": 32,
            "fontWeight": "w400",
            "height": 1.25,
            "inherit": false,
            "leadingDistribution": "even",
            "letterSpacing": 0,
            "textBaseline": "alphabetic"
          },
          "headlineMedium": {
            "fontSize": 28,
            "fontWeight": "w400",
            "height": 1.29,
            "inherit": false,
            "leadingDistribution": "even",
            "letterSpacing": 0,
            "textBaseline": "alphabetic"
          },
          "headlineSmall": {
            "fontSize": 24,
            "fontWeight": "w400",
            "height": 1.33,
            "inherit": false,
            "leadingDistribution": "even",
            "letterSpacing": 0,
            "textBaseline": "alphabetic"
          },
          "labelLarge": {
            "fontSize": 14,
            "fontWeight": "w500",
            "height": 1.43,
            "inherit": false,
            "leadingDistribution": "even",
            "letterSpacing": 0.1,
            "textBaseline": "alphabetic"
          },
          "labelMedium": {
            "fontSize": 12,
            "fontWeight": "w500",
            "height": 1.33,
            "inherit": false,
            "leadingDistribution": "even",
            "letterSpacing": 0.5,
            "textBaseline": "alphabetic"
          },
          "labelSmall": {
            "fontSize": 11,
            "fontWeight": "w500",
            "height": 1.45,
            "inherit": false,
            "leadingDistribution": "even",
            "letterSpacing": 0.5,
            "textBaseline": "alphabetic"
          },
          "titleLarge": {
            "fontSize": 22,
            "fontWeight": "w400",
            "height": 1.27,
            "inherit": false,
            "leadingDistribution": "even",
            "letterSpacing": 0,
            "textBaseline": "alphabetic"
          },
          "titleMedium": {
            "fontSize": 16,
            "fontWeight": "w500",
            "height": 1.5,
            "inherit": false,
            "leadingDistribution": "even",
            "letterSpacing": 0.15,
            "textBaseline": "alphabetic"
          },
          "titleSmall": {
            "fontSize": 14,
            "fontWeight": "w500",
            "height": 1.43,
            "inherit": false,
            "leadingDistribution": "even",
            "letterSpacing": 0.1,
            "textBaseline": "alphabetic"
          }
        },
        "tall": {
          "bodyLarge": {
            "fontSize": 16,
            "fontWeight": "w400",
            "height": 1.5,
            "inherit": false,
            "leadingDistribution": "even",
            "letterSpacing": 0.5,
            "textBaseline": "alphabetic"
          },
          "bodyMedium": {
            "fontSize": 14,
            "fontWeight": "w400",
            "height": 1.43,
            "inherit": false,
            "leadingDistribution": "even",
            "letterSpacing": 0.25,
            "textBaseline": "alphabetic"
          },
          "bodySmall": {
            "fontSize": 12,
            "fontWeight": "w400",
            "height": 1.33,
            "inherit": false,
            "leadingDistribution": "even",
            "letterSpacing": 0.4,
            "textBaseline": "alphabetic"
          },
          "displayLarge": {
            "fontSize": 57,
            "fontWeight": "w400",
            "height": 1.12,
            "inherit": false,
            "leadingDistribution": "even",
            "letterSpacing": -0.25,
            "textBaseline": "alphabetic"
          },
          "displayMedium": {
            "fontSize": 45,
            "fontWeight": "w400",
            "height": 1.16,
            "inherit": false,
            "leadingDistribution": "even",
            "letterSpacing": 0,
            "textBaseline": "alphabetic"
          },
          "displaySmall": {
            "fontSize": 36,
            "fontWeight": "w400",
            "height": 1.22,
            "inherit": false,
            "leadingDistribution": "even",
            "letterSpacing": 0,
            "textBaseline": "alphabetic"
          },
          "headlineLarge": {
            "fontSize": 32,
            "fontWeight": "w400",
            "height": 1.25,
            "inherit": false,
            "leadingDistribution": "even",
            "letterSpacing": 0,
            "textBaseline": "alphabetic"
          },
          "headlineMedium": {
            "fontSize": 28,
            "fontWeight": "w400",
            "height": 1.29,
            "inherit": false,
            "leadingDistribution": "even",
            "letterSpacing": 0,
            "textBaseline": "alphabetic"
          },
          "headlineSmall": {
            "fontSize": 24,
            "fontWeight": "w400",
            "height": 1.33,
            "inherit": false,
            "leadingDistribution": "even",
            "letterSpacing": 0,
            "textBaseline": "alphabetic"
          },
          "labelLarge": {
            "fontSize": 14,
            "fontWeight": "w500",
            "height": 1.43,
            "inherit": false,
            "leadingDistribution": "even",
            "letterSpacing": 0.1,
            "textBaseline": "alphabetic"
          },
          "labelMedium": {
            "fontSize": 12,
            "fontWeight": "w500",
            "height": 1.33,
            "inherit": false,
            "leadingDistribution": "even",
            "letterSpacing": 0.5,
            "textBaseline": "alphabetic"
          },
          "labelSmall": {
            "fontSize": 11,
            "fontWeight": "w500",
            "height": 1.45,
            "inherit": false,
            "leadingDistribution": "even",
            "letterSpacing": 0.5,
            "textBaseline": "alphabetic"
          },
          "titleLarge": {
            "fontSize": 22,
            "fontWeight": "w400",
            "height": 1.27,
            "inherit": false,
            "leadingDistribution": "even",
            "letterSpacing": 0,
            "textBaseline": "alphabetic"
          },
          "titleMedium": {
            "fontSize": 16,
            "fontWeight": "w500",
            "height": 1.5,
            "inherit": false,
            "leadingDistribution": "even",
            "letterSpacing": 0.15,
            "textBaseline": "alphabetic"
          },
          "titleSmall": {
            "fontSize": 14,
            "fontWeight": "w500",
            "height": 1.43,
            "inherit": false,
            "leadingDistribution": "even",
            "letterSpacing": 0.1,
            "textBaseline": "alphabetic"
          }
        },
        "white": {
          "bodyLarge": {
            "color": "#fff8f9ff",
            "decoration": "none",
            "decorationColor": "#fff8f9ff",
            "fontFamily": ".AppleSystemUIFont",
            "inherit": true
          },
          "bodyMedium": {
            "color": "#fff8f9ff",
            "decoration": "none",
            "decorationColor": "#fff8f9ff",
            "fontFamily": ".AppleSystemUIFont",
            "inherit": true
          },
          "bodySmall": {
            "color": "#fff8f9ff",
            "decoration": "none",
            "decorationColor": "#fff8f9ff",
            "fontFamily": ".AppleSystemUIFont",
            "inherit": true
          },
          "displayLarge": {
            "color": "#fff8f9ff",
            "decoration": "none",
            "decorationColor": "#fff8f9ff",
            "fontFamily": ".AppleSystemUIFont",
            "inherit": true
          },
          "displayMedium": {
            "color": "#fff8f9ff",
            "decoration": "none",
            "decorationColor": "#fff8f9ff",
            "fontFamily": ".AppleSystemUIFont",
            "inherit": true
          },
          "displaySmall": {
            "color": "#fff8f9ff",
            "decoration": "none",
            "decorationColor": "#fff8f9ff",
            "fontFamily": ".AppleSystemUIFont",
            "inherit": true
          },
          "headlineLarge": {
            "color": "#fff8f9ff",
            "decoration": "none",
            "decorationColor": "#fff8f9ff",
            "fontFamily": ".AppleSystemUIFont",
            "inherit": true
          },
          "headlineMedium": {
            "color": "#fff8f9ff",
            "decoration": "none",
            "decorationColor": "#fff8f9ff",
            "fontFamily": ".AppleSystemUIFont",
            "inherit": true
          },
          "headlineSmall": {
            "color": "#fff8f9ff",
            "decoration": "none",
            "decorationColor": "#fff8f9ff",
            "fontFamily": ".AppleSystemUIFont",
            "inherit": true
          },
          "labelLarge": {
            "color": "#fff8f9ff",
            "decoration": "none",
            "decorationColor": "#fff8f9ff",
            "fontFamily": ".AppleSystemUIFont",
            "inherit": true
          },
          "labelMedium": {
            "color": "#fff8f9ff",
            "decoration": "none",
            "decorationColor": "#fff8f9ff",
            "fontFamily": ".AppleSystemUIFont",
            "inherit": true
          },
          "labelSmall": {
            "color": "#fff8f9ff",
            "decoration": "none",
            "decorationColor": "#fff8f9ff",
            "fontFamily": ".AppleSystemUIFont",
            "inherit": true
          },
          "titleLarge": {
            "color": "#fff8f9ff",
            "decoration": "none",
            "decorationColor": "#fff8f9ff",
            "fontFamily": ".AppleSystemUIFont",
            "inherit": true
          },
          "titleMedium": {
            "color": "#fff8f9ff",
            "decoration": "none",
            "decorationColor": "#fff8f9ff",
            "fontFamily": ".AppleSystemUIFont",
            "inherit": true
          },
          "titleSmall": {
            "color": "#fff8f9ff",
            "decoration": "none",
            "decorationColor": "#fff8f9ff",
            "fontFamily": ".AppleSystemUIFont",
            "inherit": true
          }
        }
      },
      "unselectedWidgetColor": "#8a000000",
      "useMaterial3": true,
      "visualDensity": "compact"
    };
  }
}
