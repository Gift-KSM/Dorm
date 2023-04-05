import 'package:flutter/material.dart';
import 'package:flutter_login/core/color.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_login/model/screens/payment.dart';

class DetailsChokanan extends StatelessWidget {
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

                    // image: DecorationImage(
                    //   image: AssetImage(plant.imagePath),
                    //   fit: BoxFit.cover,
                    // ),
                  ),
                  child: ImageSlideshow(
                    width: double.infinity,
                    height: 100,
                    children: [
                      // Image.asset(dorm.imagePath)
                      Image.asset(
                        'assets/img/Dorm/chokanan1.jpg',
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        'assets/img/Dorm/chokanan2.jpg',
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        'assets/img/Dorm/chokanan3.jpg',
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        'assets/img/Dorm/chokanan4.jpg',
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        'assets/img/Dorm/chokanan5.jpg',
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
                                  text: 'โชคอนันต์',
                                  style: TextStyle(
                                    fontFamily: 'Mitr',
                                    color: black.withOpacity(1.0),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30.0,
                                  ),
                                ),
                                // TextSpan(
                                //   text: '  (${plant.category} Plant)',
                                //   style: TextStyle(
                                //     color: black.withOpacity(0.5),
                                //     fontSize: 18.0,
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                          //   Container(
                          //     height: 30.0,
                          //     width: 30.0,
                          //     padding: const EdgeInsets.all(8.0),
                          //     decoration: BoxDecoration(
                          //       color: green,
                          //       boxShadow: [
                          //         BoxShadow(
                          //           color: green.withOpacity(0.2),
                          //           blurRadius: 15,
                          //           offset: const Offset(0, 5),
                          //         ),
                          //       ],
                          //       borderRadius: BorderRadius.circular(8.0),
                          //     ),
                          //     child: Image.asset(
                          //       'assets/icons/heart.png',
                          //       color: white,
                          //     ),
                          //   )
                        ],
                      ),
                      const SizedBox(height: 5.0),
                      RichText(
                        text: TextSpan(
                          text:
                              '- หอพักรายเทอม ราคา 15,000 บาท/เทอม\n- ค่าน้ำ 8 บาท/หน่วย\n- ค่าไฟ 8บาท/หน่วย\n- ฟรีอินเทอร์เน็ต\n- มีเครื่องซักผ้า/อบผ้า หยอดเหรียญ\n- ตู้กดน้ำหยอดเหรียญ',
                          style: TextStyle(
                            fontFamily: 'Mitr',
                            color: black.withOpacity(1.0),
                            fontSize: 16.0,
                            height: 1.7,
                            letterSpacing: 0.8,
                          ),
                        ),
                      ),
                      // const SizedBox(height: 20.0),
                      // Text(
                      //   'Treatment',
                      //   style: TextStyle(
                      //     color: black.withOpacity(0.9),
                      //     fontSize: 18.0,
                      //     height: 1.4,
                      //     fontWeight: FontWeight.bold,
                      //     letterSpacing: 0.5,
                      //   ),
                      // ),
                      // const SizedBox(height: 20.0),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //   children: [
                      //     Image.asset('assets/icons/sun.png',
                      //         color: black, height: 24.0),
                      //     Image.asset('assets/icons/drop.png',
                      //         color: black, height: 24.0),
                      //     Image.asset('assets/icons/temperature.png',
                      //         color: black, height: 24.0),
                      //     Image.asset('assets/icons/up_arrow.png',
                      //         color: black, height: 24.0),
                      //   ],
                      // ),
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
                // Image.asset('assets/icons/cart.png',
                //     color: black, height: 40.0),
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
                      // \$${plant.price.toStringAsFixed(0)}
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
                )),
          ],
        ),
      ),
    );
  }
}
