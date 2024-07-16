import 'package:clase05_06_2024/entities/shop_entity.dart';
import 'package:clase05_06_2024/settings/db_connection.dart';
import 'package:flutter/material.dart';

class ShopCreate extends StatefulWidget{
    @override
    State<ShopCreate> createState() => _ShopCreateState();

}
class _ShopCreateState extends State<ShopCreate>{
  final ShopForm= GlobalKey<FormState>();
  final NombreController = TextEditingController();
  final UbicacionController = TextEditingController();
  final Tipo_ropaController = TextEditingController();
  final HorarioController = TextEditingController();
  final Precio_promedioController = TextEditingController();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Crear Tienda'),
      ),
      body: Padding(padding: const EdgeInsets.all(20),
      child: Form(
       key: ShopForm,
        child: Column(
          children: [
            TextFormField(
              controller: NombreController,
              decoration: InputDecoration(labelText: 'Nombre de la tienda:'),
              validator: (value){
                if(value == null || value.isEmpty ){
                  return 'Por favor ingrese un nombre para la tienda';
                }
                return null;
              },
            ),
            TextFormField(
              controller: UbicacionController,
              decoration: InputDecoration(labelText:'Ubicación:'),
               validator: (value){
                if(value == null || value.isEmpty ){
                  return 'Por favor ingrese un ubicación para la tienda';
                }
                return null;
              },
            ),
            TextFormField(
              controller: Tipo_ropaController,
              decoration: InputDecoration(labelText: 'Tipo de ropa'),
               validator: (value){
                if(value == null || value.isEmpty ){
                  return 'Por favor ingrese un tipo de ropa para la tienda';
                }
                return null;
              },
            ),
            TextFormField(
              controller: HorarioController,
              decoration: InputDecoration(labelText: 'Horario de la tienda'),
               validator: (value){
                if(value == null || value.isEmpty ){
                  return 'Por favor ingrese el horario de la tienda';
                }
                return null;
              },),
              TextFormField(
                controller: Precio_promedioController,
                decoration: InputDecoration(labelText: 'Precio promedio de la ropa:'),
                 validator: (value){
                if(value == null || value.isEmpty ){
                  return 'Por favor ingrese el precio promedio de la ropa ';
                }
                return null;
              },
              ),
              SizedBox(height: 10,),
              ElevatedButton(onPressed: (){
                insert();
                Navigator.pushNamed(context,'/listShop'); 
              }, child: Text('Insertar una tienda'))
          ],
        ),),)
    );
  } 
  insert() async{
    print('Llegue a la funcion ');
    if(ShopForm.currentState!.validate()){ 
      ShopForm.currentState!.save();
      var data = Shop(
        nombre: NombreController.text, 
        ubicacion: UbicacionController.text, 
        tipo_ropa: Tipo_ropaController.text,
        horario: HorarioController.text,
        precio_promedio: Precio_promedioController.text);
        print(await DbConnection.insert('Tienda_ropa', data.toDictionary()));
    }
  }



}