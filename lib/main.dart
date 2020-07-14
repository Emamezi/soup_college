import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/soup_overview_screen.dart';
import './screens/soup_detail_screen.dart';
import './provider/soups.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: Soups(),
      child: MaterialApp(
        theme: ThemeData.light().copyWith(
          appBarTheme: AppBarTheme(
            color: Colors.white,
            textTheme: TextTheme().copyWith(
              headline1: TextStyle(
                fontSize: 30.0,
                fontFamily: 'Satisfy',
              ),
            ),
            iconTheme: IconThemeData(color: Colors.black),
          ),
        ),
        title: 'Soup College',
        initialRoute: '/',
        routes: {
          '/': (ctx) => SoupOverviewScreen(),
          SoupDetailScreen.routeName: (ctx) => SoupDetailScreen(),
        },
      ),
    );
  }
}
