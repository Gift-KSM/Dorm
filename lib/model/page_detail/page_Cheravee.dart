import 'package:flutter/material.dart';
import 'package:flutter_login/core/color.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_login/model/screens/payment.dart';

class DetailsCheravee extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: height / 2,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 227, 249),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 255, 227, 249),
                        blurRadius: 15,
                        offset: const Offset(0, 350),
                      ),
                    ],
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(60),
                      bottomRight: Radius.circular(60),
                    ),
                  ),
                  child: ImageSlideshow(
                    width: double.infinity,
                    height: 100,
                    children: [
                      // Image.asset(dorm.imagePath)
                      Image.asset(
                        'assets/img/Dorm/cheravee1.jpg',
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        'assets/img/Dorm/cheravee2.jpg',
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        'assets/img/Dorm/cheravee3.jpg',
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        'assets/img/Dorm/cheravee4.jpg',
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        'assets/img/Dorm/cheravee5.jpg',
                        fit: BoxFit.cover,
                      ),
                    ],
                    onPageChanged: (value) {
                      print('Page changed: $value');
                    },
                    autoPlayInterval: 3000,
                    isLoop: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'เชรวี',
                                  style: TextStyle(
                                    fontFamily: 'Mitr',
                                    color: black.withOpacity(1.0),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5.0),
                      RichText(
                        text: TextSpan(
                          text:
                              '- หอพัก ราคา 12,000 บาท/เทอม\n- ค่าน้ำ 7 บาท/หน่วย\n- ค่าไฟ 7 บาท /หน่วย\n- ลานจอดรถ\n- มีร้านค้าหน้าหอพัก\n- ห่างจากประตูมหาลัยประมาณ 300 เมตร\n- กล้องวงจรปิด',
                          style: TextStyle(
                            color: black.withOpacity(1.0),
                            fontFamily: 'Mitr',
                            fontSize: 14.0,
                            height: 1.7,
                            letterSpacing: 0.8,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Home(),
                ));
              },
              child: Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 50.0, vertical: 15.0),
                  decoration: BoxDecoration(
                    color: Colors.pink,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white,
                        blurRadius: 15,
                        offset: const Offset(0, -5),
                      ),
                    ],
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(60),
                    ),
                  ),
                  child: Text(
                    'Reserve',
                    style: TextStyle(
                      fontFamily: 'Mitr',
                      color: white.withOpacity(0.9),
                      fontSize: 18.0,
                      height: 1.4,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
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
