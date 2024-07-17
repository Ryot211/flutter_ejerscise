import 'package:clase05_06_2024/entities/cirugia_entity.dart';
import 'package:clase05_06_2024/settings/db_connection.dart';
import 'package:flutter/material.dart';

class CirugiaEdit extends StatefulWidget {
  const CirugiaEdit({super.key});
  @override
  State<CirugiaEdit> createState() => _CirugiaEditState();
}

class _CirugiaEditState extends State<CirugiaEdit> {
  final CirugiaForm = GlobalKey<FormState>();
  final tipoController = TextEditingController();
  final fechaController = TextEditingController();
  final duracionController = TextEditingController();
  final pacienteController = TextEditingController();
  final doctorController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Cirugia;
    tipoController.text = args.tipo;
    fechaController.text = args.fecha;
    duracionController.text = args.duracion;
    pacienteController.text = args.paciente;
    doctorController.text = args.doctor;
    int id = args.id as int;
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Editar Cirugía',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
        ),
        body: Container(
          color: Color.fromARGB(255, 194, 242, 250),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: CirugiaForm,
              child: Column(children: [
                TextFormField(
                    controller: tipoController,
                    decoration: InputDecoration(
                        labelText: 'Tipo',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Este campo es requerido';
                      }
                      return null;
                    }),
                SizedBox(height: 20),
                TextFormField(
                    controller: fechaController,
                    decoration: InputDecoration(
                        labelText: 'Fecha:',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Este campo es requerido';
                      }
                      return null;
                    }),
                SizedBox(height: 20),
                TextFormField(
                    controller: duracionController,
                    decoration: InputDecoration(
                        labelText: 'Duración:',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Este campo es requerido';
                      }
                      return null;
                    }),
                SizedBox(height: 20),
                TextFormField(
                    controller: pacienteController,
                    decoration: InputDecoration(
                        labelText: 'Paciente:',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Este campo es requerido';
                      }
                      return null;
                    }),
                SizedBox(height: 20),
                TextFormField(
                    controller: doctorController,
                    decoration: InputDecoration(
                        labelText: 'Doctor:',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Este campo es requerido';
                      }
                      return null;
                    }),
                SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () {
                      edit(id);
                      Navigator.of(context).pushNamed('/listCirugia');
                    },
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        padding:
                            EdgeInsets.symmetric(horizontal: 80, vertical: 12)),
                    child: Text('Crear Cirugia'))
              ]),
            ),
          ),
        ));
  }

  edit(int id) async {
    print('Llegue a la funcion');
    if (CirugiaForm.currentState!.validate()) {
      CirugiaForm.currentState!.save();
      var data = Cirugia(
          id: id,
          tipo: tipoController.text,
          fecha: fechaController.text,
          duracion: duracionController.text,
          paciente: pacienteController.text,
          doctor: doctorController.text);
      print(await DbConnection.update('Cirugia', data.toDictionary(), id));
    }
  }
}
