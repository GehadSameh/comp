
import 'package:competition/views/mezan_view.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
   final List<String> items1 = [
    'مصر',
    'السعودية',
    'الامارات',
    'البحرين',
    'الكويت',
    'قطر',
    'تونس',
    'سوريا',
    'الجزائر',
    'فلسطين',
    'عُمان',
    'السودان',
    'لبنان',
    'ليبيا',
    'موريتانيا',
    'العراق',
    'الاردن',
    'الصومال',
    'جيبوتى',
    'جزر القمر',
    'المغرب',
  ];
  String? selectedCountry;

  TextEditingController emailController=TextEditingController();
  TextEditingController nameController=TextEditingController();
  TextEditingController incomeController=TextEditingController();
  TextEditingController balanceController=TextEditingController();
  GlobalKey<FormState>globalKey=GlobalKey();
  bool issecure=true;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: Text('ميزان'),
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
             key: globalKey,
            child: Column(
              children: [
                Image.asset('assets/images/login.gif',
                height: MediaQuery.of(context).size.height/4,
                width: MediaQuery.of(context).size.width),
                TextFormField(
                  validator: (value){
                  if(value!.isEmpty){
                    return 'يجب ادخال بيانات فى هذا المكان';
                  }else{
                    return null;
                  }
                },
                  controller: nameController,
                  decoration: InputDecoration(
                   
                    label:Text( 'الاسم الكامل') ,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                    )
                  ),
                ),
                SizedBox(height: 10,),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    
                    label: Text('البريد الالكترونى'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                    )
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                   obscureText:issecure,
                  controller: incomeController,
                  decoration: InputDecoration(
                    
                    label:Text( 'الدخل الشهرى') ,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    suffix:IconButton(onPressed:(){
                    issecure=!issecure;
                    setState(() {
                      
                    });
                  }, icon:issecure? Icon(Icons.visibility_off):Icon(Icons.remove_red_eye)) 
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                   obscureText:issecure,
                  controller: balanceController,
                  decoration: InputDecoration(
                    
                    label: Text('الرصيد فى البنك'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    suffix:IconButton(onPressed:(){
                    issecure=!issecure;
                    setState(() {
                      
                    });
                  }, icon:issecure? Icon(Icons.visibility_off):Icon(Icons.remove_red_eye)) 
                  ),
                ),
                SizedBox(height: 10),
                  Row(
                    children: [
                      Text('اختر دولتك'),
                      Stack(
                        children: [
                          DropdownButton<String>(
                                        
                                        items: items1.map((country) {
                          return DropdownMenuItem(
                            value: country,
                            child: Text(country),
                          );
                                        }).toList(),
                                        onChanged: (value) {
                          setState(() {
                            selectedCountry = value;
                          });
                                        },
                          ),
                          Row(children: [
                            Icon(Icons.arrow_downward),
                            Text(selectedCountry.toString()),
                            
                          ],)
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {
                        
                   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MezanView(userName: 
                   nameController.text, email: emailController.text, country: '$selectedCountry', salary: double.parse(incomeController.text), balance:double.parse(balanceController.text))));
                  
                        
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF708871),
                        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                      ),
                      child: Text(
                        'تسجيل الدخول',
                        style: TextStyle(fontSize: 18),
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