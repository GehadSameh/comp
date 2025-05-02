import 'package:flutter/material.dart';

class MezanView extends StatefulWidget {
  final String userName;
  final String email;
  final String country;
  final double salary;
  final double balance;

  const MezanView({
    super.key,
    required this.userName,
    required this.email,
    required this.country,
    required this.salary,
    required this.balance,
  });

  @override
  State<MezanView> createState() => _MezanViewState();
}

class _MezanViewState extends State<MezanView> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController bankController;
  late TextEditingController salaryController;
  late String selectedCountry;

  final List<String> items1 = [
    'مصر', 'السعودية', 'الامارات', 'البحرين', 'الكويت', 'قطر',
    'تونس', 'سوريا', 'الجزائر', 'فلسطين', 'عُمان', 'السودان',
    'لبنان', 'ليبيا', 'موريتانيا', 'العراق', 'الاردن', 'الصومال',
    'جيبوتى', 'جزر القمر', 'المغرب',
  ];

  double updatedSalary = 0;
  double updatedBalance = 0;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.userName);
    emailController = TextEditingController(text: widget.email);
    bankController = TextEditingController();
    salaryController = TextEditingController(text: widget.salary.toString());
    selectedCountry = widget.country;
    updatedSalary = widget.salary;
    updatedBalance = widget.balance;
  }

  void _showEditDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            backgroundColor: const Color(0xFFF5EFD9),
            contentPadding: const EdgeInsets.all(16),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('تعديل البيانات الشخصية', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  _buildTextField('الاسم', nameController),
                  _buildTextField('البريد الإلكتروني', emailController),
                  _buildTextField('الحساب البنكي', bankController, isPassword: true),
                  _buildTextField('الراتب الشهري', salaryController, isPassword: true),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.arrow_drop_down),
                      const Text('اختر الدولة : ', style: TextStyle(fontWeight: FontWeight.bold)),
                      DropdownButton<String>(
                        value: selectedCountry,
                        underline: const SizedBox(),
                        items: items1.map((country) {
                          return DropdownMenuItem(
                            value: country,
                            child: Text(country),
                          );
                        }).toList(),
                        onChanged: (value) {
                          if (value != null) {
                            setState(() {
                              selectedCountry = value;
                            });
                          }
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            updatedSalary = double.tryParse(salaryController.text) ?? updatedSalary;
                            updatedBalance = double.tryParse(bankController.text) ?? updatedBalance;
                          });
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF6A6F73),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text('حفظ'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('إلغاء'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, {bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: TextField(
        obscureText: isPassword,
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: isPassword ? const Icon(Icons.visibility) : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  Widget _buildCircleIndicator(String label, double value) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 70,
              height: 70,
              child: CircularProgressIndicator(
                value: value / 1000,
                backgroundColor: Colors.white,
                valueColor: const AlwaysStoppedAnimation(Color(0xFF8AA583)),
                strokeWidth: 6,
              ),
            ),
            Text(value.toInt().toString(), style: const TextStyle(fontSize: 16)),
          ],
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 14)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF5EFD9),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: const Text('ميزان', style: TextStyle(color: Colors.black)),
        ),
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: const Color(0xFFBFD1B0),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/user1.jpg'),
                ),
                const SizedBox(height: 8),
                Text(nameController.text, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text(emailController.text, style: const TextStyle(color: Colors.black54)),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xFF6F8870),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(selectedCountry, style: const TextStyle(color: Colors.white, fontSize: 16)),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildCircleIndicator('الراتب الشهرى', updatedSalary),
                    _buildCircleIndicator('الحساب البنكى', updatedBalance),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _showEditDialog,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFEAE3D1),
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 2,
                  ),
                  child: const Text('تعديل'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
