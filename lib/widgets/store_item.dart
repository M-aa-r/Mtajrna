import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';
import 'package:dotted_border/dotted_border.dart';
import '../screens/store_screen/cubit/store_cubit.dart';

class StoreItem extends StatefulWidget {
  final String id;
  final String title;
  final String imageUrl;
  final String SiteUrl;
  final String copoun;
  final String Specialization;
  final double discount;

  StoreItem({
    Key? key,
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.SiteUrl,
    required this.copoun,
    required this.Specialization,
    required this.discount,
  }) : super(key: key);

  @override
  State<StoreItem> createState() => _StoreItemState();
}

class _StoreItemState extends State<StoreItem> {
  TextEditingController controller = TextEditingController();

  _copy() {
    final value = ClipboardData(text: controller.text);
    Clipboard.setData(value);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0, left: 8.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          elevation: 7,
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              Stack(
                children: [
                  const ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(70),
                      topRight: Radius.circular(70),
                      bottomRight: Radius.circular(70),
                      bottomLeft: Radius.circular(70),
                    ),
                  ),
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(70)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                              widget.imageUrl,
                              height: 70,
                              width: 70,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 40),
                        child: Text(
                          widget.title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontFamily: 'ElMessiri',
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        height: 70,
                        width: 70,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(50)),
                          color: Color.fromRGBO(63, 81, 181, 1),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.store,
                            color: Colors.white,
                            size: 26,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 50),
                      child: Column(
                        children: [
                          const SizedBox(width: 20),
                          ElevatedButton(
                            child: const Text(
                              "مشاهدة المتجر",
                              style: TextStyle(
                                fontSize: 13.5,
                                fontFamily: 'ElMessiri',
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () async {
                              final url = widget.SiteUrl;
                              await launchUrl(Uri.parse(url),
                                  mode: Platform.isAndroid
                                      ? LaunchMode.externalNonBrowserApplication
                                      : LaunchMode.externalApplication);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromRGBO(63, 81, 181, 1),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 50.0),
                      child: Column(
                        children: [
                          IconButton(
                              icon: Icon(
                                StoreCubit.get(context).isFavorite(widget.id)
                                    ? Icons.star
                                    : Icons.star_border,
                              ),
                              onPressed: () {
                                if (FirebaseAuth.instance.currentUser?.uid !=
                                    null) {
                                  if (StoreCubit.get(context).isFavorite(widget.id)) {
                                    StoreCubit.get(context).removeFavorite(widget.id);
                                  } else {
                                    StoreCubit.get(context).addFavorite(widget.id);
                                  }
                                }
                              }),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        final urlPreview = widget.SiteUrl;
                        await Share.share('\n${widget.Specialization}\n$urlPreview');
                      },
                      icon: const Icon(Icons.share_outlined),
                    ),
                  ],
                ),
              ),
              const Divider(
                color: Color.fromARGB(255, 129, 123, 122),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 7, left: 20, right: 20),
                child: Text(
                  widget.Specialization,
                  style: const TextStyle(
                    fontSize: 10,
                    fontFamily: 'ElMessiri',
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              // هنا تم إضافة الزر الخاص بالكوبون
              Column(
                children: [
                  const SizedBox(height: 10),
                  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                           // title: Text(widget.copoun.isNotEmpty ? 'خصم الكوبون  ' : 'خصم في المتجر '),
                            title: Text(widget.copoun.isNotEmpty
                                ? 'خصم الكوبون الى ${widget.discount.toInt()}%' : 'الخصم في المتجر',
                              textAlign: TextAlign.center,),
                            titleTextStyle: TextStyle(
                              fontSize: 19,
                              color: Color.fromRGBO(63, 81, 181, 1),
                              fontFamily: 'ElMessiri',
                            ) ,



                            content: widget.copoun.isNotEmpty
                                ?Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Row(
                                //من خلال هذا الكولم تم وضع الكوبون في المنتصف
                                children: [
                                  Builder(
                                    builder: (context) => SizedBox(
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 12.0, right: 10),
                                        child: DottedBorder(
                                          borderType: BorderType.RRect,
                                          //padding: const EdgeInsets.all(15.0),
                                          radius: const Radius.circular(30),
                                          dashPattern: const [10, 5, 10, 5, 10, 5],
                                          color: const Color.fromARGB(255, 96, 93, 102),
                                          child: Material(
                                            borderRadius: BorderRadius.circular(28),
                                            clipBehavior: Clip.antiAliasWithSaveLayer,
                                            child: InkWell(
                                              splashColor: Colors.black26,
                                              //كود onTap هو لنسخ كوبون الخصم
                                              onTap: () {
                                                Clipboard.setData(ClipboardData(
                                                  text: widget.copoun,
                                                ));
                                                //رسالة تم النسخ

                                                ScaffoldMessenger.of(context).showSnackBar(
                                                  SnackBar(
                                                    behavior: SnackBarBehavior.floating,
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(20.0),
                                                    ),
                                                    content: Row(
                                                      children: [
                                                        Icon(
                                                          Icons.check_circle,
                                                          color: Colors.white,
                                                        ),
                                                        SizedBox(width: 8.0),
                                                        Text(
                                                          'تم النسخ!',
                                                          style: TextStyle(
                                                            fontFamily: 'ElMessiri',
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    backgroundColor: const Color.fromARGB(164, 8, 189, 14),
                                                  ),
                                                );
                                              },
                                              child: Padding(
                                                padding: const EdgeInsets.only(left: 25.0),
                                                child: Row(
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                      //من خلال الكود في الاسفل تم انشاء ايقونه كوبون الخصم مع دائرة   ذذ
                                                      Container(
                                                          padding: const EdgeInsets.all(7),
                                                          decoration: const BoxDecoration(
                                                            shape: BoxShape.circle,
                                                            color: Colors.indigo,
                                                          ),
                                                          child: const Icon(
                                                            Icons.discount,
                                                            color: Color.fromARGB(
                                                                255, 255, 255, 255),
                                                          )),
                                                      //هذا نص الكوبون
                                                      const SizedBox(width: 20),
                                                      Text(
                                                        widget.copoun,
                                                        style: const TextStyle(
                                                          fontSize: 20,
                                                          fontFamily: 'Viga',
                                                        ),

                                                        //SizedBox(width: 20),
                                                      ),
                                                      //ايقونة النسخ بجانب الكوبون
                                                      const Padding(
                                                        padding: EdgeInsets.only(right: 8.0),
                                                        child: Icon(
                                                          Icons.copy,
                                                          size: 18,
                                                        ),
                                                      ),
                                                    ]),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ):
                                const Text('لايتطلب كوبون انتقل الان للمتجر واستمتع بخصومات رائعة',
                              style: TextStyle(fontFamily:'ElMessiri', ),  ),
                            actions: [
                              // الآن سيتم إظهار زر "مشاهدة المتجر" في كل الحالات سواء وُجد كوبون أم لا
                              ElevatedButton(
                                onPressed: () async {
                                  await launchUrl(Uri.parse(widget.SiteUrl),
                                      mode: Platform.isAndroid
                                          ? LaunchMode.externalNonBrowserApplication
                                          : LaunchMode.externalApplication);
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.min, // لتقليل المساحة بين الأيقونة والنص
                                  children: const [
                                    Text(
                                      "إذهب للمتجر",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'ElMessiri',
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(width: 8), // مسافة صغيرة بين الأيقونة والنص
                                    Icon(
                                      Icons.store, // الأيقونة التي تريد إضافتها
                                      size: 20,
                                      color: Colors.white, // لون الأيقونة
                                    ),
                                  ],
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blueAccent,
                                ),
                              ),

                              TextButton(
                                child: const Text('تم',style: TextStyle(fontFamily:'ElMessiri',fontSize: 12, ),),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                            actionsAlignment: MainAxisAlignment.spaceBetween,
                          );
                        },
                      );
                    },

                    child: DottedBorder(
                      borderType: BorderType.RRect,
                      radius: const Radius.circular(20),
                      dashPattern: const [10, 6],
                      color: Colors.blueAccent,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 1),
                        decoration: BoxDecoration(
                          color: Colors.blueAccent.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Icon(
                          Icons.local_offer,
                          size: 35,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}






















/*
// ignore_for_file: must_be_immutable
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
//import '../models/store.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'package:mtjry/main.dart';
//import '../screens/category_stores_screens.dart';
import 'package:flutter/services.dart';
//import 'package:clipboard/clipboard.dart';
import 'package:dotted_border/dotted_border.dart';
import '../screens/store_screen/cubit/store_cubit.dart';
//import 'package:share_plus/share_plus.dart';

class StoreItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final String SiteUrl;
  final String copoun;
  final String Specialization;
  final double discount;

  StoreItem({
    Key? key,
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.SiteUrl,
    required this.copoun,
    required this.Specialization,
    required this.discount,
  }) : super(key: key);

  TextEditingController controller = TextEditingController();

  _copy() {
    final value = ClipboardData(text: controller.text);
    Clipboard.setData(value);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0, left: 8.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          elevation: 7,
          margin: const EdgeInsets.all(10),
          child: Column(
            //من خلال هذا الكولم  تم تغيير الصوره واسم المتجر
            children: [
              Stack(
                children: [
                  const ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(70),
                      topRight: Radius.circular(70),
                      bottomRight: Radius.circular(70),
                      bottomLeft: Radius.circular(70),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        height: 70, // كامل المربع
                        alignment: Alignment.bottomRight,
                        padding: const EdgeInsets.symmetric(),

                        decoration: const BoxDecoration(),
                      ),
                      ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(70),
                          // topLeft:
                          // topRight: Radius.circular(70),
                          //  bottomRight: Radius.circular(70),
                          //  bottomLeft: Radius.circular(70),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                              imageUrl,
                              height: 70,
                              width: 70,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 40),
                        child: Text(
                          title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontFamily: 'ElMessiri',
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        height: 70,
                        width: 70,
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.only(topLeft: Radius.circular(50)),
                            color: Color.fromRGBO(63, 81, 181, 1)),
                        child: Center(
                            child: Icon(
                          Icons.store,
                          color: Colors.white,
                          size: 26,
                        )),
                      ),
                      // في الاسفل كود نسبة الخصم بدال ايقونة المتجر

                      // const Spacer(), // وضع النسبه في اقصى البطاقه
                      /* Container(
                        height: 70,
                        width: 70,
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.only(topLeft: Radius.circular(50)),
                            color: Colors.amber),
                        child: Center(
                            child: Text(
                          "$discount%",
                          style: const TextStyle(
                              fontSize: 18, fontFamily: "ElMessiri-Bold"),
                        )),
                      )*/
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 50),
                      child: Column(
                        children: [
                          const SizedBox(width: 20),
                          ElevatedButton(
                            child: const Text(
                              "مشاهدة المتجر",
                              style: TextStyle(
                                fontSize: 13.5,
                                fontFamily: 'ElMessiri',
                                color: Color.fromRGBO(63, 81, 181, 1),
                              ),
                            ),
                            onPressed: () async {
                              final url = SiteUrl;
                              await launchUrl(Uri.parse(url),
                                  mode: Platform.isAndroid
                                      ? LaunchMode.externalNonBrowserApplication
                                      : LaunchMode.externalApplication);
                            },
                            style: ElevatedButton.styleFrom(
                                /* backgroundColor:
                                  const Color.fromRGBO(63, 81, 181, 1),*/
                                ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 50.0),
                        child: Column(
                          children: [
                            IconButton(
                                icon: Icon(
                                    StoreCubit.get(context).isFavorite(id)
                                        ? Icons.star
                                        : Icons.star_border),
                                onPressed: () {
                                  if (FirebaseAuth.instance.currentUser?.uid !=
                                      null) {
                                    if (StoreCubit.get(context)
                                        .isFavorite(id)) {
                                      StoreCubit.get(context)
                                          .removeFavorite(id);
                                    } else {
                                      StoreCubit.get(context).addFavorite(id);
                                    }
                                  }
                                })
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: IconButton(
                          onPressed: () async {
                            final urlPreview = SiteUrl;

                            await Share.share('\n$Specialization\n$urlPreview');
                          },
                          icon: Icon(Icons.share_outlined)),
                    ),
                  ],
                ),
              ),
              const Divider(
                color: Color.fromARGB(255, 129, 123, 122),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 7, left: 20, right: 20),
                child: Text(
                  Specialization,
                  style: const TextStyle(
                    fontSize: 10,
                    fontFamily: 'ElMessiri',
                    //backgroundColor: Color.fromARGB(59, 132, 0, 255),
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
                Padding(
                padding: const EdgeInsets.all(5.0),
    child: Column(
    // من خلال هذا الكولم تم وضع الكوبون في المنتصف
    children: [
    Builder(
    builder: (context) => SizedBox(
    child: Padding(
    padding: const EdgeInsets.only(top: 12.0),
    child: copoun.isNotEmpty
    ? DottedBorder(
    borderType: BorderType.RRect,
    radius: const Radius.circular(30),
    dashPattern: const [10, 5, 10, 5, 10, 5],
    color: const Color.fromARGB(255, 96, 93, 102),
    child: Material(
    borderRadius: BorderRadius.circular(28),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    child: InkWell(
    splashColor: Colors.black26,
    // كود onTap هو لنسخ كوبون الخصم
    onTap: () {
    Clipboard.setData(ClipboardData(text: copoun));
    // رسالة تم النسخ
    ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20.0),
    ),
    content: Row(
    children: const [
    Icon(
    Icons.check_circle,
    color: Colors.white,
    ),
    SizedBox(width: 8.0),
    Text(
    'تم النسخ!',
    style: TextStyle(
    fontFamily: 'ElMessiri',
    ),
    ),
    ],
    ),
    backgroundColor:
    const Color.fromARGB(164, 8, 189, 14),
    ),
    );
    },
    child: Padding(
    padding: const EdgeInsets.only(left: 25.0),
    child: Row(
    mainAxisSize: MainAxisSize.min,
    children: [
    // من خلال الكود في الأسفل تم إنشاء أيقونة كوبون الخصم مع دائرة
    Container(
    padding: const EdgeInsets.all(7),
    decoration: const BoxDecoration(
    shape: BoxShape.circle,
    color: Colors.indigo,
    ),
    child: const Icon(
    Icons.discount,
    color: Colors.white,
    ),
    ),
    // هذا نص الكوبون
    const SizedBox(width: 20),
    Text(
    copoun,
    style: const TextStyle(
    fontSize: 20,
    fontFamily: 'Viga',
    ),
    ),
    // أيقونة النسخ بجانب الكوبون
    const Padding(
    padding: EdgeInsets.only(right: 8.0),
    child: Icon(
    Icons.copy,
    size: 18,
    ),
    ),
    ]),
    ),
    ),
    ),
    )
        : const Center(
    child: Text(
    'لا يوجد كوبون متاح',
    style: TextStyle(
    fontSize: 18,
    fontFamily: 'ElMessiri',
    color: Colors.grey,
    ),
    ),
    ),
    ),
    ),
    ),
    ],
    ),
    )]))));

  }
}




             /* Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  //من خلال هذا الكولم تم وضع الكوبون في المنتصف
                  children: [
                    Builder(
                      builder: (context) => SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 12.0),
                          child: DottedBorder(
                            borderType: BorderType.RRect,
                            //padding: const EdgeInsets.all(15.0),
                            radius: const Radius.circular(30),
                            dashPattern: const [10, 5, 10, 5, 10, 5],
                            color: const Color.fromARGB(255, 96, 93, 102),
                            child: Material(
                              borderRadius: BorderRadius.circular(28),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: InkWell(
                                splashColor: Colors.black26,
                                //كود onTap هو لنسخ كوبون الخصم
                                onTap: () {
                                  Clipboard.setData(ClipboardData(
                                    text: copoun,
                                  ));
                                  //رسالة تم النسخ

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      behavior: SnackBarBehavior.floating,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20.0),
                                      ),
                                      content: Row(
                                        children: [
                                          Icon(
                                            Icons.check_circle,
                                            color: Colors.white,
                                          ),
                                          SizedBox(width: 8.0),
                                          Text(
                                            'تم النسخ!',
                                            style: TextStyle(
                                              fontFamily: 'ElMessiri',
                                            ),
                                          ),
                                        ],
                                      ),
                                      backgroundColor: const Color.fromARGB(164, 8, 189, 14),
                                    ),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 25.0),
                                  child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        //من خلال الكود في الاسفل تم انشاء ايقونه كوبون الخصم مع دائرة   ذذ
                                        Container(
                                            padding: const EdgeInsets.all(7),
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.indigo,
                                            ),
                                            child: const Icon(
                                              Icons.discount,
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                            )),
                                        //هذا نص الكوبون
                                        const SizedBox(width: 20),
                                        Text(
                                          copoun,
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontFamily: 'Viga',
                                          ),

                                          //SizedBox(width: 20),
                                        ),
                                        //ايقونة النسخ بجانب الكوبون
                                        const Padding(
                                          padding: EdgeInsets.only(right: 8.0),
                                          child: Icon(
                                            Icons.copy,
                                            size: 18,
                                          ),
                                        ),
                                      ]),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/


 */







/*


import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

//import '../models/store.dart';
import 'package:url_launcher/url_launcher.dart';

//import 'package:mtjry/main.dart';
//import '../screens/category_stores_screens.dart';
import 'package:flutter/services.dart';

//import 'package:clipboard/clipboard.dart';
import 'package:dotted_border/dotted_border.dart';

import '../screens/store_screen/cubit/store_cubit.dart';
//import 'package:share_plus/share_plus.dart';

class StoreItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final String SiteUrl;
  final String copoun;
  final String Specialization;
  final double discount;

  StoreItem({
    Key? key,
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.SiteUrl,
    required this.copoun,
    required this.Specialization,
    required this.discount,
  }) : super(key: key);

  TextEditingController controller = TextEditingController();

  _copy() {
    final value = ClipboardData(text: controller.text);
    Clipboard.setData(value);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0, left: 8.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          elevation: 7,
          margin: const EdgeInsets.all(10),
          child: Column(
            //من خلال هذا الكولم  تم تغيير الصوره واسم المتجر
            children: [
              Stack(
                children: [
                  const ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(70),
                      topRight: Radius.circular(70),
                      bottomRight: Radius.circular(70),
                      bottomLeft: Radius.circular(70),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        height: 70, // كامل المربع
                        alignment: Alignment.bottomRight,
                        padding: const EdgeInsets.symmetric(),

                        decoration: const BoxDecoration(),
                      ),
                      ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(70),
                          // topLeft:
                          // topRight: Radius.circular(70),
                          //  bottomRight: Radius.circular(70),
                          //  bottomLeft: Radius.circular(70),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                              imageUrl,
                              height: 70,
                              width: 70,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 40),
                        child: Text(
                          title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontFamily: 'ElMessiri',
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        height: 70,
                        width: 70,
                        decoration: const BoxDecoration(
                            borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(50)),
                            color: Color.fromRGBO(63, 81, 181, 1)),
                        child: Center(
                            child: Icon(
                              Icons.store,
                              color: Colors.white,
                              size: 26,
                            )),
                      ),
                      // في الاسفل كود نسبة الخصم بدال ايقونة المتجر

                      // const Spacer(), // وضع النسبه في اقصى البطاقه
                      /* Container(
                        height: 70,
                        width: 70,
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.only(topLeft: Radius.circular(50)),
                            color: Colors.amber),
                        child: Center(
                            child: Text(
                          "$discount%",
                          style: const TextStyle(
                              fontSize: 18, fontFamily: "ElMessiri-Bold"),
                        )),
                      )*/
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 50),
                      child: Column(
                        children: [
                          const SizedBox(width: 20),
                          ElevatedButton(
                            child: const Text(
                              "مشاهدة المتجر",
                              style: TextStyle(
                                fontSize: 13.5,
                                fontFamily: 'ElMessiri',
                                color: Color.fromRGBO(63, 81, 181, 1),
                              ),
                            ),
                            onPressed: () async {
                              final url = SiteUrl;
                              await launchUrl(Uri.parse(url),
                                  mode: Platform.isAndroid
                                      ? LaunchMode.externalNonBrowserApplication
                                      : LaunchMode.externalApplication);
                            },
                            style: ElevatedButton.styleFrom(
                              /* backgroundColor:
                                  const Color.fromRGBO(63, 81, 181, 1),*/
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 50.0),
                        child: Column(
                          children: [
                            IconButton(
                                icon: Icon(
                                    StoreCubit.get(context).isFavorite(id)
                                        ? Icons.star
                                        : Icons.star_border),
                                onPressed: () {
                                  if (FirebaseAuth.instance.currentUser?.uid !=
                                      null) {
                                    if (StoreCubit.get(context)
                                        .isFavorite(id)) {
                                      StoreCubit.get(context)
                                          .removeFavorite(id);
                                    } else {
                                      StoreCubit.get(context).addFavorite(id);
                                    }
                                  }
                                })
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: IconButton(
                          onPressed: () async {
                            final urlPreview = SiteUrl;

                            await Share.share('\n$Specialization\n$urlPreview');
                          },
                          icon: Icon(Icons.share_outlined)),
                    ),
                  ],
                ),
              ),
              const Divider(
                color: Color.fromARGB(255, 129, 123, 122),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 7, left: 20, right: 20),
                child: Text(
                  Specialization,
                  style: const TextStyle(
                    fontSize: 10,
                    fontFamily: 'ElMessiri',
                    //backgroundColor: Color.fromARGB(59, 132, 0, 255),
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  //من خلال هذا الكولم تم وضع الكوبون في المنتصف
                  children: [
                    Builder(
                      builder: (context) => SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 12.0),
                          child: DottedBorder(
                            borderType: BorderType.RRect,
                            //padding: const EdgeInsets.all(15.0),
                            radius: const Radius.circular(30),
                            dashPattern: const [10, 5, 10, 5, 10, 5],
                            color: const Color.fromARGB(255, 96, 93, 102),
                            child: Material(
                              borderRadius: BorderRadius.circular(28),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: InkWell(
                                splashColor: Colors.black26,
                                //كود onTap هو لنسخ كوبون الخصم
                                onTap: () {
                                  Clipboard.setData(ClipboardData(
                                    text: copoun,
                                  ));
                                  //رسالة تم النسخ

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      behavior: SnackBarBehavior.floating,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20.0),
                                      ),
                                      content: Row(
                                        children: [
                                          Icon(
                                            Icons.check_circle,
                                            color: Colors.white,
                                          ),
                                          SizedBox(width: 8.0),
                                          Text(
                                            'تم النسخ!',
                                            style: TextStyle(
                                              fontFamily: 'ElMessiri',
                                            ),
                                          ),
                                        ],
                                      ),
                                      backgroundColor: const Color.fromARGB(164, 8, 189, 14),
                                    ),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 25.0),
                                  child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        //من خلال الكود في الاسفل تم انشاء ايقونه كوبون الخصم مع دائرة   ذذ
                                        Container(
                                            padding: const EdgeInsets.all(7),
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.indigo,
                                            ),
                                            child: const Icon(
                                              Icons.discount,
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                            )),
                                        //هذا نص الكوبون
                                        const SizedBox(width: 20),
                                        Text(
                                          copoun,
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontFamily: 'Viga',
                                          ),

                                          //SizedBox(width: 20),
                                        ),
                                        //ايقونة النسخ بجانب الكوبون
                                        const Padding(
                                          padding: EdgeInsets.only(right: 8.0),
                                          child: Icon(
                                            Icons.copy,
                                            size: 18,
                                          ),
                                        ),
                                      ]),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/











