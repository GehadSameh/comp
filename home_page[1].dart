import 'package:competition_project/screens/expenses.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final String userName = "khlood Elsayed";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3EEDC),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    'ميزان',
                    style: TextStyle(
                      fontFamily: 'Lemonada',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.black,
                    backgroundImage: AssetImage("assets/images/logo (2).png"),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 18),
                margin: const EdgeInsets.only(right: 32, left: 16),
                decoration: BoxDecoration(
                  color: const Color(0xFFA9BE8D),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(24),
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24),
                  ),
                ),
                child: Text(
                  'أهلاً بك في الميزان يا $userName',
                  style: const TextStyle(
                    fontSize: 20,
                    fontFamily: 'Lemonada',
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  customButton(context, 'حساب تحويل العملات الى الدولار', 'assets/images/dolar.png',onPressed: (){}),
                  customButton(context, 'عرض الأقساط ومواعيدها', 'assets/images/aqsat.jpg',onPressed: (){}),
                  customButton(
                    context,
                    'تنظيم المصروفات بالنسبة لدخلك الشهري',
                    'assets/images/masrouf.png',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ExpensesPage()),
                      );
                    },
                  ),
                  customButton(context, 'البيانات الشخصية', 'assets/images/data.jpg',onPressed: (){}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget customButton(
    BuildContext context,
    String text,
    String imagePath, {
    VoidCallback? onPressed,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(18),
          backgroundColor: const Color(0xFF7B8F79),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.pink.shade50,
              backgroundImage: AssetImage(imagePath),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                text,
                textAlign: TextAlign.right,
                style: const TextStyle(
                  fontFamily: 'Lemonada',
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
