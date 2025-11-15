import 'dart:convert';
import 'dart:developer';

import 'package:flutter_ppkd_4_new/day_18/day_18/preference/preference_handler.dart';
import 'package:flutter_ppkd_4_new/day_33/constant/endpoint.dart';
import 'package:flutter_ppkd_4_new/day_33/models/user_dart';
import 'package:http/http.dart' as http;

class AuthAPI {
  static Future<RegisterModel> registerUser({
    required String email,
    required String name,
    required String password,
  }) async {
    final url = Uri.parse(Endpoint.register);
    final response = await http.post(
      url,
      headers: {"Accept": "application/json"},
      body: {"name": name, "email": email, "password": password},
    );
    print(response.body);
    print(response.statusCode);
    log(response.body);
    if (response.statusCode == 200) {
      return RegisterModel.fromJson(json.decode(response.body));
    } else {
      final error = json.decode(response.body);
      throw Exception(error["message"]);
    }
  }

  static Future<RegisterModel> LoginUser({
    required String email,
    required String password,
  }) async {
    final url = Uri.parse(Endpoint.login);
    final response = await http.post(
      url,
      headers: {"Accept": "application/json"},
      body: {"email": email, "password": password},
    );
    print(response.body);
    print(response.statusCode);
    log(response.body);
    if (response.statusCode == 200) {
      return RegisterModel.fromJson(json.decode(response.body));
    } else {
      final error = json.decode(response.body);
      throw Exception(error["message"]);
    }
  }

  static Future<User> getProfile() async {
    final String? token = await PreferenceHandler.getToken();
    if (token == null) {
      throw Exception("Token tidak ditemukan. User belum login.");
    }

    final url = Uri.parse(Endpoint.profile);

    final response = await http.get(
      url,
      headers: {"Authorization": "Bearer $token", "Accept": "application/json"},
    );

    print("PROFILE RESPONSE: ${response.body}");

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);

      return User.fromJson(jsonData["data"]);
    } else {
      throw Exception("Gagal mengambil data profile");
    }
  }

  static Future<RegisterModel> UpdateProfile({
    required String nama,
    required String token,
  }) async {
    final url = Uri.parse(Endpoint.profile);
    final response = await http.put(
      url,
      headers: {"Authorization": "Bearer $token", "Accept": "application/json"},
      body: {"name": nama},
    );
    print(response.body);
    print(response.statusCode);
    log(response.body);
    if (response.statusCode == 200) {
      return RegisterModel.fromJson(json.decode(response.body));
    } else {
      final error = json.decode(response.body);
      throw Exception(error["message"]);
    }
  }
}
