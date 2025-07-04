import 'package:flutter/material.dart';
import 'package:kuis/models/movies.dart';
import 'package:kuis/screens/detail_screen.dart';
import 'package:kuis/services/api_services.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});
  @override
  SearchScreenState createState() => SearchScreenState();
}
class SearchScreenState extends State<SearchScreen> {
  final ApiService _apiService = ApiService();
  final TextEditingController _searchController = TextEditingController();
  List<Movie> _searchResults = [];
  @override
  void initState() {
    super.initState();
    _searchController.addListener(_searchMovies);
  }
  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
  void _searchMovies() async {
  if (_searchController.text.isEmpty) {
    setState(() {
      _searchResults.clear();
    });
    return;
  }

  try {
    final List<Movie> searchData = await _apiService.searchMovies(_searchController.text);
    setState(() {
      _searchResults = searchData; // Hanya data valid yang dimasukkan
    });
  } catch (e) {
    print("Error: $e");
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      decoration: const InputDecoration(
                        hintText: 'Search movies...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Visibility(
                    visible: _searchController.text.isNotEmpty,
                    child: IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        _searchController.clear();
                        setState(() {
                          _searchResults.clear();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _searchResults.length,
                itemBuilder: (context, index) {
                  final Movie movie = _searchResults[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: ListTile(
                      leading: movie.posterPath != null && movie.posterPath!.isNotEmpty
                        ? Image.network(
                            'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                            height: 50,
                            width: 50,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(Icons.image_not_supported, size: 50);
                            },
                          )
                        : const Icon(Icons.image_not_supported, size: 50),

                      title: Text(movie.title),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailScreen(movie:
                            movie),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}