import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker_app/app/home_page.dart';
import 'package:time_tracker_app/app/sign_in/sign_in_page.dart';
import 'package:time_tracker_app/services/auth.dart';
import 'package:time_tracker_app/services/auth_provider.dart';

class LandingPage extends StatelessWidget {

  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context,listen: false);
    return StreamBuilder<User?>(
        stream: auth.authStateChanges(),
        builder: (context,snapshot){
          if(snapshot.connectionState == ConnectionState.active){
            final User? user = snapshot.data as User?;
            if(user == null){
              return SignInPage.create(context);
            }
            return HomePage();
          }
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
   //  if(_user == null){
   //    return SignInPage(
   //      auth: widget.auth,
   //      onSignIn: (user){
   //        updateUser(user);
   //      },
   //    );
   //  }
   // return HomePage(
   //   auth: widget.auth,
   //   onSignOut: (){
   //     updateUser(null);
   //   },
   // );
  }
}
