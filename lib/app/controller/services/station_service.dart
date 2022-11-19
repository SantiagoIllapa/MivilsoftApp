import 'dart:convert';

import 'package:mivilsoft_app/app/model/Classes/comment.dart';
import 'package:mivilsoft_app/app/model/Classes/conector.dart';
import 'package:http/http.dart' as http;

Future<List<Conector>> getConectorsData() async {
  List<Conector> list = [];
  await Future.delayed(const Duration(milliseconds: 5000), () {
    list = conectores;
  });
  return list;
}

Future<List<Comment>> getCommentsData() async {
  List<Comment> list = [];
  await Future.delayed(const Duration(milliseconds: 1000), () {
    list = comentarios;
  });
  return list;
}

Future<List<String>> getPicturesData() async {
  List<String> list = [];
  await Future.delayed(const Duration(milliseconds: 5000), () async {
    final response = await http.get(Uri.parse('https://picsum.photos/v2/list'));
    final json = jsonDecode(response.body);

    for (var img in json) {
      list.add('https://picsum.photos/id/${img['id']}/500/500');
    }
  });
  return list;
}

List<Comment> comentarios = [
  Comment(
      name: 'Pepito',
      description: 'asdasdasdasdasdasfaqrqwerqwerqwerqwer',
      score: 5,
      date: DateTime.now()),
  Comment(
      name: 'Juan',
      description: 'asdasdasdasdasdasfaqrqwerqwerqwerqwer',
      score: 1,
      date: DateTime.now()),
  Comment(
      name: 'Maria',
      description: 'asdasdasdasdasdasfaqrqwerqwerqwerqwer',
      score: 4,
      date: DateTime.now()),
  Comment(
      name: 'Mario',
      description: 'asdasdasdasda',
      score: 3,
      date: DateTime.now()),
  Comment(
      name: 'Lola',
      description:
          'asdasdasdasdasdasfaqrqwerqwerqwerqwerafadfsdafsdafsdafsdafsdafsdafsadfsdafsdafsfdsasadf',
      score: 2,
      date: DateTime.now()),
];
List<Conector> conectores = [
  Conector(
      power: 250,
      type: chargerType.entries.elementAt(1),
      status: chargerStatus.entries.elementAt(0)),
  Conector(
      power: 150,
      type: chargerType.entries.elementAt(2),
      status: chargerStatus.entries.elementAt(1)),
  Conector(
      power: 350,
      type: chargerType.entries.elementAt(0),
      status: chargerStatus.entries.elementAt(2)),
  Conector(
      power: 110,
      type: chargerType.entries.elementAt(3),
      status: chargerStatus.entries.elementAt(0)),
  Conector(
      power: 110,
      type: chargerType.entries.elementAt(4),
      status: chargerStatus.entries.elementAt(0)),
  Conector(
      power: 110,
      type: chargerType.entries.elementAt(5),
      status: chargerStatus.entries.elementAt(0)),
];
