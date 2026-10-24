// ignore_for_file: non_constant_identifier_names, unused_local_variable, sort_child_properties_last

import 'package:flutter/material.dart';

class TaxiFareUI extends StatefulWidget {
  const TaxiFareUI({super.key});

  @override
  State<TaxiFareUI> createState() => _TaxiFareUIState();
}

class _TaxiFareUIState extends State<TaxiFareUI> {
  TextEditingController disctrl = TextEditingController();
  TextEditingController jamctrl = TextEditingController();

  //สร้างตัวแปรเพื่อเก็บค่าที่คำนวณได้
  String taxiFare = '0.00';
  String TFjam = '0.00';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 254, 250, 255),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 45.0,
              right: 45.0,
              top: 50.0,
              bottom: 50.0,
            ),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/taxi.png',
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.width * 0.3,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Text(
                  'คำนวนหาค่าโดยสารแท็กซี่',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 0, 0, 0),
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "ระยะทาง (กิโลเมตร) 🛣️",
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                TextField(
                  controller: disctrl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 0, 0, 0),
                        width: 2.0,
                      ),
                    ),
                    hintText: 'กรุณากรอกระยะทาง',
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                    filled: true,
                    fillColor: const Color.fromARGB(255, 253, 253, 253),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.015,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "เวลารถติด (นาที) ⏰",
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                TextField(
                  controller: jamctrl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 0, 0, 0),
                        width: 2.0,
                      ),
                    ),
                    hintText: 'กรุณากรอกเวลารถติด',
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                    filled: true,
                    fillColor: const Color.fromARGB(255, 253, 253, 253),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                ElevatedButton(
                  onPressed: () {
                    //validate input ว่าผู้ใช้กรอกข้อมูลครบหรือไม่
                    if (disctrl.text.isEmpty || jamctrl.text.isEmpty) {
                      //ถ้าไม่ครบให้แสดงข้อความว่ากรอกข้อมูลไม่ครบ
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('⚠️ กรุณากรอกข้อมูลให้ครบถ้วน'),
                          backgroundColor: Color.fromARGB(255, 255, 20, 20),
                          duration: Duration(seconds: 2),
                        ),
                      );
                      return; //หยุดการทำงานของฟังก์ชัน
                    }
                    //ถ้าครบให้คำนวณค่าโดยสาร
                    double dis = double.parse(disctrl.text);
                    double jamfee =
                        double.parse(jamctrl.text) * 3; // ค่ารถติดนาทีละ 3 บาท
                    double fare; // ค่าโดยสารตามระยะทาง

                    if (dis <= 1) {
                      fare = 35;
                    } else if (dis <= 10) {
                      fare = 35 + (dis - 1) * 6.50;
                    } else if (dis <= 20) {
                      fare = 35 + 58.50 + (dis - 10) * 7.00;
                    } else if (dis <= 40) {
                      fare = 35 + 128.50 + (dis - 20) * 8.00;
                    } else if (dis <= 60) {
                      fare = 35 + 288.50 + (dis - 40) * 8.50;
                    } else if (dis <= 80) {
                      fare = 35 + 458.50 + (dis - 60) * 9.00;
                    } else {
                      fare = 35 + 638.50 + (dis - 80) * 10.50;
                    }

                    setState(() {
                      TFjam = jamfee.toStringAsFixed(2); // ค่ารถติด
                      taxiFare =
                          (fare + jamfee).toStringAsFixed(2); // ค่าโดยสารรวม
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    fixedSize: Size(
                      MediaQuery.of(context).size.width,
                      55,
                    ),
                    backgroundColor: Color.fromARGB(255, 245, 205, 15),
                  ),
                  child: Text('คำนวณค่าโดยสาร',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.white)),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                ElevatedButton(
                  onPressed: () {
                    //ล้างข้อมูลใน textfield ทั้งหมด เหมือนเปิดเข้ามาใหม่ ๆ
                    setState(() {
                      disctrl.text = '';
                      jamctrl.text = '';
                      taxiFare = '0.00';
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    fixedSize: Size(
                      MediaQuery.of(context).size.width,
                      55,
                    ),
                    backgroundColor: Colors.grey,
                  ),
                  child: Text('ยกเลิก',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.white)),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 245, 194),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.035,
                      ),
                      Text('ค่าโดยสารแท็กซี่',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(taxiFare,
                          style: TextStyle(
                              fontSize: 32,
                              color: Color.fromARGB(255, 255, 65, 0))),
                      Text('บาท',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.035,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
