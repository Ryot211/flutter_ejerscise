import 'package:clase05_06_2024/entities/course_entity.dart';
import 'package:clase05_06_2024/settings/db_connection.dart';
import 'package:flutter/material.dart';
class CourseCreate extends StatefulWidget{
  @override
  State<CourseCreate> createState () => _CourseCreateState();
}
class _CourseCreateState extends State<CourseCreate>{
  final CourseForm = GlobalKey<FormState>();
  final NombreController = TextEditingController();
  final DescripcionController = TextEditingController();
  final CreditsController = TextEditingController();
  final UbicationController = TextEditingController();
  final EncargadoController = TextEditingController();
  @override 
  Widget build(BuildContext context){
  return Scaffold(
    appBar: AppBar(
      title: Text('Create Course'),
    ), 
    body: Padding(padding: const EdgeInsets.all(20),
    child: Form(
      key: CourseForm,
      child: Column(
        children: [
          TextFormField(
            controller: NombreController,
            decoration: InputDecoration(labelText: 'Nombre: '),
            validator: (value){
              if (value == null || value.isEmpty){
                return ' este campo es obligatorio';
              }
              return null;
            },
          ),
          TextFormField(
            controller: DescripcionController,
            decoration:  InputDecoration(labelText: 'Descripcion:'),
            validator: (value){
              if (value == null || value.isEmpty){
                return ' este campo es obligatorio';
              }
              return null;
            },
          ),
            SizedBox(
            height: 10,),
          TextFormField(
            controller: CreditsController,
            decoration: InputDecoration(labelText: 'Credits:'),
            validator: (value){
              if (value == null || value.isEmpty){
                return ' este campo es obligatorio';
              }
              return null;
            },
          ),
            SizedBox(
            height: 10,),
          TextFormField(
            controller: UbicationController,
            decoration: InputDecoration(labelText: 'Ubication:'),
            validator: (value){
              if (value == null || value.isEmpty){
                return ' este campo es obligatorio';
              }
              return null;
            },
          ),
            SizedBox(
            height: 10,),
          TextFormField(
            controller: EncargadoController,
            decoration: InputDecoration(labelText: 'Encargado:'),
            validator: (value){
              if (value == null || value.isEmpty){
                return ' este campo es obligatorio';
              }
              return null;
            },
          ),
          SizedBox(
            height: 10,),
            ElevatedButton(onPressed: (){
               insert();
             Navigator.pushNamed(context, '/listCourses');
            }, child: Text('Insertar Curso'))
        ],
      ),
    ),),
    );
  }
  insert () async {
    print ('Llegue a la funcion ');
    if (CourseForm.currentState!.validate()){
      CourseForm.currentState!.save();
      var data = Course(
        nombre: NombreController.text, 
        description: DescripcionController.text, 
        credits: CreditsController.text, 
        ubication: UbicationController.text,
         encargado: EncargadoController.text);
         print (await DbConnection.insert('Curso', data.toDictionary()));
    }
  }
}