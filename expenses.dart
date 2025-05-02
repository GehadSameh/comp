import 'package:flutter/material.dart';

class ExpensesPage extends StatelessWidget {
  const ExpensesPage({super.key});


  @override
  Widget build(BuildContext context) {
    double salary = 10000;

    return Scaffold(
      backgroundColor: const Color(0xFFF3EEDC),
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'ميزان',
                    style: TextStyle(
                      fontFamily: 'Lemonada',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                const Align(
                  alignment: Alignment.centerRight,
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.black,
                    backgroundImage: AssetImage("assets/images/logo (2).png"),
                  ),
                ),
                const SizedBox(height: 10,),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 18),
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    decoration: BoxDecoration(
                      color: const Color(0xFFA9BE8D),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                    child: Text(
                      'في هذه الصفحة يتم عرض افضل نسبة لتنظيم مصروفات من خلال مرتبك',
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
                Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF555B6E),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      salary.toStringAsFixed(0),
                      style: const TextStyle(
                        fontSize: 28,
                        fontFamily: 'Lemonada',
                        color: Colors.white,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      expenseCard(
                        title: 'مصروفاتك الاساسية الثابتة',
                        percentage: 50,
                        amount: salary * 0.5,
                        imageItems: [
                          {'image': 'assets/images/l1.png', 'label': 'فواتير الكهرباء والمياه'},
                          {'image': 'assets/images/l2.png', 'label': 'مصاريف التعليم'},
                          {'image': 'assets/images/l3.png', 'label': 'الرعاية الصحية'},
                          {'image': 'assets/images/l4.png', 'label': 'النقل'},
                          {'image': 'assets/images/l44.png', 'label': 'الاتصالات'},
                        ],
                      ),
                      const SizedBox(width: 10),
                      expenseCard(
                        title: 'مصروفاتك الشخصية المتغيرة',
                        percentage: 30,
                        amount: salary * 0.3,
                        imageItems: [
                          {'image': 'assets/images/l4.png', 'label': 'التسوق'},
                          {'image': 'assets/images/l5.png', 'label': 'الأنشطة الترفيهية'},
                          {'image': 'assets/images/l6.png', 'label': 'الرحلات'},
                          {'image': 'assets/images/l8.png', 'label': 'الهدايا'},
                        ],
                      ),
                      const SizedBox(width: 10),
                      expenseCard(
                        title: 'الادخار والاستثمار',
                        percentage: 20,
                        amount: salary * 0.2,
                        imageItems: [
                          {'image': 'assets/images/l9.png', 'label': 'زيادة المدخرات'},
                          {'image': 'assets/images/l10.png', 'label': 'تعجيل سداد الديون'},
                          {'image': 'assets/images/l10.png', 'label': 'حالات للطوارئ'},
                        ],
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

  Widget expenseCard({
    required String title,
    required double percentage,
    required double amount,
    required List<Map<String, String>> imageItems,
  }) {
    return Container(
      width: 260,
      height: 360,
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFA9BE8D)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Center(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16,fontFamily: 'Lemonada'),
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 80,
                  height: 80,
                  child: CircularProgressIndicator(
                    value: percentage / 100,
                    strokeWidth: 6,
                    backgroundColor: Colors.green.shade200,
                    valueColor: const AlwaysStoppedAnimation(Color(0xFF7B8F79)),
                  ),
                ),
                Column(
                  children: [
                    Text(
                      '${percentage.toStringAsFixed(1)}%',
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Text(
                      amount.toStringAsFixed(1),
                      style: const TextStyle(fontSize: 14, color: Colors.green),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: imageItems.length,
              itemBuilder: (context, index) {
                final item = imageItems[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Text(
                          item['label']!,
                          style: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
                          textAlign: TextAlign.right,
                        ),
                      ),
                      const SizedBox(width: 8),
                      CircleAvatar(
                        radius: 14,
                        backgroundImage: AssetImage(item['image']!),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
