import 'package:explore/constants/dart_provider.dart';
import 'package:explore/models/country_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _data = ref.watch(countryDataProvider);
    return SafeArea(
      child: Scaffold(
        body: _data.when(
            data: (_data){
              List<CountryModel> countryList = _data.map((e) =>e).toList();
              Column(
                  children: [
                    Expanded(child: ListView.builder(
                        itemCount: countryList.length,
                        itemBuilder: (_,index){
                          return Card(
                            child: ListTile(
                              title: Text(countryList[index].name.toString()),
                            ),
                          );
                        }))

                  ],);
            },
            error: (err,s)=>Text(err.toString()),
            loading:()=> Center(
                child: CircularProgressIndicator())),
      ),
    );
  }
}
