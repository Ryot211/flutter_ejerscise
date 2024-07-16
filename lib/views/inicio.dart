import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart'; //importar la libreria para el diseño de la interfaz

class inicio extends StatelessWidget{
  @override
  Widget build (BuildContext context){
    
    return Scaffold(
      appBar: AppBar( title: Text('Inicio'//texto que se muestra
      ,style: TextStyle(color: Colors.white),),backgroundColor: Colors.black,),// Declaro el widget AppBar
      body: Center(child:Column(
        children: [
          Container(color: Colors.blue,child: Text('Prueba ')),
           Container(color: Colors.yellow,child: Text('Lo que sea ')),
           Text('Arriba'),Row( children: [Expanded(child: Text('Encola en fila')),
           Container(color: Colors.purple,child: Text('Encola en fila ')), Expanded(child: Container(color: Colors.orange,child: Text('Esto es una prueba de row')))],)],)),
    );// Contenedor principal
  }

}