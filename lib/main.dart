import 'package:flutter/material.dart';
import 'package:weza_app/chosen_image_screen/image_instructions_screen.dart';
import 'package:weza_app/core/usable.dart';
import 'package:weza_app/homePage/home_page.dart';
import 'package:weza_app/record_audioScreen/record_audio_screen.dart';
import 'package:weza_app/record_audio_instructionsScreen/record_audio_instructions_screen.dart';
import 'package:weza_app/videoInstructionScreen/video_instructions_screen.dart';
import 'package:weza_app/welcome_screen/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/':(context) => const WelcomeScreen(),
        '/homepage':(context) => const HomePage(),
        '/ImageIns' : (context) => const ImageInstructionsScreen(),
        '/RecordaudioIns':(context) => const RecordAudioInstructionsScreen(),
        '/RecordAudioScreen':(context) => const RecordAudioScreen(),
        '/VideoIns':(context) => const VideoInstructionsScreen(),
        
        },
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Usable.color!),
        useMaterial3: true,
      ),
      
    );
  }
}

