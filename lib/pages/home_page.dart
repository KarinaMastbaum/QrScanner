import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/pages/directions_screen_page.dart';
import 'package:qr_scanner/providers/db_provider.dart';
import 'package:qr_scanner/providers/scan_list_provider.dart';
import 'package:qr_scanner/providers/ui_provider.dart';
import 'package:qr_scanner/widgets/custom_navigatorBar.dart';
import 'package:qr_scanner/widgets/scan_button.dart';

import 'maps_screen_page.dart';


class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text('Historial'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: () {

              Provider.of<ScanListProvider>(context, listen: false)
              .borrarTodos();


            },
          )
        ],
      ),
      body: _HomePageBody(),
     bottomNavigationBar: CustomNavigatorBar(),
     floatingActionButton: ScanButton(),
     floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
   );
  }
}


class _HomePageBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final uiProvider = Provider.of<UiProvider>(context);

    final currentIndex = uiProvider.selectedMenuOpt;

    DBProvider.db.database;

  //Scan List Provider
  final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);

    switch( currentIndex) {

      case 0: 
      scanListProvider.cargarScanPorTipo('geo');
      return MapsScreenPage();

      case 1:
      scanListProvider.cargarScanPorTipo('http');
      return DirectionsScreenPage();

      default: 
      return MapsScreenPage();
    }
   
  }
}
