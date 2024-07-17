import 'package:path/path.dart'; //IMPORTAR LIBRERIA PATH
import 'package:sqflite/sqflite.dart'; //IMPORTAR LA LIBRERIA SQFLITE

class DbConnection {
  static const version = 1; //VERSION DE CONEXION, POR DEFAULT VA 1 SIEMPRE
  static const dbName = 'octavo_utc.db'; //NOMBRE DE LA BASE DE DATOS SQLITE

  //METODO DE CONEXION
  static Future<Database> getConnection() async {
    //DECLARAR UNA FUNCION ASINCRONA LLAMADA GETCONECCION()
    return openDatabase(
        join(
            //CONCATENAR LA RUTA ABSOLUTA, CON EL NOMBRE DE LA BASE DE DATOS
            await getDatabasesPath(), //LLAMAR A FUNCION ASINCRONA QUE CONTIENE LA RUTA DE LA BASE DE DATOS ESTANDAR
            dbName //NOMBRE DE LA BASE DE DATOS EN ESTE CASO ES octavo_utc
            ),
        onCreate: (db, version) async => {
              //EVENTO PARA CREAR LA BASE DE DATOS
              //PRIMER PARAMETRO ES UN ALIAS QUE SE DESIGNA A LA BASE DE DATOS
              //SEGUNDO PARAMETRO HACE REFERENCIA A LA VERSION QUE ESTA EN LA LINEA 5
              //EN ESTAFUNCION SE CREAN TABLAS O DATOS INICIALES
              // evento para crear la base de datos
              await db.execute(
                  "CREATE TABLE Estudiantes (id INTEGER PRIMARY KEY, name TEXT, last_name TEXT)"),
              await db.execute(
                  "INSERT INTO Estudiantes (id, name, last_name) VALUES (1, 'Mey', 'Andrade')"),

              await db.execute(
                  "CREATE TABLE Profesor (id INTEGER PRIMARY KEY, name TEXT, last_name TEXT, department TEXT, email TEXT, telefono INTEGER)"),
              await db.execute(
                  "INSERT INTO Profesor (id, name, last_name, department, email, telefono) VALUES (1, 'Stefanny', 'Andrade', 'Ciencias', 'Steff@gmail.com', 0987654321)"),

              await db.execute(
                  "CREATE TABLE Curso (id INTEGER PRIMARY KEY, nombre TEXT, description TEXT, credits TEXT, ubicacion TEXT, encargado TEXT)"),
              await db.execute(
                  "INSERT INTO Curso (id, nombre, description, credits, ubicacion, encargado) VALUES (1, 'Sexto A', 'Curso con capacidad para 30', '20', 'segundo piso', 'asesor 1')"),

              await db.execute(
                  "CREATE TABLE Materia (id INTEGER PRIMARY KEY, nombre TEXT, fecha text, creditos text, descripcion TEXT, profesor TEXT)"),
              await db.execute(
                  "INSERT INTO Materia (id, nombre, fecha, creditos, descripcion, profesor) VALUES (1, 'Matematicas', '2024-05-12', '10', 'Dificil', 'Steffy Andrade')"),
              await db.execute(
                  "CREATE TABLE Tienda_ropa (id INTEGER PRIMARY KEY, nombre TEXT, ubicacion text, tipo_ropa text, horario TEXT, precio_promedio TEXT)"),
              await db.execute(
                  "INSERT INTO Tienda_ropa (id, nombre, ubicacion, tipo_ropa, horario, precio_promedio) VALUES (1, 'Eta-Fashion', 'Av. Amazonas 1500, Quito, Ecuador', 'Casual y Deportiva', 'Lunes a sábado de 10:00 a 20:00', '20 - 80 USD')"),
              await db.execute(
                  "INSERT INTO Tienda_ropa (id, nombre, ubicacion, tipo_ropa, horario, precio_promedio) VALUES (2, 'Marathon', 'Av. Sanchez, Latacunga, Ecuador', 'Deportiva', 'Lunes a viernes de 10:00 a 20:00', '80- 100 USD')"),
              await db.execute(
                  "INSERT INTO Tienda_ropa (id, nombre, ubicacion, tipo_ropa, horario, precio_promedio) VALUES (3, 'Moda Urbana', 'Malecón 2000, Local 45, Guayaquil, Ecuador', 'Formal y de oficina', 'Lunes a viernes de 9:00 a 19:00', '30 - 150 USD')"),
              await db.execute(
                  "INSERT INTO Tienda_ropa (id, nombre, ubicacion, tipo_ropa, horario, precio_promedio) VALUES (4, 'Maros', 'Centro Comercial Quicentro Shopping, Quito, Ecuador', 'Alta costura y moda de lujo', 'Lunes a viernes de 9:00 a 20:00', '100 - 500 USD')"),
              await db.execute(
                  "INSERT INTO Tienda_ropa (id, nombre, ubicacion, tipo_ropa, horario, precio_promedio) VALUES (5, 'RM', 'Av. 10 de Agosto N35-350, Quito, Ecuador', 'Ropa casual y moderna', 'Todos los días de 10:00 a 22:00', '25 - 100 USD')"),
              await db.execute(
                  "Create table Cirugia (id INTEGER PRIMARY KEY,tipo TEXT,fecha TEXT, duracion TEXT, paciente TEXT, doctor TEXT)"),
              await db.execute(
                  "INSERT INTO Cirugia (id,tipo,fecha,duracion,paciente,doctor)values(1,'Bypass cardíaco','21-07-2024','Tres horas','Bryan Gallardo','Xavier Gallardo')")
            },
        version: version //VERSION DE LA BASE DE DATOS
        ); //ABRIR LA CONEXION
  } //DEVUELVE EL TIPO DE DATO LLAMADO DATABASE

