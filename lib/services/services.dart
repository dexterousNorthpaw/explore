import 'dart:convert';

import 'package:explore/models/country_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';


class APIService{
  // String endpoint = "https://restcountries.com/v3.1/all";

  Future<List<CountryModel>> getCountries() async{
    Response response = await get(Uri.parse("https://restcountries.com/v3.1/all"));
    if (response.statusCode==200){
      final List result = jsonDecode(response.body) ;
      return result.map((e) => CountryModel.fromJson(e)).toList();
    }else {
      throw Exception(response.reasonPhrase);
    }
  }
}

final countryProvider = Provider<APIService>((ref)=>APIService());