import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:time_tracker_app/services/auth.dart';


class SignInBloc{
  SignInBloc({required this.auth});
  final AuthBase auth;
  final StreamController<bool> _isLoadingController = StreamController<bool>();
  Stream<bool> get isLoadingStream => _isLoadingController.stream;

  void dispose(){
    _isLoadingController.close();
  }

  void setIsLoading(bool isLoading) => _isLoadingController.add(isLoading);


  Future<User?> signInAnonymously()  async{
    try{
      setIsLoading(true);
     return await auth.signInAnonymously();
      // onSignIn!(user);
    }catch(e){
     rethrow;
    }finally{
      setIsLoading(false);
    }
  }
}