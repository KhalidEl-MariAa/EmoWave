// ignore:
// ignore_for_file: file_names, avoid_single_cascade_in_expression_statements

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: unused_import
import 'package:weza_app/core/recommended_movie_model.dart';
import 'package:weza_app/core/song_model.dart';
import 'package:weza_app/core/usable.dart';
import 'package:weza_app/homePage/home_page.dart';
import 'package:weza_app/take_Survey_Screen/take_survey_screen.dart';

class RecomendedSongsFromImageScreen extends StatelessWidget {
  const RecomendedSongsFromImageScreen({super.key, required this.songs});
  final List<SongModel> songs;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Usable.color,
        title: const Text(
          'Songs',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: CustomScrollView(slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
            child: Column(children: [
              ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
                itemCount: songs.length,
                shrinkWrap: true,
                itemBuilder: (context, index) => Container(
                  width: MediaQuery.sizeOf(context).width * 0.75,
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.sizeOf(context).width * 0.65),
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(25)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 5.0, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Song ${index + 1}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 23),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(songs[index].songName),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Usable.color),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TakeSurveyScreen(),
                        ));
                  },
                  child: const Text(
                    'Take survey',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500),
                  )),
              ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Usable.color),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ));
                  },
                  child: const Text(
                    'Return to Home',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500),
                  ))
            ]),
          ),
        ),
      ]),
    ));
  }
}
