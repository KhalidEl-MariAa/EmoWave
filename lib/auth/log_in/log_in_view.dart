import 'package:flutter/material.dart';
import 'package:weza_app/core/usable.dart';

class LogInView extends StatefulWidget {
  const LogInView({super.key});

  @override
  State<LogInView> createState() => _LogInViewState();
}
bool isseen=false;
class _LogInViewState extends State<LogInView> {
  @override
  Widget build(BuildContext context) {
    return   CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
          //------------------------------------------------------------------------------------------------
          
              Image.asset('assets/images/logo.png',fit: BoxFit.cover,),
          //-----------------------------------------------------------------------------------------------
          
          const Padding(
            padding: EdgeInsets.only(left: 7),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('log in:',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 26),)),
          ),
          //------------------------------------------------------------------------------------------------
          
          const SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7.0),
            child: TextFormField(
              
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.email),
              hintText: 'Email',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(25))
            ),
            ),
          ),
          //---------------------------------------------------------------------------------------
          
          
          //--------------------------------------------------------------------------------------------
          
          //---------------------------------------------------------------------------------------------------
          
          //---------------------------------------------------------------------------------------------------------
          
          const SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7.0),
            child: TextFormField(
              obscureText: isseen,
              keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(
              suffix: GestureDetector(
                onTap: () {
                  isseen=!isseen;
                  setState(() {
                    
                  });
                },
                child: Icon(isseen?Icons.visibility:Icons.visibility_off),
              ),
              prefixIcon: const Icon(Icons.password),
              hintText: 'Password',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(25),)
            ),
            ),
          ),
          //--------------------------------------------------------------------------
          
          //------------------------------------------------------------------------------------------------
              const SizedBox(height: 10,),
              ElevatedButton(
                onPressed: () {
                Navigator.pushReplacementNamed(context, '/homepage');
              },
              style: ElevatedButton.styleFrom(backgroundColor: Usable.color), 
              child: const Text('Log In',style: TextStyle(color: Colors.white),),)
            ],
          ),
        )
      ],
    );
  }
}