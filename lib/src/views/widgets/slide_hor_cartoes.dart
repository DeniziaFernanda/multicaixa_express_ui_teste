import 'package:flutter/material.dart';
import 'package:multicaixa_express_ui/src/utils/colors.dart';

class SlideScollHorisontal extends StatefulWidget {
  const SlideScollHorisontal({Key? key}) : super(key: key);

  @override
  State<SlideScollHorisontal> createState() =>
      _SlideScollHorisontalState();
}

class _SlideScollHorisontalState
    extends State<SlideScollHorisontal> {
  final List<String> images = [
    'assets/cartao-06.png',
    'assets/cartao2-15.png',
    'assets/cartao-12.png',
  ];
  int _currentPage = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  List<Widget> _buildPageIndicator() {
    return List<Widget>.generate(images.length, (index) {
      return Container(
        width: 12,
        height: 12,
        margin: const EdgeInsets.symmetric(horizontal: 4.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _currentPage == index ? myPrimaryColor : Colors.grey,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: 250,
          child: PageView.builder(
            controller: _pageController,
            itemCount: images.length,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemBuilder: (BuildContext context, int index) {
              return AnimatedBuilder(
                animation: _pageController,
                builder: (BuildContext context, Widget? child) {
                  double value = 1.0;
                  if (_pageController.hasClients &&
                      _pageController.position.haveDimensions) {
                    value = _pageController.page! - index;
                    value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);
                  }
                  return Center(
                    child: SizedBox(
                      height: Curves.easeInOutCubic.transform(value) * 300,
                      width: Curves.easeInOutCubic.transform(value) * 320,
                      child: child,
                    ),
                  );
                },
                child: Column(
                  children: [
                    Image(image: AssetImage(images[index]),),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Text("Cartão ${index + 1}", style: TextStyle(color: corSegundaria, fontSize: 20,),),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _buildPageIndicator(),
        
        ),
      ],
    );
  }
}
