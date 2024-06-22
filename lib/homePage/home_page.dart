import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:weza_app/core/usable.dart';
import 'package:weza_app/homePage/widgets/custom_choice_view.dart';
import 'package:weza_app/videoInstructionScreen/video_instructions_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

File? imagefile;
ImagePicker pickimage = ImagePicker();

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Usable.color,
            title:  const Text(
              'Choose :',
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
               
                Color(0xff659999),
                Color(0xfff4791f)
                // Color.fromARGB(255, 255, 123, 66),
                // Color.fromARGB(255, 255, 136, 84),
                // Colors.amber
              ])),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  CustomChoiceView(
                    containerString: 'Explian your feelings with Video',
                    imageUrl:
                        'https://img.freepik.com/free-photo/man-talking-camera-recording-himself-vlog-working-from-home-young-content-creator_1268-17418.jpg?t=st=1715798754~exp=1715802354~hmac=a19fcd9c1fbe74144569a5d6c37244deff618e8157ae9194dd3c8cd4426d5f38&w=740',
                    title: 'Record a Video ',
                    ontap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const VideoInstructionsScreen()
                          ));
                    },
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  CustomChoiceView(
                    containerString: 'Explian your feelings with Image',
                    imageUrl:
                        'https://img.freepik.com/free-photo/photograph-taking-his-selfies-positive-manner-with-camera_114579-54325.jpg?t=st=1715798883~exp=1715802483~hmac=7a1b77c8b3469d11416fe6cad3a26805e76f9c4c52f8c998f11882580b336f20&w=740',
                    title: 'Take a photo ',
                    ontap: () async {
                      // var img = await pickimage.pickImage(source: ImageSource.gallery);
                      // if(img!=null){
                      //   imagefile =File(img.path);
                      // }
                      // setState(() {

                      // });
                      Navigator.pushNamed(context, '/ImageIns');
                    },
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  imagefile == null
                      ? const SizedBox()
                      : Column(
                          children: [
                            const Text('Chosen Image :'),
                            SizedBox(
                                height: 150,
                                width: 150,
                                child: Image.file(
                                  imagefile!,
                                  fit: BoxFit.fill,
                                )),
                            const SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Usable.color),
                                onPressed: () {
                                  Navigator.pushNamed(context, '/chosenImage');
                                },
                                child: const Text(
                                  'Next',
                                  style: TextStyle(color: Colors.black),
                                ))
                          ],
                        )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
