import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/editable_text.dart';
import 'package:login_apps/model/auth/login_request.dart';
import 'package:login_apps/model/auth/login_response.dart';

class AuthRepository {
  Dio _dio = Dio();
  Future<void> signInUser(
      LoginRequest loginRequest, BuildContext context) async {
    Response _response;
    try {
      _response = await _dio.post("https://reqres.in/api/login",
          data: loginRequest.toJson());

      LoginResponse _loginResponse = LoginResponse.fromJson(_response.data);
    } on DioException catch (e) {
      print(e);
      throw Exception(e.response?.data['error'].toString());
    }
  }
}
