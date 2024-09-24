import 'package:flutter/material.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/presentation/detail/widget/detail_widget.dart';

class DetailPage extends StatelessWidget {
  final MovieModel movie; // Declare the MovieModel variable

  // Constructor with named parameter
  const DetailPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xff15141F),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                // Use Image.asset with BoxFit.cover to fill the width
                Image.asset(
                  'assets/images/home/home_list2.png',
                  width: MediaQuery.of(context).size.width, // Full width
                  // You can adjust this height as needed
                  fit: BoxFit.cover, // Make the image cover the area
                ),

                Image.asset(
                  'assets/images/home/icon/Icon.png',
                ),
              ],
            ),
            // Additional content can be added here
            const Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Star Wars: The Last Jedi ',
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '4K',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        SizedBox(
                          width: 20,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.access_time,
                              size: 20,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '152 minutes',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              size: 20,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '7.0 (IMDb)',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      thickness: 0.2,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Release date',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 19),
                            ),
                            SizedBox(
                              width: 50,
                            ),
                            Text('Genre',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 19)),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'December 9, 2017',
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              width: 50,
                            ),
                            Row(
                              children: [
                                Chip(
                                  backgroundColor: Color(0xff15141F),
                                  label: Text(
                                    'Action',
                                    style: TextStyle(
                                        fontSize: 15, color: Color(0xFFBCBCBC)),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Chip(
                                  backgroundColor: Color(0xff15141F),
                                  label: Text(
                                    'Sci-Fi',
                                    style: TextStyle(
                                        fontSize: 15, color: Color(0xFFBCBCBC)),
                                  ),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                    Divider(
                      thickness: 0.2,
                    ),
                    Text(
                      'Synopsis',
                      style: TextStyle(color: Colors.white, fontSize: 19),
                    ),
                    Text(
                      'Rey (Daisy Ridley) finally manages to find the legendary Jedi  knight, Luke Skywalker (Mark Hamill) on an island with a magical aura. The heroes of The Force Awakens including Leia, Finn Read more..',
                      style: TextStyle(color: Colors.white70),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Related Movies',
                      style: TextStyle(color: Colors.white, fontSize: 19),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    DetailWidget(),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
