import 'package:clase05_06_2024/views/Cirugia_list.dart';
import 'package:clase05_06_2024/views/Course_list.dart';
import 'package:clase05_06_2024/views/Shop_list.dart';
import 'package:clase05_06_2024/views/Subject_list.dart';
import 'package:clase05_06_2024/views/cirugia/editCr.dart';
import 'package:clase05_06_2024/views/cirugia/new.dart';
import 'package:clase05_06_2024/views/course/editC.dart';
import 'package:clase05_06_2024/views/course/newc.dart';
import 'package:clase05_06_2024/views/informacion/hoja.dart';
import 'package:clase05_06_2024/views/inicio.dart';
import 'package:clase05_06_2024/views/Student_list.dart';
import 'package:clase05_06_2024/views/menu.dart';
import 'package:clase05_06_2024/views/menu_ent.dart';
import 'package:clase05_06_2024/views/shop/editSh.dart';
import 'package:clase05_06_2024/views/shop/news.dart';
import 'package:clase05_06_2024/views/student/editS.dart';
import 'package:clase05_06_2024/views/student/new.dart';
import 'package:clase05_06_2024/views/subject/editSb.dart';
import 'package:clase05_06_2024/views/subject/news.dart';
import 'package:clase05_06_2024/views/Teacher_list.dart';
import 'package:clase05_06_2024/views/teacher/editTe.dart';
import 'package:clase05_06_2024/views/teacher/newt.dart';
import 'package:flutter/material.dart'; //importar la libreria para el diseño de la interfaz

void main() {
  // funcion principañ de arranque de todo el proyecto
  //solo se declara en el archivo main
  runApp(MyApp()); //correr la palicacion en la clase que señalamos  ej, MyApp
}

// Creo la clase principal llamada MyApp y genero una herencia de statelessWidget
class MyApp extends StatelessWidget {
  // se va a escribir codigo heredado
  @override
  //Creamos un widget principal y generamos un contexto general
  Widget build(BuildContext context) {
    //configuracion de la interfaz de libreria
    return MaterialApp(
        initialRoute: '/menu', // Estableco la tura inicial
        // Se denominan las rutas para la navegacion de las interfaces (URL)
        //Creamos un diccionario de rutas
        routes: {
          '/inicio': (context) =>
              inicio(), // Creamos la ruta para la clase Inicio
          '/menu': (context) => menu(),
          '/list': (context) => Student_list(),
          // Menu para las entidades
          '/menuent': (context) => menu_ent(),
          '/listCourses': (context) => Course_list(),
          '/listSubjects': (context) => Subject_list(),
          '/listTeacher': (context) => Teacher_list(),
          // rutas para administracion de estudiantes
          '/Student/create': (context) => StudentCreate(),
          // rutas para administracion de Cursos
          '/Course/create': (context) => CourseCreate(),
          // rutas para administracion de Profesores
          '/Teacher/create': (context) => TeacherCreate(),
          // rutas para administracion de Materias
          '/Subject/create': (context) => SubjetCreate(),
          // ruta para administeacion de la tiendas
          '/Shop/create': (context) => ShopCreate(),
          '/listShop': (context) => Shop_list(),
          'Student/edit': (context) => StudentEdit(),
          // editar un curso
          '/Course/edit': (context) => CourseEdit(),
          '/Subject/edit': (context) => SubjetEdit(),
          '/Teacher/edit': (context) => TeacherEdit(),
          '/Shop/edit': (context) => ShopEdit(),
          '/Informacion': (context) => Informacion(),
          '/listCirugia': (context) => Cirugia_list(),
          '/Cirugia/create': (context) => CirugiaCreate(),
          '/Cirugia/edit': (context) => CirugiaEdit(),
        });
  }
}
