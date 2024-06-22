import 'package:flutter/material.dart';
import 'package:weza_app/auth/log_in/log_in_view.dart';
import 'package:weza_app/auth/sign_up/sign_up_view.dart';
import 'package:weza_app/auth/widgets/auth_bottom_navbar.dart';


class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}
int indx = 0;
List pages =const [SignUpView(),LogInView()];
class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:Container( 
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
               
                Color(0xff659999),
                Color(0xfff4791f)
                
              ])),
        
        child:pages[indx]) ,
      bottomNavigationBar: AuthBottomNavBar(currentIndex: indx,onTap: (p0) {
        indx=p0;
        setState(() {
          
        });
              },),
    );
  }
}