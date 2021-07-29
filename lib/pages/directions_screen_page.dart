import 'package:flutter/material.dart';
import 'package:qr_scanner/widgets/scan_tiles.dart';

class DirectionsScreenPage extends StatelessWidget {

   @override
  Widget build(BuildContext context) {

    return ScanTiles(tipo: 'http');

  }
}