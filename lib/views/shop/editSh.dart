import 'package:clase05_06_2024/entities/shop_entity.dart';
import 'package:clase05_06_2024/settings/db_connection.dart';
import 'package:flutter/material.dart';

class ShopEdit extends StatefulWidget {
  @override
  State<ShopEdit> createState() => _ShopEditState();
}

class _ShopEditState extends State<ShopEdit> {
  final ShopForm = GlobalKey<FormState>();
  final NombreController = TextEditingController();
  final UbicacionController = TextEditingController();
  final Tipo_ropaController = TextEditingController();
  final HorarioController = TextEditingController();
  final Precio_promedioController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Shop;
    NombreController.text = args.nombre;
    UbicacionController.text = args.ubicacion;
    Tipo_ropaController.text = args.tipo_ropa;
    HorarioController.text = args.horario;
    Precio_promedioController.text = args.precio_promedio;
    int id = args.id as int;
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
                    decoration:
                        InputDecoration(labelText: 'Nombre de la tienda:'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese un nombre para la tienda';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: UbicacionController,
                    decoration: InputDecoration(labelText: 'Ubicación:'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese un ubicación para la tienda';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: Tipo_ropaController,
                    decoration: InputDecoration(labelText: 'Tipo de ropa'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese un tipo de ropa para la tienda';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: HorarioController,
                    decoration:
                        InputDecoration(labelText: 'Horario de la tienda'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese el horario de la tienda';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: Precio_promedioController,
                    decoration: InputDecoration(
                        labelText: 'Precio promedio de la ropa:'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese el precio promedio de la ropa ';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        edit(id);
                        Navigator.pushNamed(context, '/listShop');
                      },
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(
                              horizontal: 80, vertical: 12)),
                      child: Text('Actualizar tienda'))
                ],
              ),
            ),
          ),
        ));
  }

  edit(int id) async {
    print('Llegue a la funcion ');
    if (ShopForm.currentState!.validate()) {
      ShopForm.currentState!.save();
      var data = Shop(
          id: id,
          nombre: NombreController.text,
          ubicacion: UbicacionController.text,
          tipo_ropa: Tipo_ropaController.text,
          horario: HorarioController.text,
          precio_promedio: Precio_promedioController.text);
      print(await DbConnection.update('Tienda_ropa', data.toDictionary(), id));
    }
  }
}
