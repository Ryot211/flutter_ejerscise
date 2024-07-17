import 'package:flutter/material.dart';

class menu_ent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Menu Entidades',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              Text('Selecciona la entidad que desees:'),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/list');
                  },
                  child: Text('Estudiantes')),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/listCourses');
                  },
                  child: Text('Cursos')),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/listSubjects');
                  },
                  child: Text('Materia')),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/listTeacher');
                  },
                  child: Text('Profesor')),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/listShop');
                  },
                  child: Text('Tienda')),
            ],
          ),
        ),
      ),
    );
  }
}
