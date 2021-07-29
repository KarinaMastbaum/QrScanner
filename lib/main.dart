import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/pages/home_page.dart';
import 'package:qr_scanner/pages/map_page.dart';
import 'package:qr_scanner/providers/scan_list_provider.dart';
import 'package:qr_scanner/providers/ui_provider.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => new UiProvider()),
          ChangeNotifierProvider(create: (_) => new ScanListProvider()),
        ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'QR Scanner',
            initialRoute: 'first Screen',
            routes: {
              // 'first Screen': (_) => FirstScreen(),
              'home': (_) => HomePage(),
              'map': (_) => MapPage(),
            },
            theme: ThemeData(
              primaryColor: Colors.deepPurple[300], 
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Colors.deepPurple,
            ),
        ),
      ),
    );
  }
}