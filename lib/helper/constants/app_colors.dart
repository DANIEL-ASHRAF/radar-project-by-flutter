import 'package:flutter/material.dart';

const Color whiteColor=Colors.white;

const Color errorColor= Color(0xFFF36D6F);

const Color backgroundColor=Color(0xFFFFFBCE);
const Color greenColor=Color(0xFF33691E);
const Color brownColor= Color(0xFF914D00);
const Color bottomTabBarColor=Color(0xFFE3A662);
const Color greyColor= Color(0xFFEcF0F1);

ThemeData normalMode= ThemeData(
        primaryColor: bottomTabBarColor,
        accentColor: backgroundColor,
        textSelectionTheme: TextSelectionThemeData(
            selectionColor: bottomTabBarColor,
            selectionHandleColor:brownColor
        ),
        scaffoldBackgroundColor: backgroundColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
);