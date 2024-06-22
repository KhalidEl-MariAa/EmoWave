import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:video_player/video_player.dart';
import 'package:weza_app/chosen_video_screen/cubit/send_video_cubit.dart';
import 'package:weza_app/core/usable.dart';
import 'package:weza_app/recomended_songs_movies_from_image_Screen/recom_movies/recomended_movies_from_image_Screen.dart';
import 'package:weza_app/recomended_songs_movies_from_image_Screen/recom_songs/reco_songs.dart';

class ChodenVideoScreen extends StatefulWidget {
  const ChodenVideoScreen({super.key});

  @override
  State<ChodenVideoScreen> createState() => _ChodenVideoScreenState();
}

File? videofile;
ImagePicker pickVideo = ImagePicker();
late VideoPlayerController controller;

class _ChodenVideoScreenState extends State<ChodenVideoScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
           decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
               
                Color(0xff659999),
                Color(0xfff4791f)
                // Color.fromARGB(255, 255, 123, 66),
                // Color.fromARGB(255, 255, 136, 84),
                // Colors.amber
              ])
              ),
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                centerTitle: true,
                backgroundColor: Usable.color,
                title: const Text(
                  'Questions',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: BlocConsumer<SendVideoCubit, SendVideoState>(
                  listener: (context, state) {
                    // TODO: implement listener
                  },
                  builder: (context, state) {
                    if (state is SendVideoInitial){
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(
                        horizontal: 10.0,
                      ),
                          child: Text('''Q1- How was your day? ''',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 17)),
                        ),
                        const Center(
                          child: Text('(Summary what you did and what you felt)',style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 17))),
                  const SizedBox(height: 12,),
                  const Divider(thickness: 1,color: Colors.black,),
                  const SizedBox(height: 12,),
                        const Padding(
                          padding: EdgeInsets.symmetric(
                        horizontal: 10.0,
                      ),
                          child: Text(
                              '''Q2- How would you describe your tasks today and how you felt when you finished it?''',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 17)),
                        ),
                  const SizedBox(height: 12,),
                  const Divider(thickness: 1,color: Colors.black,),
                  const SizedBox(height: 12,),
                        const Padding(
                          padding: EdgeInsets.symmetric(
                        horizontal: 10.0,
                      ),
                          child: Text(
                              '''Q3- Have you accomplished what you planned?.''',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 17)),
                        ),
                              
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
                          height: 50,
                        ),
                        //-------------------------------------------------------------------------------------------------------------
                              
                        Center(
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Usable.color),
                              onPressed: () async {
                                var video = await pickVideo.pickVideo(
                                    source: ImageSource.camera,
                                    preferredCameraDevice: CameraDevice.front,maxDuration:const Duration(minutes: 1) );
                                if (video != null) {
                                  videofile = File(video.path);
                                  controller =
                                      VideoPlayerController.file(videofile!)
                                        ..initialize().then(
                                          (_) {
                                            if (mounted) {
                                              controller.play();
                                            }
                                          },
                                        );
                                }
                                setState(() {});
                              },
                              child: const Text(
                                'Lets Start taking video',
                                style: TextStyle(color: Colors.white),
                              )),
                        ),
                        //------------------------------------------------------------------------------------------------------------
                              
                        videofile == null
                            ? const SizedBox()
                            : const SizedBox(
                                height: 15,
                              ),
                        videofile == null
                            ? const SizedBox()
                            : Column(
                                children: [
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      AspectRatio(
                                        aspectRatio: 16 / 9,
                                        child: VideoPlayer(controller),
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            setState(() {
                                              if (controller.value.isPlaying) {
                                                controller.pause();
                                              } else {
                                                controller.play();
                                              }
                                            });
                                          },
                                          icon: controller.value.isPlaying
                                              ? const Icon(
                                                  Icons.pause,
                                                  size: 50,
                                                  color: Colors.white,
                                                )
                                              : const Icon(
                                                  Icons.play_arrow,
                                                  size: 50,
                                                  color: Colors.white,
                                                ))
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Center(
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(backgroundColor: Usable.color),
                                        onPressed: () {
                                          if (videofile != null) {
                                            BlocProvider.of<SendVideoCubit>(
                                                    context)
                                                .addVideoToGetTheRecommends(
                                                    videoPath: videofile!.path);
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(const SnackBar(
                                                    content:
                                                        Text('Video is null')));
                                          }
                                        },
                                        child: const Text(
                                          'Start recommending',
                                          style: TextStyle(color: Colors.white),
                                        )),
                                  )
                                ],
                              )
                      ],
                    );}
                    else if(state is SendVideoSucess){
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
                            height: MediaQuery.sizeOf(context).height * 0.25,
                            decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(25)),
                            child: const Center(
                              child: Text(
                                'Movies',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 25),
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
                            height: MediaQuery.sizeOf(context).height * 0.25,
                            decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(25)),
                            child: const Center(
                              child: Text(
                                'Songs',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 25),
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                    }
                    else if (state is SendVideoFailure){
                      return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(state.errorMsg),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Usable.color),
                                    onPressed: () async {
                                      if (videofile != null) {
                                        BlocProvider.of<SendVideoCubit>(
                                                context)
                                            .addVideoToGetTheRecommends(videoPath: videofile!.path);
                                      } else {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                            const SnackBar(
                                                content: Text(
                                                    'Video are Null')));
                                      }
                                    },
                                    child: const Text(
                                      'Try Again',
                                      style: TextStyle(color: Colors.white),
                                    ))
                      ],
                    );
                    }
                    else{
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
              )
            ],
          ),
        ),
        // body: BlocConsumer<SendVideoCubit, SendVideoState>(
        //   listener: (context, state) {
        //     // TODO: implement listener
        //   },
        //   builder: (context, state) {
        //     if (state is SendVideoInitial) {
        //       return CustomScrollView(
        //         slivers: [
        //           SliverAppBar(
        //             centerTitle: true,
        //             backgroundColor: Usable.color,
        //             title: const Text(
        //               'Questions',
        //               style: TextStyle(fontWeight: FontWeight.w600),
        //             ),
        //           ),
        //           SliverFillRemaining(
        //             hasScrollBody: false,
        //             child: Padding(
        //               padding: const EdgeInsets.symmetric(
        //                 horizontal: 10.0,
        //               ),
        //               child: Column(
        //                 crossAxisAlignment: CrossAxisAlignment.start,
        //                 children: [
        //                   const SizedBox(
        //                     height: 15,
        //                   ),
        //                   const Text('''Q1- How was your day?
        // (Summary what you did and what you felt)''',
        //                       style: TextStyle(
        //                           fontWeight: FontWeight.w500, fontSize: 17)),
        //                   const SizedBox(
        //                     height: 25,
        //                   ),
        //                   const Text(
        //                       '''Q2- How would you describe your tasks today an how you felt when you finished it?''',
        //                       style: TextStyle(
        //                           fontWeight: FontWeight.w500, fontSize: 17)),
        //                   const SizedBox(
        //                     height: 25,
        //                   ),
        //                   const Text(
        //                       '''Q3- Have you accomplished what you planned?.''',
        //                       style: TextStyle(
        //                           fontWeight: FontWeight.w500, fontSize: 17)),

        //                   const SizedBox(
        //                     height: 25,
        //                   ),
        //                   const Center(
        //                       child: Text(
        //                     'Read the questions carefully, prepare your answers, then start answering.',
        //                     textAlign: TextAlign.center,
        //                     style: TextStyle(fontWeight: FontWeight.bold),
        //                   )),
        //                   const SizedBox(
        //                     height: 50,
        //                   ),
        //                   //-------------------------------------------------------------------------------------------------------------

        //                   Center(
        //                     child: ElevatedButton(
        //                         style: ElevatedButton.styleFrom(
        //                             backgroundColor: Usable.color),
        //                         onPressed: () async {
        //                           var video = await pickVideo.pickVideo(
        //                               source: ImageSource.camera,
        //                               preferredCameraDevice: CameraDevice.front);
        //                           if (video != null) {
        //                             videofile = File(video.path);
        //                             controller =
        //                                 VideoPlayerController.file(videofile!)
        //                                   ..initialize().then(
        //                                     (_) {
        //                                       if (mounted) {
        //                                         controller.play();
        //                                       }
        //                                     },
        //                                   );
        //                           }
        //                           setState(() {});
        //                         },
        //                         child: const Text(
        //                           'Lets Start taking video',
        //                           style: TextStyle(color: Colors.white),
        //                         )),
        //                   ),
        //                   //------------------------------------------------------------------------------------------------------------

        //                   videofile == null
        //                       ? const SizedBox()
        //                       : const SizedBox(
        //                           height: 15,
        //                         ),
        //                   videofile == null
        //                       ? const SizedBox()
        //                       : Column(
        //                           children: [
        //                             Stack(
        //                               alignment: Alignment.center,
        //                               children: [
        //                                 AspectRatio(
        //                                   aspectRatio: 16 / 9,
        //                                   child: VideoPlayer(controller),
        //                                 ),
        //                                 IconButton(
        //                                     onPressed: () {
        //                                       setState(() {
        //                                         if (controller.value.isPlaying) {
        //                                           controller.pause();
        //                                         } else {
        //                                           controller.play();
        //                                         }
        //                                       });
        //                                     },
        //                                     icon: controller.value.isPlaying
        //                                         ? const Icon(
        //                                             Icons.pause,
        //                                             size: 50,
        //                                             color: Colors.white,
        //                                           )
        //                                         : const Icon(
        //                                             Icons.play_arrow,
        //                                             size: 50,
        //                                             color: Colors.white,
        //                                           ))
        //                               ],
        //                             ),
        //                             const SizedBox(
        //                               height: 15,
        //                             ),
        //                             Center(
        //                               child: ElevatedButton(
        //                                   onPressed: () {
        //                                     if (videofile != null) {
        //                                       BlocProvider.of<SendVideoCubit>(
        //                                               context)
        //                                           .addVideoToGetTheRecommends(
        //                                               videoPath: videofile!.path);
        //                                     }
        //                                     else{
        //                                       ScaffoldMessenger.of(context)
        //                                         .showSnackBar(const SnackBar(
        //                                             content: Text(
        //                                                 'Video is null')));
        //                                     }
        //                                   },
        //                                   child: const Text(
        //                                     'Start recommending',
        //                                     style: TextStyle(color: Colors.white),
        //                                   )),
        //                             )
        //                           ],
        //                         )
        //                   // Center(
        //                   //   child: Column(
        //                   //     children: [
        //                   //       const Text('Great Work! here is your Video',
        //                   //       style: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.w500),),
        //                   //       const SizedBox(height: 10,),
        //                   //       SizedBox(
        //                   //         height: 150,
        //                   //         width: 150,
        //                   //         child: VideoPlayer(controller)),
        //                   //       ElevatedButton(
        //                   //         style: ElevatedButton.styleFrom(backgroundColor: Usable.color),
        //                   //         onPressed: () {

        //                   //       }, child: const Text('Submit',style: TextStyle(color: Colors.white),)),

        //                   //       ElevatedButton(
        //                   //         style: ElevatedButton.styleFrom(backgroundColor: Usable.color),
        //                   //         onPressed: () async {
        //                   //         var video = await pickVideo.pickVideo(source: ImageSource.camera,preferredCameraDevice: CameraDevice.rear);
        //                   // if(video!=null){
        //                   //   videofile =File(video.path);
        //                   // }
        //                   // setState(() {

        //                   // });
        //                   //       }, child: const Text('Take another one',style: TextStyle(color: Colors.white),))
        //                   //     ],
        //                   //   ),
        //                   // )
        //                 ],
        //               ),
        //             ),
        //           )
        //         ],
        //       );
        //     }
        //     //-----------------------------------------------------------------------------------------------------------------------
            // else if (state is SendVideoSucess) {
            //   return CustomScrollView(slivers: [
            //     SliverAppBar(
            //       centerTitle: true,
            //       backgroundColor: Usable.color,
            //       title: const Text(
            //         'Choose',
            //         style: TextStyle(
            //             fontWeight: FontWeight.w600, color: Colors.black),
            //       ),
            //     ),
            //     SliverFillRemaining(
            //       hasScrollBody: false,
            //       child: Column(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: [
            //           GestureDetector(
            //             onTap: () {
            //               Navigator.push(
            //                   context,
            //                   MaterialPageRoute(
            //                     builder: (context) =>
            //                         RecomendedMoviesFromImageScreen(
            //                             movies: state.recommendedMovies),
            //                   ));
            //             },
            //             child: Container(
            //               height: MediaQuery.sizeOf(context).height * 0.25,
            //               decoration: BoxDecoration(
            //                   color: Colors.amber,
            //                   borderRadius: BorderRadius.circular(25)),
            //               child: const Center(
            //                 child: Text(
            //                   'Movies',
            //                   style: TextStyle(
            //                       fontWeight: FontWeight.bold, fontSize: 25),
            //                 ),
            //               ),
            //             ),
            //           ),
            //           const SizedBox(
            //             height: 20,
            //           ),
            //           GestureDetector(
            //             onTap: () {
            //               Navigator.push(
            //                   context,
            //                   MaterialPageRoute(
            //                     builder: (context) =>
            //                         RecomendedSongsFromImageScreen(
            //                             songs: state.recommendedSongs),
            //                   ));
            //             },
            //             child: Container(
            //               height: MediaQuery.sizeOf(context).height * 0.25,
            //               decoration: BoxDecoration(
            //                   color: Colors.amber,
            //                   borderRadius: BorderRadius.circular(25)),
            //               child: const Center(
            //                 child: Text(
            //                   'Songs',
            //                   style: TextStyle(
            //                       fontWeight: FontWeight.bold, fontSize: 25),
            //                 ),
            //               ),
            //             ),
            //           )
            //         ],
            //       ),
            //     )
            //   ]);
            // }

            // else if (state is SendVideoFailure){
            //  return CustomScrollView(
            //     slivers: [SliverAppBar(
            //       centerTitle: true,
            //       backgroundColor: Usable.color,
            //       title: const Text(
            //         'Error',
            //         style: TextStyle(
            //             fontWeight: FontWeight.w600, color: Colors.black),
            //       ),
            //     ),
            //     SliverFillRemaining(
            //       hasScrollBody: false,
            //       child: Column(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: [
            //           Text(state.errorMsg),
            //                   ElevatedButton(
            //                       style: ElevatedButton.styleFrom(
            //                           backgroundColor: Usable.color),
            //                       onPressed: () async {
            //                         if (videofile != null) {
            //                           BlocProvider.of<SendVideoCubit>(
            //                                   context)
            //                               .addVideoToGetTheRecommends(videoPath: videofile!.path);
            //                         } else {
            //                           ScaffoldMessenger.of(context).showSnackBar(
            //                               const SnackBar(
            //                                   content: Text(
            //                                       'Video are Null')));
            //                         }
            //                       },
            //                       child: const Text(
            //                         'Try Again',
            //                         style: TextStyle(color: Colors.white),
            //                       ))
            //         ],
            //       ),
            //     )],
            //   );
            // }
            // else{
            //   return Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       LoadingAnimationWidget.beat(
            //                     color: const Color(0xffF67D48), size: 60),
            //                 const SizedBox(
            //                   height: 10,
            //                 ),
            //                 const Text(
            //                   'This will take few minutes, please wait',
            //                   style: TextStyle(color: Colors.black),
            //                 )
            //     ],
            //   );
            // }
        //   },
        // ),
      ),
    );
  }
}
