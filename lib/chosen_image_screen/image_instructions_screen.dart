import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:weza_app/core/usable.dart';

class ImageInstructionsScreen extends StatefulWidget {
  const ImageInstructionsScreen({super.key});

  @override
  State<ImageInstructionsScreen> createState() => _ImageInstructionsScreenState();
}
File? imagefile;
ImagePicker pickimage = ImagePicker();
class _ImageInstructionsScreenState extends State<ImageInstructionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(backgroundColor: Usable.color,
          title: const Text('Instructions for better results',style: TextStyle(fontWeight: FontWeight.w600),),),
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
              ])
              ),
              child: Column(
                
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 15,),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0,),
                    child: Text('''1- Ensure you are in a well-lit area where visibility is clear.'''
                    ,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 17)),
                  ),
                  const SizedBox(height: 12,),
                  const Divider(thickness: 1,color: Colors.black,),
                  const SizedBox(height: 12,),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0,),
                    child: Text('''2- Try to take a picture that shows your entire face clearly.'''
                    ,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 17)),
                  ),
                  const SizedBox(height: 12,),
                  const Divider(thickness: 1,color: Colors.black,),
                  const SizedBox(height: 12,),
                  const Padding(
                    padding:EdgeInsets.symmetric(horizontal: 10.0,),
                    child: Text('''3- Strive to capture the image in a way that reflects your current emotions as accurately as possible.'''
                    ,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 17)),
                  ),
                  const SizedBox(height: 12,),
                  const Divider(thickness: 1,color: Colors.black,),
                  const SizedBox(height: 12,),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0,),
                    child: Text('''4- Avoid using blurry and low-quality photos.'''
                    ,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 17)),
                  ),
                  const SizedBox(height: 12,),
                  const Divider(thickness: 1,color: Colors.black,),
                  const SizedBox(height: 12,),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0,),
                    child: Text('''5- After taking the picture, you will proceed to answer a series of questions. Detailed instructions will be provided, so there's no need to worry.'''
                     ,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 17)
                     ),
                  ),
                            
                   const SizedBox(height: 25,),
                  const Center(child: Text('Thank you for reading. I hope you have an excellent experience!',textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),)),
                  const SizedBox(height: 15,),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Usable.color),
                      onPressed: () async {
                  var img = await pickimage.pickImage(source: ImageSource.camera,preferredCameraDevice: CameraDevice.front);
                  if(img!=null){
                    imagefile =File(img.path);
                  }
                  setState(() {
                    
                  });
                    }, child: const Text('Lets Start taking picture',style: TextStyle(color: Colors.white),)),
                    
                  ),
              //------------------------------------------------------------------------------------------------------------
                            
                  imagefile==null?const SizedBox():const SizedBox(height: 15,),
                  imagefile==null?const SizedBox():
                  Center(
                    child: Column(
                      children: [
                        const Text('Great Work! here is your picture',
                        style: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.w500),),
                        const SizedBox(height: 10,),
                        SizedBox(
                          height: 150,
                          width: 150,
                          child: Image.file(imagefile!)),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: Usable.color),
                          onPressed: () {
                          Navigator.pushNamed(context, '/RecordaudioIns');
                        }, child: const Text('Continue',style: TextStyle(color: Colors.white),)),
                    
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: Usable.color),
                          onPressed: () async {
                          var img = await pickimage.pickImage(source: ImageSource.camera,preferredCameraDevice: CameraDevice.rear);
                  if(img!=null){
                    imagefile =File(img.path);
                  }
                  setState(() {
                    
                  });
                        }, child: const Text('Take another one',style: TextStyle(color: Colors.white),))
                      ],
                    ),
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