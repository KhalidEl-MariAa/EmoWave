// ignore:
// ignore_for_file: file_names, avoid_single_cascade_in_expression_statements

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';


import 'package:url_launcher/url_launcher.dart';
import 'package:weza_app/core/recommended_movie_model.dart';
import 'package:weza_app/core/usable.dart';
import 'package:weza_app/homePage/home_page.dart';
import 'package:weza_app/take_Survey_Screen/take_survey_screen.dart';

class RecomendedMoviesFromImageScreen extends StatelessWidget {
  const RecomendedMoviesFromImageScreen({super.key, required this.movies});
  final List<RecommendedMovie> movies;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Usable.color,
        title: const Text(
          'Movies',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: CustomScrollView(

        slivers: [SliverToBoxAdapter(
          
          child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
               
                Color(0xff659999),
                Color(0xfff4791f)
                // Color.fromARGB(255, 255, 123, 66),
                // Color.fromARGB(255, 255, 136, 84),
                // Colors.amber
              ])
              ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
              child: Column(
                children: [
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    ),
                    itemCount: movies.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => Container(
                      width: MediaQuery.sizeOf(context).width * 0.75,
                      constraints: BoxConstraints(
                          maxWidth: MediaQuery.sizeOf(context).width * 0.65),
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(colors: [ Color(0xff659999),Color(0x0ff1f403)]),
                          ),
                      child: Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Title:',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                            ),
                            Text(
                              movies[index].title,
                              style: const TextStyle(fontSize: 15),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              'Overview:',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                            ),
                            Text(movies[index].overview,
                                style: const TextStyle(fontSize: 15)),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              'Language:',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                            ),
                            Text(Usable.languages[movies[index].language] ,
                                style: const TextStyle(fontSize: 15)),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              'IMDB link:',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                            ),
                            GestureDetector(
                                onTap: () async {
                                  try {
                                    await launchUrl(Uri.parse(movies[index].imdbLink));
                                  } catch (e) {
                                    AwesomeDialog(
                                      // ignore: use_build_context_synchronously
                                      context: context,
                                      dialogType: DialogType.error,
                                      animType: AnimType.rightSlide,
                                      title: 'Error!',
                                      desc: "Sorry, can't get this link $e",
                                      btnCancelOnPress: () {},
                                    )..show();
                                  }
                                },
                                child: Text(
                                  movies[index].imdbLink,
                                  style:
                                      const TextStyle(color: Colors.blue, fontSize: 15),
                                )),
                            
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Usable.color),
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => const TakeSurveyScreen(),));
                                },
                                child: const Text(
                                  'Take survey',
                                  style: TextStyle(
                                      color: Colors.black, fontWeight: FontWeight.w500),
                                )),
                                ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Usable.color),
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage(),));
                                },
                                child: const Text(
                                  'Return to Home',
                                  style: TextStyle(
                                      color: Colors.black, fontWeight: FontWeight.w500),
                                ))
                ],
              ),
            ),
          ),
        ),]
      ),
    ));
  }
}
