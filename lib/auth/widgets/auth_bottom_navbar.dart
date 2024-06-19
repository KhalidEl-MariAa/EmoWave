import 'package:flutter/material.dart';
import 'package:weza_app/core/usable.dart';


class AuthBottomNavBar extends StatelessWidget {
  const AuthBottomNavBar({super.key, this.onTap, required this.currentIndex,});
  final void Function(int)? onTap;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        backgroundColor: Usable.color,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        currentIndex: currentIndex,
        onTap:onTap,
        items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.person_add_alt_1,size: currentIndex==0? 30:20,),
          label: 'Sign Up',     
          ),
           BottomNavigationBarItem(
          icon: Icon(Icons.person,size: currentIndex==1? 30:20,),
          label: 'Log In',     
          )
      ]);
  }
}