// ignore_for_file: use_build_context_synchronously, avoid_single_cascade_in_expression_statements, unnecessary_const, non_constant_identifier_names

import 'dart:async';

import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:path_provider/path_provider.dart';

import 'package:permission_handler/permission_handler.dart';
import 'package:ripple_wave/ripple_wave.dart';
import 'package:weza_app/chosen_image_screen/image_instructions_screen.dart';

import 'package:weza_app/core/usable.dart';
import 'package:weza_app/recomended_songs_movies_from_image_Screen/recom_movies/recomended_movies_from_image_Screen.dart';
import 'package:weza_app/recomended_songs_movies_from_image_Screen/recom_songs/reco_songs.dart';
import 'package:weza_app/record_audioScreen/record_sudio_screen_cubit/cubit/send_image_and_record_cubit.dart';

class RecordAudioScreen extends StatefulWidget {
  const RecordAudioScreen({super.key});

  @override
  State<RecordAudioScreen> createState() => _RecordAudioScreenState();
}

Timer? xtimer;
Timer? xtimer2;
int start = 60;
double sliVal = 0;
bool isrecorded = false;
final recorder = FlutterSoundRecorder();
final player = FlutterSoundPlayer();
File? rec1;
String? rec1path;
bool is_responsed = false;

bool recordfinish = false;
bool isplayedClick = false;

class _RecordAudioScreenState extends State<RecordAudioScreen> {
  void initRec() async {
    final status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {
    } else {
      await recorder.openRecorder();
      await player.openPlayer();
    }
  }

