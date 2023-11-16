import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4),
      body: Stack(
        children: [
          // Widget untuk latar biru
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 200,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                color: Color(0xFF0a4f8f),
              ),
              child: // ...

                  Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(180),
                        child: Image.asset(
                          'assets/images/profile.png',
                          width: 50,
                          height: 50,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    // Ganti Row dengan Column dan atur CrossAxisAlignment
                    
                  ],
                ),
              ),
// ...
            ),
          ),
          // Widget untuk latar merah (diposisikan lebih ke atas)
          Positioned(
            top: 150, // Atur nilai top yang lebih kecil
            right: 20,
            left: 20,
            child: Column(
              children: [
                Container(
                  height: 100,
                  width: 400,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  height: 400,
                  width: 400,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  child: Column(children: [
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        width: 70,
                        height: 30,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20)),
                          color: Color(0xFF0a4f8f),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Menu",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center)
                          ],
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Align(
                            alignment: Alignment.center,
                            child: Row(children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 20, left: 20),
                                child: Column(children: [
                                  Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(180),
                                        color: Colors.blueAccent),
                                    child: const Icon(Icons.camera,
                                        color: Colors.white),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text("Presensi"),
                                ]),
                              ),
                              Padding(
                                padding: EdgeInsets.all(20),
                                child: Column(children: [
                                  Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(180),
                                        color: Colors.purple),
                                    child: const Icon(Icons.book,
                                        color: Colors.white),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text("Rekap"),
                                ]),
                              ),
                              Padding(
                                padding: EdgeInsets.all(0),
                                child: Column(children: [
                                  Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(180),
                                        color: Colors.orange),
                                    child: const Icon(Icons.alarm_add,
                                        color: Colors.white),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text("Perizinan"),
                                ]),
                              ),
                              Padding(
                                padding: EdgeInsets.all(20),
                                child: Column(children: [
                                  Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(180),
                                        color: Colors.blueAccent),
                                    child: const Icon(Icons.lock_clock,
                                        color: Colors.red),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text("Home"),
                                ]),
                              ),
                            ]),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Row(children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(children: [
                                Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(180),
                                      color: Colors.blueAccent),
                                  child: const Icon(Icons.home,
                                      color: Colors.white),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text("Home"),
                              ]),
                            ),
                            Padding(
                              padding: EdgeInsets.all(20),
                              child: Column(children: [
                                Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(180),
                                      color: Colors.blueAccent),
                                  child: const Icon(Icons.home,
                                      color: Colors.white),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text("Home"),
                              ]),
                            ),
                            Padding(
                              padding: EdgeInsets.all(20),
                              child: Column(children: [
                                Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(180),
                                      color: Colors.blueAccent),
                                  child: const Icon(Icons.home,
                                      color: Colors.white),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text("Home"),
                              ]),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 20, left: 20),
                              child: Column(children: [
                                Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(180),
                                      color: Colors.blueAccent),
                                  child: const Icon(Icons.home,
                                      color: Colors.white),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text("Home"),
                              ]),
                            ),
                          ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Row(children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(children: [
                                Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(180),
                                      color: Colors.blueAccent),
                                  child: const Icon(Icons.home,
                                      color: Colors.white),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text("Home"),
                              ]),
                            ),
                            Padding(
                              padding: EdgeInsets.all(20),
                              child: Column(children: [
                                Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(180),
                                      color: Colors.blueAccent),
                                  child: const Icon(Icons.home,
                                      color: Colors.white),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text("Home"),
                              ]),
                            ),
                            Padding(
                              padding: EdgeInsets.all(20),
                              child: Column(children: [
                                Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(180),
                                      color: Colors.blueAccent),
                                  child: const Icon(Icons.home,
                                      color: Colors.white),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text("Home"),
                              ]),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 20, left: 20),
                              child: Column(children: [
                                Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(180),
                                      color: Colors.blueAccent),
                                  child: const Icon(Icons.home,
                                      color: Colors.white),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text("Home"),
                              ]),
                            ),
                          ]),
                        ),
                      ],
                    )
                  ]),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
