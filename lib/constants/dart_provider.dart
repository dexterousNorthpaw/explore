

import 'package:explore/models/country_model.dart';
import 'package:explore/services/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final countryDataProvider = FutureProvider<List<CountryModel>>((ref) async{
  return ref.watch(countryProvider).getCountries();
});