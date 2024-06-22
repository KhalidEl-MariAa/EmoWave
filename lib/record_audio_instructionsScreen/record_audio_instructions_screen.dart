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
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
               
                Color(0xff659999),
                Color(0xfff4791f)
                
              ])
        ),
        child: CustomScrollView(
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
                    child: Text(
                        '''1- You will be given three questions to answer in an audio recording within one minute. Although the time may seem brief, the questions are straightforward, so there's no need to worry.''',
                        style:
                            TextStyle(fontWeight: FontWeight.w500, fontSize: 17)),
                  ),
                const SizedBox(height: 12,),
                const Divider(thickness: 1,color: Colors.black,),
                const SizedBox(height: 12,),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
                    child: Text(
                        '''2- Ensure you are in a relatively quiet place free from noise so that you can be heard clearly.''',
                        style:
                            TextStyle(fontWeight: FontWeight.w500, fontSize: 17)),
                  ),
                const SizedBox(height: 12,),
                const Divider(thickness: 1,color: Colors.black,),
                const SizedBox(height: 12,),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
                    child: Text(
                        '''3- Try to ensure your answers genuinely reflect your current feelings as much as possible.''',
                        style:
                            TextStyle(fontWeight: FontWeight.w500, fontSize: 17)),
                  ),
                const SizedBox(height: 12,),
                const Divider(thickness: 1,color: Colors.black,),
                const SizedBox(height: 12,),
                  const Padding(
                    padding:EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
                    child: Text(
                        '''4- Avoid using audio recordings with noise or unclear sound, as this will negatively impact your results.''',
                        style:
                            TextStyle(fontWeight: FontWeight.w500, fontSize: 17)),
                  ),
                const SizedBox(height: 12,),
                const Divider(thickness: 1,color: Colors.black,),
                const SizedBox(height: 12,),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
                    child: Text(
                        '''5- Your audio recording will automatically stop after one minute. You can listen to your recording before sending it to us.''',
                        style:
                            TextStyle(fontWeight: FontWeight.w500, fontSize: 17)),
                  ),
                const SizedBox(height: 12,),
                const Divider(thickness: 1,color: Colors.black,),
                const SizedBox(height: 12,),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
                    child: Text(
                        '''6- You have one opportunity to record your answers. This measure is in place to prevent the fabrication of emotions and to encourage thoughtful consideration of your feelings.''',
                        style:
                            TextStyle(fontWeight: FontWeight.w500, fontSize: 17)),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Center(
                      child: Text(
                    'Thank you for your attention. I hope you have a great experience!',
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
            )
          ],
        ),
      ),
    );
  }
}
