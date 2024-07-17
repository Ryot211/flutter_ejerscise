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
      body: Container(
        color: Color.fromARGB(255, 194, 242, 250),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: [
                Text('Selecciona la entidad que desees:'),
                SizedBox(height: 60),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/list');
                    },
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        padding:
                            EdgeInsets.symmetric(horizontal: 80, vertical: 12)),
                    child: Text('Estudiantes')),
                SizedBox(height: 20),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/listCourses');
                    },
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        padding:
                            EdgeInsets.symmetric(horizontal: 95, vertical: 12)),
                    child: Text('Cursos')),
                SizedBox(height: 20),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/listSubjects');
                    },
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        padding:
                            EdgeInsets.symmetric(horizontal: 93, vertical: 12)),
                    child: Text('Materia')),
                SizedBox(height: 20),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/listTeacher');
                    },
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        padding:
                            EdgeInsets.symmetric(horizontal: 91, vertical: 12)),
                    child: Text('Profesor')),
                SizedBox(height: 20),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/listShop');
                    },
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        padding:
                            EdgeInsets.symmetric(horizontal: 95, vertical: 12)),
                    child: Text('Tienda')),
                SizedBox(height: 20),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/listCirugia');
                    },
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        padding:
                            EdgeInsets.symmetric(horizontal: 95, vertical: 12)),
                    child: Text('Cirugía')),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/Informacion');
        },
        child: Icon(Icons.person),
      ),
    );
  }
}
