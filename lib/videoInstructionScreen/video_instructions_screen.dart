import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weza_app/chosen_video_screen/chosen_video_screen.dart';
import 'package:weza_app/chosen_video_screen/cubit/send_video_cubit.dart';
import 'package:weza_app/core/usable.dart';

class VideoInstructionsScreen extends StatelessWidget {
  const VideoInstructionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: true,
            backgroundColor: Usable.color,
            title: const Text(
              'Instructions',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                      '''1- Try to be in a place with good lighting where you can see clearly.''',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 17)),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                      '''2- Try to take a Video that shows entire face clearly.''',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 17)),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                      '''3- Try as much as possible to make the Video reflect your current feelings.''',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 17)),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                      '''4- Avoid using blurry and low-quality Videos.''',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 17)),
                  const SizedBox(
                    height: 15,
                  ),
                  const Center(
                      child: Text(
                    'Thank you for reading, I wish you an excellent experience!',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
                  const SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Usable.color),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BlocProvider(
                                  create: (context) => SendVideoCubit(),
                                  child: const ChodenVideoScreen(),
                                ),
                              ));
                        },
                        child: const Text(
                          'Lets Start taking video',
                          style: TextStyle(color: Colors.white),
                        )),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
