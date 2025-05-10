import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Info extends StatefulWidget {
  const Info({super.key});

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        body: ListView(
          children: [
            // كود المربع التعريفي
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 4.0),
                padding: EdgeInsets.all(20.0),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.storefront,
                        size: 50.0,
                        color: Colors.white,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'مرحبا بك في تطبيق متاجر السعودية',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: 'ElMessiri',
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'التطبيق الذي يجمع المتاجر الالكترونية في مكان واحد مما يسهل عملية البحث عن منتج',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.white,
                          fontFamily: 'ElMessiri',
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF3F51B5), Colors.blueAccent],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
              ),
            ),

            // قسم "عن التطبيق"
            Padding(
              padding: const EdgeInsets.only(top: 60,right: 4, left: 3),
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 126, 126, 126),
                      blurRadius: 4,
                      offset: Offset(4, 8), // Shadow position
                    ),
                  ],
                ),
                child: ExpansionTile(
                  backgroundColor: Color.fromARGB(255, 242, 242, 242),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  leading: Icon(Icons.info_outline),
                  title: Text(
                    'عن التطبيق ',
                    style: TextStyle(
                      fontFamily: 'ElMessiri',
                    ),
                  ),
                  textColor: const Color.fromRGBO(63, 81, 181, 1),
                  children: [
                    ListTile(
                      onTap: () {},
                      title: Text('تطبيق متاجر السعودية هو تطبيق يضم العديد من المتاجر الالكترونية في مكان واحد مما يجعل عملية البحث عن متجر او منتج عملية سهله ويمكن حفظ المتاجر المفضلة لديك في صفحة المتاجر المفضلة  '),
                      titleTextStyle: TextStyle(
                        fontFamily: 'ElMessiri',
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // قسم "تواصل معنا"
            Padding(
              padding: const EdgeInsets.only(top: 30,right: 4, left: 3),
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 126, 126, 126),
                      blurRadius: 4,
                      offset: Offset(4, 8), // Shadow position
                    ),
                  ],
                ),
                child: ExpansionTile(
                  backgroundColor: Color.fromARGB(255, 242, 242, 242),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  leading: Icon(Icons.comment_outlined),
                  title: Text(
                    'تواصل معنا',
                    style: TextStyle(
                      fontFamily: 'ElMessiri',
                    ),
                  ),
                  textColor: const Color.fromRGBO(63, 81, 181, 1),
                  children: [
                    ListTile(
                      onTap: () {},
                      title: Text('يمكنك التواصل معنا عبر البريد الالكتروني عن طريق الضغط في الاسفل '),
                      titleTextStyle: TextStyle(
                          fontFamily: 'ElMessiri', color: Colors.black),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: ElevatedButton(
                        onPressed: () {
                          launch('mailto:su.ksastores@gmail.com');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                        ),
                        child: Text('تواصل معنا عن طريق البريد الاكتروني @',
                            style: TextStyle(
                                fontFamily: 'ElMessiri', color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // قسم "كن شريكا"
            Padding(
              padding: const EdgeInsets.only(top: 30,right: 4, left: 3),
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 126, 126, 126),
                      blurRadius: 4,
                      offset: Offset(4, 8), // Shadow position
                    ),
                  ],
                ),
                child: ExpansionTile(
                  backgroundColor: Color.fromARGB(255, 242, 242, 242),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  leading: Icon(Icons.add_business_outlined),
                  title: Text(
                    'إنضم معنا',
                    style: TextStyle(
                      fontFamily: 'ElMessiri',
                    ),
                  ),
                  textColor: const Color.fromRGBO(63, 81, 181, 1),
                  children: [
                    ListTile(
                      onTap: () {},
                      title: Text('يسعدنا انضمامك إلينا تواصل معنا عبر البريد الالكتروني  su.ksastores@gmail.com  '),
                      titleTextStyle: TextStyle(
                          fontFamily: 'ElMessiri', color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30,bottom: 20,right: 4, left: 3),
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 126, 126, 126),
                      blurRadius: 4,
                      offset: Offset(4, 8), // Shadow position
                    ),
                  ],
                ),
                child: ExpansionTile(
                  backgroundColor: Color.fromARGB(255, 242, 242, 242),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  leading: Icon(Icons.policy_outlined),
                  title: Text(
                    'الشروط والأحكام',
                    style: TextStyle(
                      fontFamily: 'ElMessiri',
                    ),
                  ),
                  textColor: const Color.fromRGBO(63, 81, 181, 1),
                  children: [
                    ListTile(
                      onTap: () {},
                      title: Text('يعمل هذا التطبيق على جمع المتاجر الإلكترونية في مكان واحد لتسهيل عملية البحث عن المنتجات. نود التنويه بأن التطبيق ليس مسؤولاً عن بيع المنتجات أو تسليمها، حيث تتم جميع عمليات البيع والتسليم مباشرة بين المستخدم والمتجر. كما أن التطبيق غير مسؤول عن جودة المنتجات أو دقتها أو سلامتها، وأي نزاعات تتعلق بالمشتريات يجب حلها بين المستخدم والمتجر. باستخدام هذا التطبيق، فإنك توافق على هذه الشروط والأحكام. '),
                      titleTextStyle: TextStyle(
                          fontFamily: 'ElMessiri', color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),



            // محتوى اضافي واضافة الحقوق


                    Padding(
                      padding: const EdgeInsets.only(top: 60),
                      child: Text(
                        'جميع الحقوق محفوظة متاجر السعودية 2025',
                        style: TextStyle(
                          fontFamily: 'ElMessiri',
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),

          ],
        ),
      ),
    );
  }
}
