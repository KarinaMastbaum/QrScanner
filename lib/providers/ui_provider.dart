import 'package:flutter/material.dart';

class UiProvider extends ChangeNotifier {

int _selectedMenuOpt = 0;

// get Obtiene un valor
int get selectedMenuOpt {
  return this._selectedMenuOpt;
}


// Set establece un valor
set selectedMenuOpt ( int i ) {
  this._selectedMenuOpt = i;
  notifyListeners();
}

}