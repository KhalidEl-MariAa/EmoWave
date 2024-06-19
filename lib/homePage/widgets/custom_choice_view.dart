import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:weza_app/core/usable.dart';

class CustomChoiceView extends StatelessWidget {
  const CustomChoiceView({super.key, required this.imageUrl, required this.title, this.ontap, required this.containerString});
  final String imageUrl;
  final String title;
  final void Function()? ontap;
  final String containerString;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: ontap ,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Container(
              
               height: MediaQuery.sizeOf(context).height*0.22,
               width: MediaQuery.sizeOf(context).width*0.9,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(25),bottomLeft: Radius.circular(25)),
                border: Border.all(color: Colors.grey.withOpacity(0.2),)
              ),
            
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            constraints: BoxConstraints(maxWidth: MediaQuery.sizeOf(context).width*0.9*0.39),
                            child: Text(containerString,style: const TextStyle(fontWeight: FontWeight.w500),)),
                          SizedBox(
                            height: MediaQuery.sizeOf(context).height*0.22,
                            width: MediaQuery.sizeOf(context).width*0.9*0.49,
                            child: CachedNetworkImage(
                              fit: BoxFit.fill,
                              imageUrl: imageUrl,
                            placeholder: (context, url) => CircularProgressIndicator(color: Usable.color,),
                            errorWidget: (context, url, error) => const Icon(Icons.error),),
                          )
                        ],
                      ),
                    ),
          ),
        ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(title,style: const TextStyle(fontSize: 20,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),),
                )
      ],
    );
  }
}