import 'package:clase05_06_2024/entities/subject_entity.dart';
import 'package:clase05_06_2024/settings/db_connection.dart';
import 'package:flutter/material.dart';

class SubjetEdit extends StatefulWidget {
  @override
  State<SubjetEdit> createState() => _SubjetEditState();
}

class _SubjetEditState extends State<SubjetEdit> {
  final SubjetForm = GlobalKey<FormState>();
  final NombreController = TextEditingController();
  final CreditsController = TextEditingController();
  final DescripcionController = TextEditingController();
  final TeacherController = TextEditingController();
  final DateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Subject;
    NombreController.text = args.name;
    CreditsController.text = args.credits.toString();
    DescripcionController.text = args.description;
    TeacherController.text = args.teacher;
    DateController.text = args.date;
    int id = args.id as int;
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Asignatura'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: SubjetForm,
          child: Column(
            children: [
              TextFormField(
                controller: NombreController,
                decoration: InputDecoration(labelText: 'Nombre:'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return ' este campo es obligatorio';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: DateController,
                decoration: InputDecoration(labelText: 'Fecha:'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return ' este campo es obligatorio';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: CreditsController,
                decoration: InputDecoration(labelText: 'Créditos:'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return ' este campo es obligatorio';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: DescripcionController,
                decoration: InputDecoration(labelText: 'Descripción:'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return ' este campo es obligatorio';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: TeacherController,
                decoration: InputDecoration(labelText: 'Profesor:'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return ' este campo es obligatorio';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    edit(id);
                    Navigator.pushNamed(context, '/listSubjects');
                  },
                  child: Text('Insertar Materia'))
            ],
          ),
        ),
      ),
    );
  }

  edit(int id) async {
    print('Llegue a la funcion');
    if (SubjetForm.currentState!.validate()) {
      SubjetForm.currentState!.save();
      var data = Subject(
          id: id,
          name: NombreController.text,
          date: DateController.text,
          credits: CreditsController.text,
          description: DescripcionController.text,
          teacher: TeacherController.text);
      print(await DbConnection.update('Materia', data.toDictionary(), id));
    }
  }
}
