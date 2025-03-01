import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leadingWidth: 80,
        leading: Container(
          margin: EdgeInsets.all(10),
          child: Image.asset("./assets/png/database.png"),
        ),
        titleSpacing: 0,
        title: const Text(
          "DDAS",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Colors.white)
            ),
            onPressed: () {},
            child: Text(
              "Dasbord",
            ),
          ),
          SizedBox(
            width: 10,
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              "Dasbord",
            ),
          ),
          SizedBox(
            width: 10,
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              "Dasbord",
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Container(),
    );
  }
}
