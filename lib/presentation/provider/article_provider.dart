import 'package:flutter/material.dart';
import 'package:jewepe/common/result_state.dart';
import 'package:jewepe/data/model/comment.dart';
import 'package:jewepe/main.dart';

import '../../data/model/article.dart';

class ArticleProvider with ChangeNotifier {
  List<Article> articleDataList = [];
  List<Article> articleBackup = [];

  ResultState articleState = ResultState.empty;

  Future searchData(String id) async {
    // print('Search');
    articleDataList = List.from(articleBackup);
    if (id.isNotEmpty) {
      articleDataList.removeWhere((element) => (!element.id.contains(id)));
    }
    articleState =
        articleDataList.isEmpty ? ResultState.noData : ResultState.hasData;
    notifyListeners();
  }

  void backUp() {
    articleBackup = List.from(articleDataList);
  }

  Future fetchAllArticleData() async {
    articleState = ResultState.loading;
    notifyListeners();

    handler.getAllData().then((value) {
      articleDataList = value;
      backUp();
      articleState =
          articleDataList.isEmpty ? ResultState.noData : ResultState.hasData;
      notifyListeners();
    }).onError((error, stackTrace) {
      print('=== ${error.toString()}');
      print('=== ${stackTrace}');
      articleState = ResultState.error;
      notifyListeners();
    });
  }

  Future addOfflineData(Article data) async {
    articleDataList.add(data);
    backUp();
    articleState =
        articleDataList.isEmpty ? ResultState.noData : ResultState.hasData;
    notifyListeners();
  }

  Future deletedData(String id) async {
    articleDataList.removeWhere((element) => element.id == id);
    backUp();
    articleState =
        articleDataList.isEmpty ? ResultState.noData : ResultState.hasData;
    notifyListeners();
  }

  // Future addDiagnosisData(String id, List<Comments> comment) async {
  //   articleDataList[articleDataList.indexWhere((element) => element.id == id)]
  //       .comments = comment;
  //   backUp();
  //   articleState = ResultState.hasData;
  //   notifyListeners();
  // }

  Future updateData(String id, Map<String, dynamic> data) async {
    int loop = 0;
    for (Article i in articleDataList) {
      if (i.id == id) {
        Map<String, dynamic> buffer = i.toMap();

        List<String> key = data.keys.toList();
        List values = data.values.toList();

        for (int i = 0; i < key.length; i++) {
          buffer[key[i]] = values[i];
        }
        articleDataList[loop] = Article.fromJson(buffer);
        break;
      }
      loop++;
    }
    backUp();
    notifyListeners();
  }
}
