import 'package:flutter/material.dart';
import 'package:flutter_formuscine/app/controller/colors_controller.dart';
import 'package:flutter_formuscine/app/view/movie_details_view.dart';
import 'package:flutter_formuscine/app/viewmodels/movie_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final MovieStore movieStore = MovieStore();

  @override
  void initState() {
    super.initState();
    movieStore.fetchTopMoviesUS();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.primaryColor,
      appBar: AppBar(
        title: Text(
          'FormusCine',
          style: GoogleFonts.mitr(
            textStyle: const TextStyle(
              color: CustomColor.secondaryColor,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Observer(builder: (_) {
          if (movieStore.movies.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  mainAxisExtent: 320,
                ),
                itemCount: 10,
                itemBuilder: (context, index) {
                  final movie = movieStore.movies[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MovieDetailsView(movie: movie),
                        ),
                      );
                    },
                    child: Card(
                      color: CustomColor.tertiaryColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.network(
                              'https://image.tmdb.org/t/p/w200${movie.posterPath}',
                              fit: BoxFit.cover,
                            ),
                            Text(
                              movie.title,
                              style: const TextStyle(color: CustomColor.secondaryColor, fontWeight: FontWeight.w700, fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          }
        }),
      ),
    );
  }
}
