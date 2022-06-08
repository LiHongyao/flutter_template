import 'package:flutter/material.dart';

class Bookcase extends StatefulWidget {
  const Bookcase({Key? key}) : super(key: key);

  @override
  State<Bookcase> createState() => _BookcaseState();
}

class _BookcaseState extends State<Bookcase> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("书架"),
        elevation: 0,
      ),
      body: const Center(
        child:  Text("书架"),
      ),
    );
  }
}
