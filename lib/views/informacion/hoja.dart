import 'package:flutter/material.dart';

class Informacion extends StatelessWidget {
  const Informacion({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Información Personal',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Color.fromARGB(255, 194, 242, 250),
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Image(
                  image: AssetImage('assets/images/Bryan.jpg'),
                  width: 600,
                  height: 400,
                ),
                SizedBox(
                  height: 60,
                ),
                Text('Mi información',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Nombre:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text('Bryan Gallardo')
                      ],
                    ),
                    Row(
                      children: [
                        Text('Edad:',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('23')
                      ],
                    ),
                    Row(
                      children: [
                        Text('Fecha de nacimiento:',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('21 de septiembre del 2000')
                      ],
                    ),
                    Row(
                      children: [
                        Text('Dirección:',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('Latacunga - Ecuador')
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
