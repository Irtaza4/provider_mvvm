import 'package:flutter/material.dart';
import 'package:mvvm_provider/utils/routes/route_names.dart';
import 'package:mvvm_provider/view_model/home_view_model.dart';
import 'package:mvvm_provider/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<void> _movieFuture;

  @override
  void initState() {
    super.initState();
    final movieProvider = Provider.of<HomeViewModel>(context, listen: false);
    _movieFuture = movieProvider.fetchMovieData();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserViewModel>(context);
    final movieProvider = Provider.of<HomeViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              userProvider.remove().then((_) {
                Navigator.pushNamed(context, RouteNames.loginScreen);
              });
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: _movieFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (movieProvider.movieData == null ||
              movieProvider.movieData!.results == null ||
              movieProvider.movieData!.results!.isEmpty) {
            return Center(child: Text('No data found.'));
          }

          return ListView.builder(
            itemCount: movieProvider.movieData!.results!.length,
            itemBuilder: (context, index) {
              final movie = movieProvider.movieData!.results![index];
              return ListTile(
                leading: Image.network(
                  'https://image.tmdb.org/t/p/w500${movie.posterPath.toString()}',
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Center(child: Icon(Icons.error));
                  },
                ),
                title: Text(movie.title.toString()),
                subtitle: Text('ID: ${movie.id}'),

              );
            },
          );
        },
      ),
    );
  }
}
