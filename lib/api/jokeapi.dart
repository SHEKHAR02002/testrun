import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:testrun/model/jokemodel.dart';

Future<List<Joke>> getjokeapi() async {
  Dio dio = Dio();
  log('come');
  final response = await dio.get("https://api.imgflip.com/get_memes");

  // final response =
  //     await http.get(Uri.parse("http://api.imgflip.com/get_memes"));

  if (response.statusCode == 200) {
    final List data = response.data['data']['memes'];

    return data.map((e) => Joke.fromJson(e)).toList();
  } else {
    log("${response.statusCode.toString()}getmeme");
    return [];
  }
}
