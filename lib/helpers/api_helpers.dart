import 'dart:convert';
import 'package:http/http.dart' as http;

import '../Global/globals.dart';
import '../models/countrymodel.dart';

class CountryAPIHelper {
  CountryAPIHelper._();

  static final CountryAPIHelper userAPIHelper = CountryAPIHelper._();

  Future<CountryData?> fetchingUserData({required String name}) async {

    String api ="https://disease.sh/v3/covid-19/$name";
    http.Response response =
    await http.get(Uri.parse(api));

    if (response.statusCode == 200) {
      Map decodedData = jsonDecode(response.body);

      CountryData  country = CountryData.fromMap(data: decodedData);

      return country;
    }
    return null;
  }
}