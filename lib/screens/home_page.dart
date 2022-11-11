import 'package:explore/constants/dart_provider.dart';
import 'package:explore/models/country_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final _data = ref.watch(countryDataProvider);
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        body: Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 24.0,top: 24.78),
          child: Column(
            children: [
              Row(
                children: const [
                  Text("Explore.",style: TextStyle(fontFamily: "ElsieSwashCaps",fontSize: 30)),
                  SizedBox(width: 200,),
                  Expanded(child: Icon(size:24.0,Icons.light_mode_outlined)),
                ],
              ),
              const SizedBox(height: 24.0,),
              TextFormField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(width: 0,style: BorderStyle.none),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  filled: true,
                  fillColor: const Color(0xFFF2F4F7),
                  hintText: "Search Country",
                  prefixIcon: const Icon(Icons.search),
                ),
              ),
              const SizedBox(height: 16.0,),
              Row(
                children: [

                  Container(
                    // margin: EdgeInsets.only(left: 14.0),
                    width: 73.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                        border: Border.all(width: 0.2, color: const Color(0xFFA9B8D5)),
                        borderRadius: const BorderRadius.all(Radius.circular(4.0))
                    ),
                    child: Row(children: const [SizedBox(width: 10,),Icon(Icons.language),SizedBox(width: 10.0,),Text("EN")],),
                  ),
                  const SizedBox(width: 199.0,),
                  Expanded(
                    child: Container(
                      width: 73.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                          border: Border.all(width: 0.2, color: const Color(0xFFA9B8D5)),
                          borderRadius: const BorderRadius.all(Radius.circular(4.0))
                      ),
                      child: Row(children: const [Icon(Icons.filter_alt),SizedBox(width: 8.0,),Text("Filter")],),
                    ),
                  )
                ],
              ),
              Expanded(
                child: _data.when(
                    data: (_data){
                      List<CountryModel> countryList = _data.map((e) =>e).toList();
                      return ListView.builder(
                        // shrinkWrap: true,
                      itemCount: countryList.length,
                      itemBuilder: (_,index){
                        return Card(
                          color: Colors.transparent,
                          elevation: 0.0,
                          child: ListTile(
                            leading: Container(
                              height: 40.0,width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                image: DecorationImage(fit:BoxFit.fill,image: NetworkImage(countryList[index].flags!.png.toString()))
                              ),
                            ),
                            title: Text(countryList[index].name!.official.toString()),
                            subtitle: Text(countryList[index].capital!.toString()),
                          ),
                        );
                      });
                    },
                    error: (err,s)=>Text(err.toString()),
                    loading:()=> const Center(
                        child: CircularProgressIndicator())),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
