import 'package:clase05_06_2024/entities/shop_entity.dart';
import 'package:flutter/material.dart';

class Shop_list extends StatelessWidget{
  const Shop_list ({super.key});
  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title:  Text('Listado de tiendas', style: TextStyle(color: Colors.white),),backgroundColor: Colors.black,
      ),
      body: FutureBuilder<List<Shop>>(
        future: Shop.select(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }else if (snapshot.hasError){
            return Center(child: Text('Error: ${snapshot.error}'),);
          }else{
            List<Shop> data = snapshot.data as List<Shop>;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context,i){
                return Card(
                  child: Row(children: [Text(data[i].nombre),Text(' '),Text(data[i].tipo_ropa)],),
                );
              });
          }
        }
      ),
    floatingActionButton: FloatingActionButton(onPressed: (){Navigator.pushNamed(context, '/Shop/create');},child: Icon(Icons.add),),
    );
  }
}