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
                backgroundColor: WidgetStatePropertyAll(Colors.blueGrey)),
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
      body: Container(
        child: Row(
          children: [
            Container(
              width: 250,
              color: const Color.fromARGB(135, 133, 132, 132),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(
                  vertical: 30,
                  horizontal: 30,
                ),
                width: double.infinity,
                // color: Colors.teal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Dashbord map's
                    Flexible(
                      child: Container(
                        // color: Colors.red,
                        width: double.infinity,
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Dashbord Overview",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 10,
                                      ),
                                      decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 102, 102, 102),
                                        borderRadius: BorderRadius.circular(
                                          25,
                                        ),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Duplicate's Files",
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 10,
                                      ),
                                      decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 102, 102, 102),
                                        borderRadius: BorderRadius.circular(
                                          25,
                                        ),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Resources Status",
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // pending Alert's
                    const Text(
                      "pending alert's",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 102, 102, 102),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.white,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [  
                            Text(
                              "Alert's",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
