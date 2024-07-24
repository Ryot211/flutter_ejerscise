import 'package:clase05_06_2024/entities/country_entity.dart';
import 'package:flutter/material.dart';

class Country_list extends StatefulWidget {
  const Country_list({super.key});

  @override
  State<Country_list> createState() => _Country_listState();
}

class _Country_listState extends State<Country_list> {
  late Future<List<Country>> countries;
  @override
  void initState() {
    // funcion que se ejecuta al inicio del llamado a la calse
    super.initState();
    countries = Country.get(); // consulta el metodo del consumo del api
    print(countries);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Lista de Paises",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
        ),
        body: FutureBuilder<List<Country>>(
          future: countries,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  var Country = snapshot.data![index];
                  return ListTile(
                    title: Text(Country.name["common"] as String),
                    subtitle: Text(Country.region as String),
                  );
                },
              );
            }
          },
        ));
  }
}
