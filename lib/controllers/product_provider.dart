import 'package:flutter/material.dart';
import 'package:prj_uas223_d1_24/models/sneakers_model.dart';
import 'package:prj_uas223_d1_24/services/helper.dart';

class ProductNotifier extends ChangeNotifier {
  int _activePage = 0;
  List<dynamic> _shoeSizes = [];
  List<String> _sizes = [];

  int get activePage => _activePage;

  set activePage(int newIndex) {
    _activePage = newIndex;
    notifyListeners();
  }

  List<dynamic> get shoeSizes => _shoeSizes;
  set shoeSizes(List<dynamic> newSizes) {
    _shoeSizes = newSizes;
    notifyListeners();
  }

  void toggleCheck(int index) {
    for (int i = 0; i < _shoeSizes.length; i++) {
      if (i == index) {
        _shoeSizes[i]['isSelected'] = !_shoeSizes[i]['isSelected'];
      }
    }
    notifyListeners();
  }

  List<String> get sizes => _sizes;
  set sizes(List<String> newSizes) {
    _sizes = newSizes;
    notifyListeners();
  }

  late Future<List<Welcome>> male;
  late Future<List<Welcome>> female;
  late Future<List<Welcome>> kids;
  late Future<Welcome> sneaker;

  void getMale() {
    male = Helper().getMaleSneaker();
  }

  void getFemale() {
    female = Helper().getFemaleSneaker();
  }

  void getKids() {
    kids = Helper().getKidsSneaker();
  }

  void getShoes(String category, String id) {
    if (category == "Men's Running") {
      sneaker = Helper().getMaleSneakerById(id);
    } else if (category == "Women's Running") {
      sneaker = Helper().getFemaleSneakerById(id);
    } else {
      sneaker = Helper().getKidsSneakerById(id);
    }
  }
}
