import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:jewepe/data/model/article.dart';
import 'package:jewepe/data/model/comment.dart';
import 'package:uuid/uuid.dart';

class FirestoreHandler {
  final DatabaseReference databaseReference;
  String userId = '';
  String email = '';

  FirestoreHandler(this.databaseReference);

  Future userInit(String id, String email) async {
    databaseReference.once().then((value) => print(value.snapshot.value));
  }

  Future<Map<String, dynamic>> updateArticleData(
      Map<String, dynamic> data, String id) async {
    DataSnapshot snapshot = await databaseReference.child(id).get();
    bool exist = snapshot.exists;

    if (exist) {
      Map<String, dynamic> buffer = data;
      buffer.addAll({
        'updateBy': userId,
        'updateByEmail': email,
      });

      databaseReference.child(id).update(buffer);

      return {'bool': true, 'message': 'Berhasil'};
    } else {
      return {'bool': false, 'message': 'Data tidak ditemukan'};
    }
  }

  Future deleteArticleData(String id) async {
    databaseReference.child(id).remove();
  }

  // Future<List<Cow>>
  Future<List<Article>> getAllData() async {
    final snapshot = await databaseReference.once();
    List<Article> buffer = [];
    Map<String, Map<String, Comments>> bufferComment = {};
    // print(snapshot.snapshot.value);
    // print('=====');
    if (snapshot.snapshot.value == null) {
      return buffer;
    }

    Map<String, dynamic> data = Map<String, dynamic>.from(
        snapshot.snapshot.value as Map<dynamic, dynamic>);
    //
    // print('=====1');
    // print(data);
    // print('=====2');
    Map<String, dynamic> commentData = {};

    data.forEach((keyParent, value) {
      Map<String, dynamic> iterationData =
          Map<String, dynamic>.from(value as Map<dynamic, dynamic>);
      Map<String, dynamic> bufferData = {};
      iterationData.forEach((key, value) {
        // print('*** $key : $value');
        if (key != 'comments') {
          bufferData.addAll(toObjectMap(key, value, stringValue: true));
        } else {
          commentData[keyParent] =
              Map<String, dynamic>.from(value as Map<dynamic, dynamic>);
          bufferComment[keyParent] = {};
        }
      });
      buffer.add(Article.fromJson(bufferData));
    });
    commentData.forEach((keyX, value) {
      value.forEach((key, value) {
        Map<String, dynamic> iterationData =
            Map<String, dynamic>.from(value as Map<dynamic, dynamic>);
        Map<String, dynamic> bufferData = {};
        iterationData.forEach((key, value) {
          print('*** $key : $value');

          bufferData.addAll(toObjectMap(key, value, stringValue: true));
        });
        bufferComment[keyX]![key] = Comments.fromJson(bufferData);
        // buffer.add(Article.fromJson(bufferData));
      });
    });
    // print(bufferComment['1b54748b']);

    for (String i in bufferComment.keys) {
      buffer[buffer.indexWhere((element) => element.id == i)].comments =
          bufferComment[i];
    }

    // print(buffer[0].id);
    // print(buffer[0].type);
    // buffer
    return buffer;
  }

  Future<Map<String, dynamic>> addNewData(Article data) async {
    String id = const Uuid().v4().substring(0, 8);
    DataSnapshot snapshot = await databaseReference.child(id).get();
    bool exist = snapshot.exists;

    if (!exist) {
      Map<String, dynamic> buffer = data.toMap();
      buffer.addAll({
        'createdBy': userId,
        'createdByEmail': email,
      });

      buffer['id'] = id;

      databaseReference.child(id).set(buffer);

      return {'bool': true, 'message': 'Berhasil', 'data': data};
    } else {
      return {'bool': false, 'message': 'id article Sudah digunakan'};
    }
  }

  Future<Map<String, dynamic>> addNewComment(
      Comments comment, String id) async {
    DataSnapshot snapshot = await databaseReference.child(id).get();
    bool exist = snapshot.exists;

    if (exist) {
      Map<String, dynamic> buffer = comment.toMap();

      databaseReference.child(id).update(buffer);

      await Future.delayed(const Duration(microseconds: 500));

      return {'bool': true, 'message': 'Berhasil', 'data': comment};
    } else {
      return {'bool': false, 'message': 'Data Tidak Ditemukan'};
    }
  }

  Map<String, dynamic> toObjectMap(dynamic key, dynamic value,
      {bool stringValue = false}) {
    String convertValue = value.toString();
    String convertKey = key.toString();

    Map<String, dynamic> result;

    if (stringValue) {
      return {convertKey: convertValue};
    } else {
      try {
        int test = int.parse(convertValue);

        result = {convertKey: test};
      } catch (e) {
        result = {convertKey: convertValue};
      }

      return result;
    }
  }
}

class Cow {
  final String id;

  Cow(this.id);

  factory Cow.fromMap(Map<String, dynamic> data) => Cow('id');

  Map<String, dynamic> toMap() => {};
}

class Diagnosa {
  Map<String, dynamic> toMap() => {};
}
