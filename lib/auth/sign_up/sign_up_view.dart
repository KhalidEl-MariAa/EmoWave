import 'package:flutter/material.dart';

import 'package:weza_app/core/usable.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}
bool isseen=true;
class _SignUpViewState extends State<SignUpView> {
  @override
  Widget build(BuildContext context) {
    return  CustomScrollView(
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
              child: Text('Registration:',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 26),)),
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
          
          const SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7.0),
            child: TextFormField(
              keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.phone_iphone_rounded),
              hintText: 'Phone Number',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(25))
            ),
            ),
          ),
          
          //--------------------------------------------------------------------------------------------
          
          const SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7.0),
            child: TextFormField(
              keyboardType: TextInputType.number,
            decoration: InputDecoration(
              
              hintText: 'Age',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(25),)
            ),
            ),
          ),
          //---------------------------------------------------------------------------------------------------
          
          const SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7.0),
            child: DropdownButtonFormField(
              decoration: InputDecoration(
                labelText: 'Gender',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25)
                )
              ),
              items: const [
                 DropdownMenuItem(value: 'Male',child: Text('Male')),DropdownMenuItem(value: 'Female',child: Text('Female'))] ,
             onChanged: (value) {
              
            },),
          ),
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
              hintText: 'Confirm Password',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(25),)
            ),
            ),
          ),
          //------------------------------------------------------------------------------------------------
              const SizedBox(height: 10,),
              ElevatedButton(
                onPressed: () {
                Navigator.pushReplacementNamed(context, '/homepage');
              },
              style: ElevatedButton.styleFrom(backgroundColor: Usable.color), 
              child: const Text('Sign Up',style: TextStyle(color: Colors.white),),)
            ],
          ),
        )
      ],
    );
  }
}