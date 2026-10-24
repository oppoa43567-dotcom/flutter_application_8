// ignore_for_file: unused_import, unnecessary_const

import 'package:flutter/material.dart';
import 'package:flutter_taxi_fare_app/views/taxi_fare_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({super.key});

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  //สร้างตัวแปรเก็บ index baritem ที่เลือก
  int selectIndex = 0;

  // สร้าง list เก็บหน้าที่ต้องการแสดง 3 หน้า About,BMR,BMI
  //list เหมือน array
  List subview = [
    TaxiFareUI(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 245, 205, 15),
        title: const Text(
          "Taxi Fare",
          style: TextStyle(
            color: const Color.fromARGB(255, 254, 250, 255),
          ),
        ),
        centerTitle: true,
      ),
      body: subview[selectIndex],
    );
  }
}
