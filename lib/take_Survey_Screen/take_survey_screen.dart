
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:weza_app/core/usable.dart';
import 'package:weza_app/homePage/home_page.dart';

class TakeSurveyScreen extends StatefulWidget {
  const TakeSurveyScreen({super.key});

  @override
  State<TakeSurveyScreen> createState() => _TakeSurveyScreenState();
}
bool ishappychosen=false;
bool issadchosen=false;
bool isnuetralchosen=false;
bool issuprisedchosen=false;
bool isfearchosen=false;

class _TakeSurveyScreenState extends State<TakeSurveyScreen> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
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
            'Survey',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('1- How do you rate the recommended Movies?',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15),),
                const SizedBox(height: 12,),           
                Center(
                  child: RatingBar(
                    allowHalfRating: true,
                    initialRating: 0,
                    glowColor: Usable.color,
                    itemCount: 5,
                    unratedColor: Usable.color,
                    ratingWidget: RatingWidget(
                      
                      full: Icon(Icons.star,color: Usable.color,), half: Icon(Icons.star_half,color: Usable.color,), empty: Icon(Icons.star_border,color: Usable.color,)), 
                  onRatingUpdate: (value) {
                    
                  },),
                ),
                const SizedBox(height: 25,),
                 const Text('2- How do you rate the recommended Songs?',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15),),
                const SizedBox(height: 12,),
                Center(
                  child: RatingBar(
                    allowHalfRating: true,
                    initialRating: 0,
                    glowColor: Usable.color,
                    itemCount: 5,
                    unratedColor: Usable.color,
                    ratingWidget: RatingWidget(
                      
                      full: Icon(Icons.star,color: Usable.color,), half: Icon(Icons.star_half,color: Usable.color,), empty: Icon(Icons.star_border,color: Usable.color,)), 
                  onRatingUpdate: (value) {
                    
                  },),
                ),
            
                const SizedBox(height: 25,),
                const Text('3- Tell us about your feelings all day:',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15),),
                const SizedBox(height: 12,),
                 TextFormField(
                    
                    maxLines: null,
                    decoration: InputDecoration(
                      hintText: 'Show your feelings',
                      focusColor: Usable.color,
                      border: const OutlineInputBorder(),
                      
                    ),
                  ),
                
                const SizedBox(height: 25,),
                const Text('4- What is your overall emotions?:',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15),),
                const SizedBox(height: 12,),
                Center(child: Container(
                  constraints: BoxConstraints(maxWidth: MediaQuery.sizeOf(context).width*0.80),
                  child: Row(
                    
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          ishappychosen=!ishappychosen;
                          setState(() {
                            
                          });
                        },
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: ishappychosen?25:15,foregroundImage:const AssetImage('assets/images/happiness.jpg')),
                              const Text('Happy'),
                              ishappychosen?const Icon(Icons.done,color: Colors.green,size: 25,):const SizedBox()
                          ],
                        ),
                      ),
                      // const SizedBox(width: 10,),
                      GestureDetector(
                        onTap: () {
                          issadchosen=!issadchosen;
                          setState(() {
                            
                          });
                        },
                        child: Column(
                          children: [
                            CircleAvatar(radius: issadchosen?25:15,foregroundImage:const AssetImage('assets/images/sad.png'),),
                            const Text('Sad'),
                            issadchosen?const Icon(Icons.done,color: Colors.green,size: 25,):const SizedBox()
                          ],
                        )),
                      // const SizedBox(width: 10,),
                      GestureDetector(
                        onTap: () {
                          isnuetralchosen=!isnuetralchosen;
                          setState(() {
                            
                          });
                        },
                        child: Column(
                          children: [
                            CircleAvatar(radius: isnuetralchosen? 25:15,foregroundImage:const AssetImage('assets/images/nuetral.png')),
                            const Text('Nuetral'),
                            isnuetralchosen?const Icon(Icons.done,color: Colors.green,size: 25,):const SizedBox()
                          ],
                        )),
                      // const SizedBox(width: 10,),
                      GestureDetector(
                        onTap: () {
                          issuprisedchosen=!issuprisedchosen;
                          setState(() {
                            
                          });
                        },
                        child: Column(
                          children: [
                            CircleAvatar(radius:issuprisedchosen?25:15,foregroundImage:const AssetImage('assets/images/suprised.png'),),
                            const Text('Suprise'),
                            issuprisedchosen?const Icon(Icons.done,color: Colors.green,size: 25,):const SizedBox()
                          ],
                        )),
                      // const SizedBox(width: 10,),
                      GestureDetector(
                        onTap: () {
                          isfearchosen=!isfearchosen;
                          setState(() {
                            
                          });
                        },
                        child: Column(
                          children: [
                            CircleAvatar(radius:isfearchosen?25:15,foregroundImage:const AssetImage('assets/images/feare.jpg'),),
                            const Text('Fear'),
                            isfearchosen?const Icon(Icons.done,color: Colors.green,size: 25,):const SizedBox()
                            
                          ],
                        )),
            
                    ],
                  ),
                ),),
                const SizedBox(height: 50,),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Usable.color
                    ),
                    onPressed: () {
                      
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const HomePage(),), (route) => false);
                        //  AwesomeDialog(
                        //   context: context,
                        //   dialogType: DialogType.success,
                        //   animType: AnimType.rightSlide,
                        //   title: 'Great!',
                        //   desc:
                        //       'The Recommendition Process has been done successfuly, enjoy.',
                        //   btnOkColor: Usable.color,
                        //   btnOkOnPress: () {},
                        // ).show();                  
                    },
                    child: const Text('Submit',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),),
                  ),
                )
              ],
            ),
          ),
        )
          ],
        ),
      ),
    ));
  }
}
