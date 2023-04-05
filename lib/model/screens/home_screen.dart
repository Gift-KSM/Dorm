import 'package:flutter/material.dart';
import 'package:flutter_login/model/page_detail/page_Cheravee.dart';
import 'package:flutter_login/model/page_detail/page_Cheravee.dart';
import 'package:flutter_login/model/page_detail/page_chokanan.dart';
import 'package:flutter_login/model/page_detail/page_diva.dart';
import 'package:flutter_login/model/page_detail/page_pimrada.dart';
import 'package:flutter_login/model/page_detail/page_therich.dart';
import 'package:vs_scrollbar/vs_scrollbar.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  // HomeScreen({super.key});
  bool _verticalList = true;
  // ignore: unused_field
  int _selctedIndex = 0;
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    // Container(
    //   decoration: BoxDecoration(
    //       image: DecorationImage(
    //     image: AssetImage(
    //       'assets/CSC/csc1.jpg',
    //     ),
    //     fit: BoxFit.cover,
    //   )),
    // );
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.pinkAccent.shade200,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              SizedBox(width: 16),
              Text(
                'DORM KUCSC',
                style: TextStyle(fontFamily: 'FC Orbit Rounded'),
              ),
            ],
          )),
      backgroundColor: Color.fromARGB(255, 219, 166, 184),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        physics: const BouncingScrollPhysics(),
        children: [
          Container(
            
            height:
                _verticalList ? MediaQuery.of(context).size.height - 180 : 180,
            // width: double.infinity,
            child: VsScrollbar(
              controller: _scrollController,
              showTrackOnHover: true, // default false
              isAlwaysShown: true, // default false
              scrollbarFadeDuration: const Duration(
                  milliseconds: 500), // default : Duration(milliseconds: 300)
              scrollbarTimeToFade: const Duration(
                  milliseconds: 800), // default : Duration(milliseconds: 600)
              style: const VsScrollbarStyle(
                hoverThickness: 10.0, // default 12.0
                radius: Radius.circular(40), // default Radius.circular(8.0)
                thickness: 10.0, // default 8.0
                color: Color.fromARGB(
                    255, 153, 140, 140), // default ColorScheme Theme
              ),
              child: SingleChildScrollView(
                child: Column(children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DetailsDiva(),
                        ));
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.60),
                            borderRadius: BorderRadius.circular(10)),
                        height: 160,
                        width: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              children: const <Widget>[
                                SizedBox(
                                  height: 40,
                                ),
                                Text(
                                  "ดิวา พลู & เพลส ",
                                  style: TextStyle(
                                      fontFamily: 'Mitr',
                                      fontSize: 23,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                // SizedBox(
                                //   height: 30,
                                // ),
                                Text(
                                  "ราคา 14,500 บาท/เทอม ",
                                  style: TextStyle(
                                      fontFamily: 'Mitr',
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const SizedBox(width: 6),

                            // ClipRRect(borderRadius: BorderRadius.only(
                            //   topLeft: Radius.circular(8.0),
                            //   topRight: Radius.circular(8.0),

                            // ),),
                            //
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                'https://scontent.fkkc4-2.fna.fbcdn.net/v/t39.30808-6/338424047_1424900274913706_7414791937619518398_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=5cd70e&_nc_eui2=AeFTWTQfTTrOf7iFLJX1QAeFzdNfQvbjTmHN019C9uNOYd7ETk9uokqyDwfjBAPXacMP_irVXwftGh19htqbpmxz&_nc_ohc=WKWMJXP2J60AX-aETUn&_nc_zt=23&_nc_ht=scontent.fkkc4-2.fna&oh=00_AfDMpd9UTroavSw6_jDd_zevI84ZXhSsZWMw0D3iQMxXBA&oe=64312F5F',
                                fit: BoxFit.cover,
                                height: 135,
                                width: 142,
                              ),
                            )

                            //
                          ],
                        ),
                      )),
                  const SizedBox(height: 10),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DetailsChokanan(),
                        ));
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.60),
                            borderRadius: BorderRadius.circular(10)),
                        height: 160,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              children: const <Widget>[
                                SizedBox(
                                  height: 40,
                                ),
                                Text(
                                  "  โชคอนันต์",
                                  style: TextStyle(
                                      fontFamily: 'Mitr',
                                      fontSize: 26,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "  ราคา 15,000 บาท/เทอม",
                                  style: TextStyle(
                                      fontFamily: 'Mitr',
                                      fontSize: 14,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const SizedBox(width: 19),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                'https://scontent.fkkc4-2.fna.fbcdn.net/v/t1.18169-9/23032627_1901797553166926_5039011940767249207_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=8bfeb9&_nc_eui2=AeGIwdGko3-WrydJkp-wlYEE4K5Q3nwfH6bgrlDefB8fpgocmowGoaoVN0iajelLQjz9M1Bn5BO4m05DG4qUciHS&_nc_ohc=zxNXghICa_MAX913Y-7&_nc_ht=scontent.fkkc4-2.fna&oh=00_AfDj5htn4UaXpy3VBJbhvsl7BweTxiC9VqF-u-pzvS079A&oe=6453AFE9',
                                fit: BoxFit.cover,
                                height: 135,
                                width: 142,
                              ),
                            )
                          ],
                        ),
                      )),
                  const SizedBox(height: 10),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DetailsPimrada(),
                        ));
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.60),
                            borderRadius: BorderRadius.circular(10)),
                        height: 160,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              children: const <Widget>[
                                SizedBox(
                                  height: 40,
                                ),
                                Text(
                                  "  หอพิมพ์รดา",
                                  style: TextStyle(
                                      fontFamily: 'Mitr',
                                      fontSize: 26,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "  ราคา 18,000 บาท/เทอม",
                                  style: TextStyle(
                                      fontFamily: 'Mitr',
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const SizedBox(width: 18),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                'https://scontent.fkkc4-2.fna.fbcdn.net/v/t39.30808-6/308561633_3219609888312744_605774441523532900_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=5cd70e&_nc_eui2=AeEuaDU9dLYIqIjJ9Ne8TFZ4cfICBFRrELFx8gIEVGsQsbsy3Ir7cS28CBaE6Iu74AHInh8F_60JVsVms6c23qM4&_nc_ohc=6zfDO7THdNYAX-GW9QB&_nc_zt=23&_nc_ht=scontent.fkkc4-2.fna&oh=00_AfDWf-6C4GMEGq_zqZYqPslup8AZwf3qJeS0CDdXXVdqJA&oe=6430BE76',
                                fit: BoxFit.cover,
                                height: 135,
                                width: 142,
                              ),
                            )
                          ],
                        ),
                      )),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DetailsTherich(),
                      ));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.60),
                          borderRadius: BorderRadius.circular(10)),
                      height: 160,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            children: const [
                              SizedBox(
                                height: 40,
                              ),
                              Text(
                                "  เดอะริช",
                                style: TextStyle(
                                    fontFamily: 'Mitr',
                                    fontSize: 26,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "  ราคา 16,800 บาท/เทอม",
                                style: TextStyle(
                                    fontFamily: 'Mitr',
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(width: 20),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              'https://scontent.fkkc4-1.fna.fbcdn.net/v/t1.18169-9/13177909_629533823877495_2065939664506705868_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=19026a&_nc_eui2=AeGle5M9P5M_l5wuXXEpcHNBDkhK0jVp4vIOSErSNWni8ii2RDtHX0ll73aHuCOyBU0_VcOYh-DE0bCztdJCynvn&_nc_ohc=tt74XbqA4tkAX9kZFw7&_nc_ht=scontent.fkkc4-1.fna&oh=00_AfCYyinTjr8k_1SDyvCTdJopibLVejkIA38ijl6tYM4xlA&oe=6453A2BE',
                              fit: BoxFit.cover,
                              height: 135,
                              width: 142,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (
                          context,
                        ) =>
                            DetailsCheravee(),
                      ));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.60),
                          borderRadius: BorderRadius.circular(10)),
                      height: 160,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            children: const [
                              SizedBox(
                                height: 40,
                              ),
                              Text(
                                "  เชรวี",
                                style: TextStyle(
                                    fontFamily: 'Mitr',
                                    fontSize: 26,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "  ราคา 12,000 บาท/เทอม",
                                style: TextStyle(
                                    fontFamily: 'Mitr',
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          // SizedBox(
                          //   height: 2,
                          // ),
                          const SizedBox(
                            width: 20,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              'https://scontent.fkkc4-2.fna.fbcdn.net/v/t39.30808-6/331687799_894952821764729_6985680605017259912_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=5cd70e&_nc_eui2=AeGc9DkV6_I-cWr9fQEaXLVmD_xAFTxsrLYP_EAVPGystmM3ealQjCLvlVMUWET8WqvCH6rPPnPpAfWS_0fnboaF&_nc_ohc=K96IKOCLbgMAX8kbEi8&_nc_zt=23&_nc_ht=scontent.fkkc4-2.fna&oh=00_AfD2ksCL5HHCfOOohPu-BPheMw7fR3RQwNxWw6AGfVVlsA&oe=64306453',
                              fit: BoxFit.cover,
                              height: 135,
                              width: 142,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
