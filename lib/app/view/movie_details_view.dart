// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_formuscine/app/controller/colors_controller.dart';

import 'package:flutter_formuscine/app/model/movies_model.dart';
import 'package:flutter_formuscine/app/service/tmdb_movie_details_service.dart';
import 'package:flutter_formuscine/app/view/widget/overview_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class MovieDetailsView extends StatelessWidget {
  final Movie movie;
  final TMDBDetailsService tmdbDetailsService = TMDBDetailsService();

  MovieDetailsView({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.primaryColor,
      appBar: AppBar(
        title: Text(
          movie.title,
          style: GoogleFonts.mitr(
            textStyle: const TextStyle(
              color: CustomColor.secondaryColor,
            ),
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: CustomColor.secondaryColor),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: tmdbDetailsService.getMovieDetails(movie.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text(
                'Error loading movie details',
                style: TextStyle(color: Colors.black),
              ),
            );
          } else {
            final cast = snapshot.data?['credits']['cast'];
            final posterPath = movie.posterPath;
            final overview = movie.overview;

            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.network(
                      'https://image.tmdb.org/t/p/w500$posterPath',
                      fit: BoxFit.cover,
                      height: 300,
                    ),
                  ),
                  OverviewWidget(overview: overview),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: CustomColor.tertiaryColor,
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'Cast',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 500, // Defina a altura desejada para o GridView
                          child: ListView(
                            children: [
                              GridView.builder(
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisExtent: 50,
                                ),
                                itemCount: cast.length,
                                itemBuilder: (context, index) {
                                  var actor = cast[index];
                                  return Text(
                                    actor['name'],
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.center,
                                  );
                                },
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
