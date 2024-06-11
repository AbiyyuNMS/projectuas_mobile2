import 'package:flutter/services.dart' as the_bundle;
import 'package:prj_uas223_d1_24/models/sneakers_model.dart';

//class ini bakalan ambil data dari file JSON dan di return ke aplikasi
class Helper {
  //Male
  Future<List<Welcome>> getMaleSneaker() async {
    final data =
        await the_bundle.rootBundle.loadString("assets/json/men_shoes.json");
    final maleList = welcomeFromJson(data);

    return maleList;
  }

  //Female
  Future<List<Welcome>> getFemaleSneaker() async {
    final data =
        await the_bundle.rootBundle.loadString("assets/json/women_shoes.json");
    final femaleList = welcomeFromJson(data);

    return femaleList;
  }

  //Kids
  Future<List<Welcome>> getKidsSneaker() async {
    final data =
        await the_bundle.rootBundle.loadString("assets/json/kids_shoes.json");
    final kidsList = welcomeFromJson(data);

    return kidsList;
  }

//single male
  Future<Welcome> getMaleSneakerById(String id) async {
    final data =
        await the_bundle.rootBundle.loadString("assets/json/men_shoes.json");
    final maleList = welcomeFromJson(data);

    final sneakers = maleList.firstWhere((sneakers) => sneakers.id == id);
    return sneakers;
  }

//single male
  Future<Welcome> getFemaleSneakerById(String id) async {
    final data =
        await the_bundle.rootBundle.loadString("assets/json/women_shoes.json");
    final maleList = welcomeFromJson(data);

    final sneakers = maleList.firstWhere((sneakers) => sneakers.id == id);
    return sneakers;
  }

//single male
  Future<Welcome> getKidsSneakerById(String id) async {
    final data =
        await the_bundle.rootBundle.loadString("assets/json/kids_shoes.json");
    final maleList = welcomeFromJson(data);

    final sneakers = maleList.firstWhere((sneakers) => sneakers.id == id);
    return sneakers;
  }
}
