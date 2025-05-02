import 'package:flutter/material.dart';

class Conversion extends StatefulWidget {
  const Conversion({super.key});

  @override
  State<Conversion> createState() => _ConversionState();
}

class _ConversionState extends State<Conversion> {
  String selectedvalue = 'Egypt[EGP]';
  List<String> countries = ['Egypt[EGP]', 'USA[USD]', 'KSA[SAR]'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4EFD9),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Align(
              alignment: Alignment.topRight,
              child: Text(
                'ميزان',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Lemonada',
                ),
              ),
            ),
            SizedBox(height: 50),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 100,
                  width: 250,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Color(0xFFAFC7A5),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Text(
                    'في هذه الغرفه يمكنك تحويل العملات الى قيمتها الدولارية',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black87,
                      fontFamily: 'Gulzar',
                    ),
                  ),
                ),
                Positioned(
                  top: -50,
                  right: -60,
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.black,
                    backgroundImage: AssetImage('assets/images/logo (2).png'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 50),
            Row(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    'اختر العمله المراد تحويلها',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lemonada',
                    ),
                  ),
                ),
                SizedBox(width: 50),
                DropdownButton<String>(
                  value: selectedvalue,
                  items:
                      countries
                          .map(
                            (String value) => DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            ),
                          )
                          .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedvalue = value!;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            Center(
              child: SizedBox(
                height: 100,
                width: 200,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: 'ادخل المبلغ ',
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                'تحويل',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFAFC7A5),
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            SizedBox(height: 30),
            Container(
              height: 200,
              width: 300,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Egypt (EGP)()= 0.000',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    maxLines: 2,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