  static Future<int> insert(String table, dynamic data) async {
    //CREACION DEL METODO INSERT
    //PRIMER PARAMETRO NOMBRE DE LA TABLA
    //SEGUNDO PARAMETRO HACE REFERENCIA A LA DATA
    final db = await getConnection(); //LLAMADO A LA FUNCION DE CONEXION
    return db.insert(table, data,
        conflictAlgorithm:
            ConflictAlgorithm.replace); //LLAMADO A LA FUNCION INSERT
    //PASO LOS PARAMETROS DE TABLAS Y DATOs
  }

  static Future<int> update(String table, dynamic data, int id) async {
    final db = await getConnection();
    return db.update(table, data, where: 'id = ?', whereArgs: [id]);
  }

  static Future<int> delete(String table, int id) async {
    //CREAR FUNCION PARA ELIMINAR
    //PRIMER PARAMETRO ES EL NOMBRE DE LA TABLA
    //SEGUNDO PARAMETRO ES EL ID DEL REGISTRO
    final db = await getConnection(); //LLAMADO A LA FUNCION DE CONEXION
    return db.delete(table, //NOMBRE DE LA TABLA
        where: 'id = ?', //WHERE DEL ARGUMENTO EN ESTE CASO ES EL ID
        whereArgs: [id] //LLAMADO A LA VARIABLE ID QUE VIENE POR PARAMETRO
        );
  }

  static Future<List<Map<String, dynamic>>> list(String table) async {
    //FUNCION PARA LISTAR DATOS DE UNA TABLA
    //PRIMER PARAMETRO ES NOMBRE DE LA TABLA
    //RETORNA UNA LISTA DE DICCIONARIOS
    final db = await getConnection(); //LLAMADO A LA FUNCION DE CONEXION
    return db.query(table); //LLAMADO A LA FUNCION SELECT
  }

  static Future<List<Map<String, dynamic>>> detail(
      String table, String where, dynamic args) async {
    //FUNCION PARA LISTAR DATOS DE UNA TABLA
    //PRIMER PARAMETRO ES NOMBRE DE LA TABLA
    //SEGUNDO PARAMETRO ES EL FILTRO WHERE
    //TERCER PARAMETRO SON LOS VALORES DE LOS ARGUMENTOS
    //RETORNA UNA LISTA DE DICCIONARIOS
    final db = await getConnection(); //LLAMADO A LA FUNCION DE CONEXION
    return db.query(table,
        where: where,
        whereArgs: args); //LLAMADO A LA FUNCION SELECT FILTRADO POR WHERE
  }
}
