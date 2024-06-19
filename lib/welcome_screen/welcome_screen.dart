

import 'package:flutter/material.dart';

import 'package:introduction_screen/introduction_screen.dart';
import 'package:weza_app/auth/auth_screen.dart';
import 'package:weza_app/core/usable.dart';



class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  

  
  @override
  Widget build(BuildContext context) {
    
    List<PageViewModel> pages= [
    PageViewModel(
      body: "Lets know more about EmoWave.",
      title: 'Thank you for joining us',
      image: const Image(image: AssetImage('assets/images/wel.jpg')),
      decoration:  const PageDecoration(
        bodyPadding:  EdgeInsets.only(top: 17),
        titleTextStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,fontStyle: FontStyle.italic) ,
        bodyTextStyle: TextStyle(fontSize: 15)), 
    ),
     PageViewModel(
      body: 'We provide you with music & movies recommendations tailored to your mood, ensuring you have a delightful experience with us .',
      title: "Get personalized recommendations ",
      image:  const Image(image: AssetImage('assets/images/rate.jpg',)),
      decoration:  const PageDecoration(
        bodyPadding: EdgeInsets.only(top: 25),
        titleTextStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,fontStyle: FontStyle.italic) ,
        bodyTextStyle:  TextStyle(fontSize: 15))
    ),
    PageViewModel(
      body: 'Discover new songs and movies customized to suit your mood and preferences',
      title: "Enjoy your moment with EmoWave.",
      image: const Image(image: AssetImage('assets/images/list.jpg')),
      decoration:  const PageDecoration(
        bodyPadding: EdgeInsets.only(top: 25),
        titleTextStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,fontStyle: FontStyle.italic) ,
        bodyTextStyle:  TextStyle(fontSize: 15))
    )
  ];

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: IntroductionScreen(
            
            curve: Curves.bounceIn,
            dotsDecorator: DotsDecorator(
              size: const Size(10, 10),
              activeColor: Usable.color),
            globalBackgroundColor: Colors.white,
          pages: pages,
          onDone: (){
            
          },
          done: ElevatedButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const AuthScreen(),));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Usable.color,
              textStyle: const TextStyle(),
              fixedSize: const Size(100, 100),
              
            ),
            child: const Padding(
              padding:  EdgeInsets.only(left:12.0),
              child:  Text('Lets go!',style: TextStyle(color: Colors.white),),
            )
            ,),
          showNextButton: false,
          
          bodyPadding: const EdgeInsets.symmetric(horizontal: 0),
          
        
          ),
        ),
      ),
    );
  }
}