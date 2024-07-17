import 'package:clase05_06_2024/entities/shop_entity.dart';
import 'package:clase05_06_2024/settings/db_connection.dart';
import 'package:flutter/material.dart';

class ShopCreate extends StatefulWidget {
  @override
  State<ShopCreate> createState() => _ShopCreateState();
}

class _ShopCreateState extends State<ShopCreate> {
  final ShopForm = GlobalKey<FormState>();
  final NombreController = TextEditingController();
  final UbicacionController = TextEditingController();
  final Tipo_ropaController = TextEditingController();
  final HorarioController = TextEditingController();
  final Precio_promedioController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Crear Tienda',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
        ),
        body: Container(
          color: Color.fromARGB(255, 194, 242, 250),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: ShopForm,
              child: Column(
                children: [
                  TextFormField(
                    controller: NombreController,
                    decoration: InputDecoration(
                        labelText: 'Nombre de la tienda:',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese un nombre para la tienda';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: UbicacionController,
                    decoration: InputDecoration(
                        labelText: 'Ubicación:',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese un ubicación para la tienda';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: Tipo_ropaController,
                    decoration: InputDecoration(
                        labelText: 'Tipo de ropa:',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese un tipo de ropa para la tienda';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: HorarioController,
                    decoration: InputDecoration(
                        labelText: 'Horario de la tienda:',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese el horario de la tienda';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: Precio_promedioController,
                    decoration: InputDecoration(
                        labelText: 'Precio promedio de la ropa:',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese el precio promedio de la ropa ';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        insert();
                        Navigator.pushNamed(context, '/listShop');
                      },
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(
                              horizontal: 80, vertical: 12)),
                      child: Text('Insertar una tienda'))
                ],
              ),
            ),
          ),
        ));
  }

  insert() async {
    print('Llegue a la funcion ');
    if (ShopForm.currentState!.validate()) {
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
