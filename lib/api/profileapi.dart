import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testrun/model/usermodel.dart';

StateProvider<UserModel> userdataProvider = StateProvider((ref) => UserModel());

Future fetchuserdata({required WidgetRef ref}) async {
  Dio dio = Dio();

  final response =
      await dio.get("https://jsonplaceholder.typicode.com/users/1");

  if (response.statusCode == 200) {
    ref.watch(userdataProvider.notifier).state =
        UserModel.fromJson(response.data);
  } else {
    log(response.statusCode.toString());
  }
}
