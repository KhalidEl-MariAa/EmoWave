import 'package:flutter/material.dart';
import 'package:weza_app/core/usable.dart';

class PageViewModelElement extends StatelessWidget {
  const PageViewModelElement({super.key, required this.questiontitle, required this.questionContent, this.onPressedStartRec, this.onPressedStopRec, this.onPressedPlayRec});
final String questiontitle;
final String questionContent;
final void Function()? onPressedStartRec;
final void Function()? onPressedStopRec;
final void Function()? onPressedPlayRec;
  @override
  Widget build(BuildContext context) {
    return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(questiontitle,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 25)),
                          const SizedBox(height: 10,),
                          Text(questionContent,style: const TextStyle(fontWeight: FontWeight.w600,fontSize: 15),),
                          SizedBox(height: MediaQuery.sizeOf(context).height*0.5*0.5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(backgroundColor: Usable.color),
                              onPressed:onPressedStartRec ,
                              child: const Text('Start Recording',style: TextStyle(color: Colors.black),)),
                            const SizedBox(width: 5,),

                            ElevatedButton(
                              style: ElevatedButton.styleFrom(backgroundColor: Usable.color),
                              onPressed: onPressedStopRec
                              , child: const Text('Stop Recording',style: TextStyle(color: Colors.black)))
                          ],),
                          Center(
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(backgroundColor: Usable.color),
                                onPressed:onPressedPlayRec,
                                 child: const Text('play Record',style: TextStyle(color: Colors.black))),
                          )

                        ]
                      );
  }
}