import 'package:flutter/foundation.dart';
import 'chair.dart';

class CinemaProvider with ChangeNotifier {
  String _rowSelected = "";
  List<Chair> _columnSelected = [];

  String get rowSelected => _rowSelected;

  void setRowSelected(String s) {
    _rowSelected = s;
    notifyListeners();
  }

  List<Chair> get columnSelected => _columnSelected;

  void addSelectedChair(Chair chair) {
    _columnSelected.add(chair);
  }

  void removeSelectedChair(int column) {

  }

  String selectedToString(){
    String s = "";
    for(int i = 0; i < _columnSelected.length ; i++){
      s += _columnSelected[i].cNum.toString() + ", ";
    }
    return s;
  }
}