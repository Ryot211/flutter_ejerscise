import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sistema Escolastico',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Color.fromARGB(255, 194, 242, 250),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: [
                Text(
                  'Bienvenidos',
                  style: TextStyle(fontSize: 22),
                ),
                SizedBox(height: 70),
                Image(image: AssetImage('assets/images/logo1.png')),
                SizedBox(height: 50),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/menuent');
                    },
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        padding:
                            EdgeInsets.symmetric(horizontal: 80, vertical: 12)),
                    child: Text('Ingresar'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
