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
      create: (context) => SearchBloc(movieRepository)
        ..add(SearchEventLoadMovies())
        ..add(SearchEventGenreMovies()),
      child: Scaffold(
        backgroundColor: const Color(0xff15141F),
        appBar: AppBar(
          toolbarHeight: 100,
          backgroundColor: const Color(0xff15141F),
          title: const Padding(
            padding: EdgeInsets.only(top: 10, left: 10),
            child: Text(
              'Find Movies, TV series,\n and more..',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Lato',
                fontSize: 30,
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Ô tìm kiếm với nút nhấn
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xff211F30),
                        hintText: 'Sherlock Holmes..',
                        hintStyle: TextStyle(color: Colors.grey[400]),
                        prefixIcon:
                            const Icon(Icons.search, color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                      ),
                      style: const TextStyle(color: Colors.white),
                      onChanged: (value) {
                        // Gọi sự kiện tìm kiếm khi có sự thay đổi
                        context
                            .read<SearchBloc>()
                            .add(SearchEventSearchMovies(keyWord: value));
                      },
                    ),
                  ),
                  // IconButton(
                  //   icon: const Icon(Icons.search, color: Colors.white),
                  //   onPressed: () {
                  //     // Gọi sự kiện tìm kiếm khi nút được nhấn
                  //     context.read<SearchBloc>().add(SearchEventSearchMovies(
                  //         keyWord: _searchController.text));
                  //   },
                  // ),
                ],
              ),
              const SizedBox(height: 10),

              // TabBar cho thể loại phim
              BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
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

              // Danh sách phim
              Expanded(
                child: BlocBuilder<SearchBloc, SearchState>(
                  builder: (context, state) {
                    // Lọc danh sách phim dựa trên từ khóa tìm kiếm
                    final filteredMovies = state.movies.where((movie) {
                      return movie.title!
                          .toLowerCase()
                          .contains(_searchController.text.toLowerCase());
                    }).toList();

                    final List<List<Moives>> chunkedList = [];
                    for (var i = 0; i < filteredMovies.length; i += 4) {
                      chunkedList.add(filteredMovies.sublist(
                          i,
                          i + 4 > filteredMovies.length
                              ? filteredMovies.length
                              : i + 4));
                    }

                    return ListView.builder(
                      itemCount: chunkedList.length,
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
            ],
          ),
        ),
      ),
    );
  }
}
