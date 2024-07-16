import 'package:clase05_06_2024/entities/teacher_entiry.dart';
import 'package:flutter/material.dart';

class Teacher_list extends StatelessWidget{
  const Teacher_list({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Listado de Profesores',style: TextStyle(color: Colors.white),),backgroundColor: Colors.black,
    ),body: FutureBuilder<List<Teacher>>(
      future: Teacher.select(),
      builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center (child: CircularProgressIndicator(),);
        }else if (snapshot.hasError){
          return Center(child: Text('Error: ${snapshot.error}'),);
        }else{
          List<Teacher> data = snapshot.data as List<Teacher>;
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context,i){
              return Card(
                child: Row(children: [Text(data[i].name),Text(' '),Text(data[i].lastName)],),
              );
            });
        }
      }
    ),
    floatingActionButton: FloatingActionButton(onPressed: (){Navigator.pushNamed(context,'/Teacher/create');},child: Icon(Icons.add),)
    );
   
    
  }
}