  void initTimer() {
    xtimer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (start == 0) {
        xtimer!.cancel();
      } else {
        setState(() {
          start--;
        });
      }
    });
  }

  void initTimerforslider() {
    xtimer2 = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (sliVal == 60) {
        setState(() {
          isplayedClick=false;
        });
        xtimer2!.cancel();
      } else {
        setState(() {
          sliVal = sliVal + 1;
          isplayedClick = true;
        });
      }
    });
  }

  @override
  void initState() {
    initRec();
    
    super.initState();
  }

  @override
  void dispose() {
    // record.cancel();
    recorder.openRecorder();
    player.openPlayer();
    if(isplayedClick){
      player.stopPlayer();
    }
    

    super.dispose();
  }

  Future<String> getFilePath() async {
    final directory = await getApplicationDocumentsDirectory();
    return '${directory.path}/audio_record.wav';
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false, 
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              centerTitle: true,
              backgroundColor: Usable.color,
              title: Text(
                is_responsed ? 'Choose' : 'Questions',
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
                child: BlocConsumer<SendImageAndRecordCubit,
                    SendImageAndRecordState>(
                  listener: (context, state) {
                    if (state is SendImageAndRecordSucess) {
                      setState(() {
                        is_responsed = true;
                      });
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.success,
                        animType: AnimType.rightSlide,
                        title: 'Great!',
                        desc:
                            'The Recommendition Process has been done successfuly, enjoy.',
                        btnOkColor: Usable.color,
                        btnOkOnPress: () {},
                      )..show();
                    }
                  },
                  builder: (context, state) {
                    if (state is SendImageAndRecordFailure) {
                      return Center(
                        child: Column(
                          children: [
                            Text(state.erroemsg),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Usable.color),
                                onPressed: () async {
                                  if (rec1path != null) {
                                    BlocProvider.of<SendImageAndRecordCubit>(
                                            context)
                                        .addImageAndRecordToGetTheRecommends(
                                            imagePath: imagefile!.path,
                                            audioPath: rec1path!);
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                'One of Image or record are Null')));
                                  }
                                },
                                child: const Text(
                                  'Try Again',
                                  style: TextStyle(color: Colors.white),
                                ))
                          ],
                        ),
                      );
                    } else if (state is SendImageAndRecordInitial) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          const Text('''Q1- How was your day? 
(Summary what you did and what you felt)''',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 17)),
                          const SizedBox(
                            height: 25,
                          ),
                          const Text(
                              '''Q2- How would you describe your tasks today and how you felt when you finished it?''',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 17)),
                          const SizedBox(
                            height: 25,
                          ),
                          const Text(
                              '''Q3- Have you accomplished what you planned?.''',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 17)),
      
                          const SizedBox(
                            height: 25,
                          ),
                          const Center(
                              child: Text(
                            'Read the questions carefully, prepare your answers, then start answering.',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                          const SizedBox(
                            height: 120,
                          ),
                          //--------------------------------------------------------------
                          isrecorded
                              ? Center(
                                  child: Text(
                                    '$start',
                                    style: const TextStyle(fontSize: 48),
                                  ),
                                )
                              : const SizedBox(),
                          //------------------------------------------------------------------------------
                          isrecorded
                              ? const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 120.0),
                                  child: RippleWave(
                                      color: Color(0xffF67D48),
                                      child: Icon(Icons.mic_none_sharp)),
                                )
                              : const SizedBox(),
      
                          //  isrecorded?MusicVisualizer(
                          //               barCount: 30,
                          //               colors: [Color(0xffF67D48),Color(0xffF67D48),Color(0xffF67D48),Color(0xffF67D48)],
                          //               duration: [900, 700, 600, 800, 500],):SizedBox(),
      
                          recordfinish
                              ? const SizedBox()
                              : Center(
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Usable.color),
                                      onPressed: () async {
                                        setState(() {
                                          isrecorded = true;
                                        });
                                        try {
                                          rec1path = await getFilePath();
                                          await recorder.startRecorder(
                                            toFile: rec1path,
                                            codec: Codec.pcm16WAV,
                                          );
      
                                          start = 60;
                                          Future.delayed(
                                            const Duration(minutes: 1),
                                            () async {
                                              await recorder.stopRecorder();
      
                                              setState(() {
                                                recordfinish = true;
                                                isrecorded = false;
                                              });
                                              rec1 = File(rec1path!);
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(const SnackBar(
                                                      content: Text(
                                                          'Thats great work!')));
                                            },
                                          );
      
                                          initTimer();
                                        } catch (e) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                                  content: Text(
                                                      'Finish this record first')));
                                        }
                                      },
                                      child: const Text(
                                        'Start Recording',
                                        style: TextStyle(color: Colors.white),
                                      )),
                                ),
                          //-----------------------------------------------------------------------------------------------
      
                          //--------------------------------------------------------------------------------------------------------------------------------------------
      
                          isplayedClick
                              ? const SizedBox()
                              : Center(
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Usable.color),
                                      onPressed: () async {
                                        if (rec1 != null) {
                                          setState(() {
                                            sliVal = 0;
                                          });
      
                                          await player.startPlayer(
                                              fromURI: rec1path,
                                              codec: Codec.pcm16WAV);
                                          initTimerforslider();
                                          setState(() {
                                            isplayedClick=false;
                                          });
                                          
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                                  content: Text('Record first')));
                                        }
                                      },
                                      child: const Text(
                                        'Play my Answer',
                                        style: TextStyle(color: Colors.white),
                                      )),
                                ),
                          //--------------------------------------------------------------------------------------------------------------
      
                          recordfinish
                              ? IgnorePointer(
                                  child: Slider(
                                    thumbColor: Usable.color,
                                    activeColor: Usable.color,
                                    min: 0,
                                    max: 60,
                                    value: sliVal,
                                    onChanged: (value) {},
                                  ),
                                )
                              : const SizedBox(),
      
                          //-----------------------------------------------------------------------------------------------------------------------
      
                          
                          recordfinish
                              ? Center(
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Usable.color),
                                      onPressed: () async {
                                        if (rec1path != null && isplayedClick==false) {
                                          BlocProvider.of<
                                                      SendImageAndRecordCubit>(
                                                  context)
                                              .addImageAndRecordToGetTheRecommends(
                                                  imagePath: imagefile!.path,
                                                  audioPath: rec1path!);
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                                  content: Text(
                                                      'If record are playing listen to it first if its not then Image or record can be Null')));
                                        }
                                      },
                                      child: const Text(
                                        'Start recommending',
                                        style: TextStyle(color: Colors.white),
                                      )),
                                )
                              : const SizedBox()
                        ],
                      );
                    } else if (state is SendImageAndRecordSucess) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        RecomendedMoviesFromImageScreen(
                                            movies: state.recommendedMovies),
                                  ));
                            },
                            child: Container(
                              height: MediaQuery.sizeOf(context).height*0.25,
                              decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(25)),
                              child:const Center(
                                child: const Text(
                                  'Movies',
                                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        RecomendedSongsFromImageScreen(
                                            songs: state.recommendedSongs),
                                  ));
                            },
                            child: Container(
                              height: MediaQuery.sizeOf(context).height*0.25,
                              decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(25)),
                              child: const Center(
                                child: Text(
                                  'Songs',
                                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),
                                ),
                              ),
                            ),
                          )
                        ],
                      );
                    } else {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          LoadingAnimationWidget.beat(
                              color: const Color(0xffF67D48), size: 60),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'This will take few minutes, please wait',
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      );
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
