import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weza_app/core/usable.dart';
import 'package:weza_app/record_audioScreen/record_audio_screen.dart';
import 'package:weza_app/record_audioScreen/record_sudio_screen_cubit/cubit/send_image_and_record_cubit.dart';

class RecordAudioInstructionsScreen extends StatelessWidget {
  const RecordAudioInstructionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Usable.color,
            title: const Text(
              'Audio Instructions',
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
                      '''1- You will be presented with three questions, and you will need to answer these questions in just one minute in an audio recording,we know it may seem like a short time, but the questions are simple, so there's no need to worry about it.''',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 17)),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                      '''2- Try to be in a somewhat quiet place without noise where you can be heard clearly.''',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 17)),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                      '''3- Try as much as possible to make the answers reflect your current feelings.''',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 17)),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                      '''4- Avoid using audio recordings that contain noise or unclear sound, as this will negatively affect your results.''',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 17)),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                      '''5- At the start of your audio recording, it will automatically stop after one minute. You can listen to your recording before sending it to us.''',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 17)),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                      '''6- You have one chance to record your answers to ensure that there is no fabrication of emotions by any user and to ensure that you think carefully about what you feel.''',
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
                        onPressed: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BlocProvider(
                                  create: (context) =>
                                      SendImageAndRecordCubit(),
                                  child: const RecordAudioScreen(),
                                ),
                              ));
                        },
                        child: const Text(
                          'Lets Start answering',
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
