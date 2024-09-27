import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/models/listMovie/moives_model.dart';
import 'package:movie_app/presentation/search/bloc/search_bloc.dart';
import 'package:movie_app/presentation/search/widget/movie_group_widget.dart';
import 'package:movie_app/repository/api_moive.dart';

class SearchingScreen extends StatefulWidget {
  const SearchingScreen({super.key});

  @override
  State<SearchingScreen> createState() => _SearchingScreenState();
}

class _SearchingScreenState extends State<SearchingScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _searchController = TextEditingController();

  final MovieRepository movieRepository = MovieRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      //  context
      //         .read<SearchBloc>()
      //         .add(SearchEventIncrementCounter());
      //   },
      create: (context) => SearchBloc(movieRepository)
        ..add(SearchEventLoadMovies())
        ..add(SearchEventGenreMovies()),
      child: Scaffold(
        backgroundColor: const Color(0xff15141F),
        appBar: AppBar(
          toolbarHeight: 100, // Giới hạn độ cao appbar
          backgroundColor:
              const Color(0xff15141F), // Đặt màu nền của AppBar là màu đen
          title: const Padding(
            padding: EdgeInsets.only(top: 10, left: 10),
            child: Text(
              'Find Movies, Tv series,\n and more..',
              style: TextStyle(
                  color: Colors.white, fontFamily: 'Lato', fontSize: 30),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xff211F30), // Background input
                  hintText: 'Sherlock Holmes..',
                  hintStyle:
                      TextStyle(color: Colors.grey[400]), // Màu chữ gợi ý
                  prefixIcon: const Icon(Icons.search,
                      color: Colors.white), // Màu của biểu tượng tìm kiếm
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: const BorderSide(
                      color: Colors.grey, // Màu viền của TextField
                    ),
                  ),
                ),
                style: const TextStyle(
                    color: Colors.white), // Màu chữ trong TextField
              ),
              const SizedBox(height: 10),
              BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  print(state
                      .categories); // Kiểm tra xem categories có dữ liệu không
                  if (state.categories.isEmpty) {
                    return const SizedBox.shrink();
                  }
                  return DefaultTabController(
                    length: state.categories.length,
                    child: TabBar(
                      isScrollable: true,
                      indicatorSize: TabBarIndicatorSize.label,
                      onTap: (index) {
                        final selectedGenre = state.categories[index];
                        context
                            .read<SearchBloc>()
                            .add(SearchEventGenreMoviesTab(selectedGenre));
                      },
                      tabs: state.categories
                          .map((category) => Tab(text: category.name))
                          .toList(),
                      indicatorColor: Colors.white,
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.grey,
                    ),
                  );
                },
              ),

              const SizedBox(height: 20),

              // Hiển thị danh sách các phần phim
              Expanded(
                child: BlocBuilder<SearchBloc, SearchState>(
                  builder: (context, state) {
                    // Sử dụng danh sách movies từ state
                    final List<List<Moives>> chunkedList = []; //note

                    for (var i = 0; i < state.movies.length; i += 4) {
                      chunkedList.add(state.movies.sublist(
                          i,
                          i + 4 > state.movies.length
                              ? state.movies.length
                              : i + 4));
                    }
                    return ListView.builder(
                      itemCount: chunkedList.length, // Số lượng phim
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          child:
                              MovieGroupWidget(listMovie: chunkedList[index]),
                        );
                      },
                    );
                  },
                ),
              ),
              BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  return const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // FloatingActionButton(
                        //   onPressed: () {
                        //     context
                        //         .read<SearchBloc>()
                        //         .add(SearchEventIncrementCounter());
                        //   },
                        //   child: const Icon(Icons.add),
                        // ),
                      ]);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
