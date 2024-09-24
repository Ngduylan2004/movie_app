import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class NewfeedWidget extends StatelessWidget {
  final List<String> imgList = [
    'assets/images/anh1.png',
    'assets/images/home/home_list2.png',
    'assets/images/anh3.png',
  ];
  NewfeedWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: CarouselSlider(
        options: CarouselOptions(
          height: 400.0,
          autoPlay: true,
          enlargeCenterPage: true,
          aspectRatio: 16 / 9,
          autoPlayCurve: Curves.fastOutSlowIn,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          viewportFraction: 0.8,
        ),
        items: imgList.map((item) {
          return Builder(
            builder: (BuildContext context) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(36),
                    child: Image.asset(
                      item,
                      width: MediaQuery.of(context).size.width * 0.75,
                      height: 400,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 150,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        const Positioned(
                          child: Text(
                            'Star Wars: The Last Jedi',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Stack(
                      children: [
                        Container(
                          width: 70,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Center(
                            child: Row(
                              crossAxisAlignment:
                                  CrossAxisAlignment.end, // nằm dưới
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'IMDb',
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Image.asset(
                                      'assets/images/home/icon/start.png',
                                      width: 15,
                                      height: 15,
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 5),
                                const Text(
                                  '7.0',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
