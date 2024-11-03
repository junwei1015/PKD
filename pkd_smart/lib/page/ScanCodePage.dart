import 'package:flutter/material.dart';

class Scancodepage extends StatefulWidget {
  const Scancodepage({super.key});

  @override
  State<Scancodepage> createState() => _ScancodepageState();
}

class _ScancodepageState extends State<Scancodepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Attendance'),
        actions: [
          IconButton(
            onPressed: (){
              Navigator.popAndPushNamed(context, "/generate");
            }, 
            icon: const Icon(
              Icons.qr_code,
            ),
          ),
        ],
      ),
      body:Container(),
    );
  }
}