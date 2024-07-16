import 'package:flutter/material.dart';

class menu extends StatelessWidget{
  @override
  Widget build (BuildContext context){
    return Scaffold(appBar: AppBar(title: Text('Sistema Escolastico',style: TextStyle(color: Colors.white38),),backgroundColor:  Colors.black,),
    body:  Padding(
      padding: const EdgeInsets.all(20),
      child: Center(child: Column(
        children: [
          Text('Bienvenidos'),
          Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1hMcdDayV-RqwjzDv7vSNtpykdmzmA-_nrg&s'),
          TextButton(onPressed: (){Navigator.of(context).pushNamed('/menuent');}, child: Text('Ingresar'))
        ],
      ),),
    ),);
  }
}