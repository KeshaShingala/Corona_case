import 'package:flutter/foundation.dart';

class CountryData {
  final dynamic country;
  final dynamic infected;
  final dynamic death;
  final dynamic active;
  final dynamic recovered;
  final dynamic population;

  CountryData(
      {required this.country,
        required this.infected,
        required this.death,
        required this.active,
        required this.recovered,
        required this.population});

  factory CountryData.fromMap({required Map data}) {
    return CountryData(
        country: data['country'],
        infected: data['cases'],
        death: data['deaths'],
        active: data['active'],
        recovered: data['recovered'],
        population: data['population']);
  }
}