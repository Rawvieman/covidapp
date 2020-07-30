import 'dart:async';
import 'dart:convert';
import 'package:covidapp/data.dart';
import 'package:http/http.dart' as http;

class ApiData {
  Future<Data> fetchNepal() async {
    final nepalUrl = 'https://corona.lmao.ninja/v2/countries/npl';
    final response = await http.get(nepalUrl);
    if (response.statusCode == 200) {

      return Data.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load movies from API');
    }
  }

  Future<Data> fetchGlobal() async {
    final nepalUrl = 'https://corona.lmao.ninja/v2/all';
    final response = await http.get(nepalUrl);
    if (response.statusCode == 200) {

      return Data.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load movies from API');
    }
  }
}