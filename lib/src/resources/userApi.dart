// ignore_for_file: file_names, avoid_print

import 'dart:convert';
import 'dart:io';

import '../../helper/paths.dart';
import '../responses/login_response.dart';
import 'package:http/http.dart' as http;

class UserApi {
  static Future<LoginResponse> connectToApi(
      String email, String password) async {
    try {
      print("${Paths.baseurl}${Paths.login}");
      var response = await http.post(
          Uri.parse(
            "${Paths.baseurl}${Paths.login}",
          ),
          body: {"email": email, "password": password});
      Map<String, dynamic> res = jsonDecode(response.body);
      print(res);
      if (response.statusCode == 200) {
        LoginResponse postResult =
            LoginResponse.fromJson(json.decode(response.body));
            if(postResult.success != false) {
              return postResult;
            }else{
              return Future.error("User tidak ditemukan 🤷‍♂️");
            }
      } else {
        return Future.error("User tidak ditemukan 🤷‍♂️");
      }
    } on SocketException {
      return Future.error("Yah, Internet Kamu error!😑");
    } on HttpException {
      print("Fungsi post ga nemu 😱");
      // return Future.error("Fungsi post ga nemu 😱");
      return Future.error("terjadi error");
    } on FormatException {
      print("Response format kacauu! 👎");
      // return Future.error("Response format kacauu! 👎");
      return Future.error("terjadi error");
    } catch (e) {
      print('====');
      print(e.toString());
      return Future.error(e);
    }
  }
}
