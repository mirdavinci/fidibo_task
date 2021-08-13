import 'dart:math';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class RandomSlider extends StatefulWidget {
  const RandomSlider({Key? key}) : super(key: key);

  @override
  _RandomSliderState createState() => _RandomSliderState();
}

class _RandomSliderState extends State<RandomSlider> {
  List imageList = [
    'https://cdn.pixabay.com/photo/2018/04/09/18/26/asparagus-3304997_1280.jpg',
    'https://cdn.pixabay.com/photo/2017/05/01/05/18/pastry-2274750_1280.jpg',
    'https://cdn.pixabay.com/photo/2018/06/18/16/05/indian-food-3482749_1280.jpg',
    'https://cdn.pixabay.com/photo/2016/10/25/13/29/smoked-salmon-salad-1768890_1280.jpg',
    'https://cdn.pixabay.com/photo/2014/08/07/21/07/souffle-412785_1280.jpg',
  ];

  var buttonCarouselController = CarouselController();

  late Image img;

  Image imgUp = Image.network(
    'https://cdn.pixabay.com/photo/2014/08/07/21/07/souffle-412785_1280.jpg',
  );
  Image imgDown = Image.asset(
    'https://cdn.pixabay.com/photo/2018/06/18/16/05/indian-food-3482749_1280.jpg',
  );

  @override
  void initState() {
    img = imgUp;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: GestureDetector(
          onTapDown: (tap) {
            setState(() {
              img = imgDown;
            });
          },
          onTapUp: (tap) {
            setState(() {
              img = imgUp;
            });
          },
          child: Center(
            child: Container(
              color: Colors.white,
              height: 200,
              width: double.infinity,
              child: PageView.builder(
                itemCount: imageList.length * 2,
                itemBuilder: (context, position) {
                  return CarouselSlider.builder(
                    carouselController: buttonCarouselController,
                    itemCount: imageList.length,
                    itemBuilder: (BuildContext context, int itemIndex,
                        int pageViewIndex) {
                      return buildImage(context);
                    },
                    options:
                        CarouselOptions(autoPlay: true, viewportFraction: 1.0),
                  );
                },
                scrollDirection: Axis.horizontal,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildImage(BuildContext context) {
    var _random = new Random();
    var min = 0;
    var max = imageList.length - 1;
    int r = min + _random.nextInt(max - min);
    String imageName = imageList[r].toString();
    return Image.network(
      imageName,
      fit: BoxFit.cover,
    );
  }

  changePic() {
    var _random = new Random();
    var min = 0;
    var max = imageList.length - 1;
    int r = min + _random.nextInt(max - min);
    int randPic = imageList[r];
    return imageList[r];
  }
}
