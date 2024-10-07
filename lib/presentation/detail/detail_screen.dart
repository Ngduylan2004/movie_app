import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:movie_app/data/repostory/movies_repostory_impl.dart';
import 'package:movie_app/domain/entities/movies_entities.dart';
import 'package:movie_app/presentation/detail/bloc/detail_bloc.dart';
import 'package:movie_app/presentation/detail/widget/detail_widget.dart';

class DetailPage extends StatelessWidget {
  final MoviesEntities movie; // Declare the MovieModel variable

  // Constructor with named parameter
  const DetailPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailBloc(MoviesRepositoryImpl.instance)
        ..add(DetailEventRelateMovies(movie.genreIds?.first ?? 0)),
      child: Scaffold(
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
                  Image.network(
                    'https://image.tmdb.org/t/p/w500${movie.backdropPath}',
                    width: MediaQuery.of(context).size.width, // Full width
                    height: 345,
                    // You can adjust this height as needed
                    fit: BoxFit.cover, // Make the image cover the area
                  ),

                  Image.asset(
                    'assets/images/home/icon/Icon.png',
                  ),
                ],
              ),
              // Additional content can be added here
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              movie.title ?? 'Untitled',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 24),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            '4K',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          const SizedBox(
                            width: 20,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text(
                                'VoteCount:', // Hiển thị điểm đánh giá
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                '${movie.voteCount ?? 0}', // Hiển thị điểm đánh giá
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 15),
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                size: 20,
                                color: Colors.white,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                '${movie.voteAverage ?? 0} (IMDb)', // Hiển thị điểm đánh giá
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 15),
                              )
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        thickness: 0.2,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Row(
                            children: [
                              Text(
                                'Release date',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 19),
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
                                movie.releaseDate != null
                                    ? DateFormat('dd MMMM yyyy').format(
                                        DateTime.parse(movie.releaseDate!))
                                    : 'No release date available', // Kiểm tra null và định dạng ngày
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                              const SizedBox(
                                width: 50,
                              ),
                              Row(
                                children: [
                                  Chip(
                                    backgroundColor: const Color(0xff15141F),
                                    label: Text(
                                      movie.genreIds!.join(', '),
                                      style: const TextStyle(
                                          fontSize: 15,
                                          color: Color(0xFFBCBCBC)),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Chip(
                                    backgroundColor: Color(0xff15141F),
                                    label: Text(
                                      'Sci-Fi',
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Color(0xFFBCBCBC)),
                                    ),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                      const Divider(
                        thickness: 0.2,
                      ),
                      const Text(
                        'Synopsis',
                        style: TextStyle(color: Colors.white, fontSize: 19),
                      ),
                      Text(
                        movie.overview ??
                            'No synopsis available.', // Hiển thị tóm tắt phim
                        style: const TextStyle(color: Colors.white60),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text(
                        'Related Movies',
                        style: TextStyle(color: Colors.white, fontSize: 19),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const DetailWidget(),
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
