import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/model/login.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:flutter_login/model/slide.dart';

class BoardingPage extends StatefulWidget {
  @override
  _BoardingScreenState createState() => _BoardingScreenState();
}

class _BoardingScreenState extends State<BoardingPage> {
  // creating all the widget before making our home screeen

  int _currentPage = 0;
  List<Slide> _slides = [];
  PageController _pageController = PageController();

  @override
  void initState() {
    _currentPage = 0;
    _slides = [
      Slide(
        "assets/img/icon_app.png",
        "",
      ),
      Slide("assets/slide-2.png", ""),
      Slide("assets/slide-3.png", ""),
    ];
    _pageController = PageController(initialPage: _currentPage);
    super.initState();
  }

  // the list which contain the build slides
  List<Widget> _buildSlides() {
    return _slides.map(_buildSlide).toList();
  }

  // building single slide

  Widget _buildSlide(Slide slide) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            margin: const EdgeInsets.all(32),
            child: Image.asset(slide.image, fit: BoxFit.contain),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 70),
          child: Text(
            slide.heading,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        const SizedBox(
          height: 100,
        )
      ],
    );
  }

  // handling the on page changed
  void _handlingOnPageChanged(int page) {
    setState(() => _currentPage = page);
  }

  // building page indicator
  Widget _buildPageIndicator() {
    Row row = Row(mainAxisAlignment: MainAxisAlignment.center, children: []);
    for (int i = 0; i < _slides.length; i++) {
      row.children.add(_buildPageIndicatorItem(i));
      if (i != _slides.length - 1) {
        row.children.add(const SizedBox(
          width: 12,
        ));
      }
    }
    return row;
  }

  Widget _buildPageIndicatorItem(int index) {
    return Container(
      width: index == _currentPage ? 8 : 5,
      height: index == _currentPage ? 8 : 5,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: index == _currentPage
              ? const Color.fromRGBO(136, 144, 178, 1)
              : const Color.fromRGBO(206, 209, 223, 1)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 219, 247),
      body: Stack(
        children: <Widget>[
          PageView(
            controller: _pageController,
            onPageChanged: _handlingOnPageChanged,
            physics: const BouncingScrollPhysics(),
            children: _buildSlides(),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Column(
              children: <Widget>[
                _buildPageIndicator(),
                const SizedBox(
                  height: 32,
                ),
                Container(
                  // see the page indicators

                  margin: const EdgeInsets.symmetric(horizontal: 32),
                  child: SizedBox(
                      width: double.infinity,
                      child: GradientButton(
                        callback: () => {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => login()))
                        },

                        gradient: const LinearGradient(colors: [
                          Color.fromARGB(255, 238, 100, 146),
                          Color.fromARGB(255, 224, 153, 177),
                        ]),
                        elevation: 0,
                        increaseHeightBy: 28,
                        increaseWidthBy: double.infinity,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),

                        child: const Text(
                          "LOGIN",
                          style: TextStyle(
                            letterSpacing: 4,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        // onPressed: () => {}),
                      )),
                ),
                const SizedBox(
                  height: 10,
                ),
                CupertinoButton(
                    child: const Text(
                      "Register",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color.fromARGB(255, 169, 167, 167),
                      ),
                    ),
                    onPressed: () =>
                        {Navigator.pushNamed(context, 'register')}),
                const SizedBox(
                  //ระยะห่าง ล็อกอินกับรูปโลโก้
                  height: 110,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
