import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:sqflite/sqflite.dart';
class DictionaryModel {
  String no;

  String chinese;
  String yale;
  String jyutping;
  String catOnknees;
  String japanese;
  String note1;
  String note2;
  String category;
  String type;
  String status;
  String audio1;
  String audio2;
  String audio3;
  String audio4;
  String audio5;
  String audio6;
  String audio7;
  String audio8;
  String audio9;
  String audio10;
  String vocabulary;
  String voiceData;

  DictionaryModel({
    required this.no,

    required this.catOnknees,
    required this.yale,
    required this.jyutping,
    required this.chinese,
    required this.status,

    required this.audio1,
    required this.audio2,
    required this.audio3,
    required this.audio4,
    required this.audio5,
    required this.audio6,
    required this.audio7,
    required this.audio8,
    required this.audio9,
    required this.audio10,
    required this.category,
    required this.japanese,
    required this.note1,
    required this.note2,
    required this.vocabulary,
    required this.type,
    required this.voiceData

  });

  factory DictionaryModel.fromMap(Map<String, dynamic> json) {

    return DictionaryModel(
        no: json['ItemNo'].toString(),
        status: json['Status'].toString(),
        chinese: json['Chinese'].toString(),
        yale: json['Yale'].toString(),
        jyutping: json['Jyutping'].toString(),
        catOnknees: json['CatOnKnees'].toString(),
        japanese: json['Japanese'].toString(),
        note1: json['Note1'].toString(),
        note2: json['Note2'].toString(),
        vocabulary: json['Vocabulary'].toString(),
        category: json['Category'].toString(),
      type: json['Type'].toString(),
        voiceData: json['VoiceData'].toString(),
        audio1: json['Voice1'].toString(),
        audio2: json['Voice2'].toString(),
        audio3: json['Voice3'].toString(),
        audio4: json['Voice4'].toString(),
        audio5: json['Voice5'].toString(),
        audio6: json['Voice6'].toString(),
        audio7: json['Voice7'].toString(),
        audio8: json['Voice8'].toString(),
        audio9: json['Voice9'].toString(),
        audio10: json['Voice10'].toString(),
        );
  }

  static List<DictionaryModel> decodeDictionary(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<DictionaryModel>((json) => DictionaryModel.fromMap(json))
        .toList();
  }

  static Future<List<DictionaryModel>> fetchDictionary() async {
    //print('herehere');
    final response = await http.get(
        Uri.parse(
            'https://script.google.com/macros/s/AKfycbzrwzq1D_n8GNDzG5HYjVomhV0cMj5CvSzy-_a9Idv9KW81qinLOsd33ju6O9rUxaZzLg/exec'

        ));
    if (response.statusCode == 200) {
      // print(response.body);
      return decodeDictionary(response.body);
    } else {
      throw Exception('Unable to fetch data from the REST API');
    }
  }

  ///必要かわかんない
  static List<DictionaryModel> searchDictionary(
      List<DictionaryModel> dictionaryList,String? cantonese, String? jyutping, String? catonknees,
      String? japanese, bool voiceItem) {
    List<DictionaryModel> dictionaryListTemp = [];
    // DictionaryModel monumentTemp = DictionaryModel(no: "", cok: "", catOnknees: "", yale: "", jyutping: "", cantonese: "", status: "", audio: "", audio1: "", audio2: "", audio3: "", audio4: "", audio5: "", audio6: "", audio7: "", audio8: "", audio9: "", audio10: "", category: "", japanese: "", note1: "", note2: "", romaji: "", type: "");
    if(cantonese== null && jyutping==null &&catonknees==null&&japanese==null&&voiceItem == false ){
      return dictionaryList;
    }else{
      int s = 0;
      for(var i=0;i<dictionaryList.length;i++) {
        if ((dictionaryList[i].chinese.contains(cantonese??""))
            && (dictionaryList[i].catOnknees.contains(catonknees??""))
            && (dictionaryList[i].jyutping.contains(jyutping??"")||dictionaryList[i].yale.contains(jyutping??""))
            && (dictionaryList[i].japanese.contains(japanese??""))
            &&  ((voiceItem== true && dictionaryList[i].voiceData=="Y")|| voiceItem==false)){
          dictionaryListTemp.insert(s, dictionaryList[i]);

          s = s + 1;

        }

      }
      //dictionaryListTemp.reversed;

    }
    // if (kDebugMode) {
    //   print(firstItem);
    // }
    return dictionaryListTemp;
  }

  ///sqlite


}