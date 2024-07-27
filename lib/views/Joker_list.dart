import 'package:clase05_06_2024/entities/joker_entity.dart';
import 'package:flutter/material.dart';

class JokerList extends StatefulWidget {
  const JokerList({super.key});

  @override
  State<JokerList> createState() => _JokerListState();
}

class _JokerListState extends State<JokerList> {
  late Future<List<Joker>> jokers;

  @override
  void initState() {
    super.initState();
    jokers = Joker.get();
  }

  Future<void> _getNewJoke() async {
    setState(() {
      jokers = Joker.get();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Joker List',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _getNewJoke,
          ),
        ],
      ),
      body: FutureBuilder<List<Joker>>(
        future: jokers,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No jokes found."));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var joker = snapshot.data![index];
                return ListTile(
                  title: Text(joker.category ?? 'Unknown category'),
                  subtitle: Text(joker.joke ?? 'No joke available'),
                );
              },
            );
          }
        },
      ),
    );
  }
}
