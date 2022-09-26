
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker_app/app/sign_in/email_sign_in_page.dart';
import 'package:time_tracker_app/app/sign_in/sign_in_bloc.dart';
import 'package:time_tracker_app/app/sign_in/sign_in_button.dart';
import 'package:time_tracker_app/app/sign_in/social_sign_in_button.dart';
import 'package:time_tracker_app/common_widgets/show_exception_alert_dialog.dart';
import 'package:time_tracker_app/services/auth.dart';

class SignInPage extends StatelessWidget {
  SignInPage({Key? key, required this.bloc}) : super(key: key);

  final SignInBloc bloc;

  static Widget create(BuildContext context) {
    final auth = Provider.of<AuthBase>(context);
    return Provider<SignInBloc>(
        create: (_)=> SignInBloc(auth: auth),
        dispose: (_,bloc) => bloc.dispose(),
        child: Consumer<SignInBloc>(
            builder: (_,bloc,__) => SignInPage(bloc: bloc),
            ),
    );
  }
    void _showSignInError(BuildContext context, Exception exception){

    if(exception is FirebaseException && exception.code == 'ERROR_ABORTED_BY_USER'){
      return;
    }
      showExceptionAlertDialog(
          context,
          title: 'Sign in failed',
          exception: exception);
    }

  // final void Function(User?)? onSignIn;
  Future<void> _signInAnonymously(BuildContext context)  async{
    try{
      await bloc.signInAnonymously();
    }on Exception catch(e){
      print(e.toString());
      _showSignInError(context, e);
    }
  }

  void _signInWithEmail(BuildContext context){
    // Todo : Show EmailSignInpage
    Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
          builder: (context) => EmailSignInPage())
    );
  }

  @override
  Widget build(BuildContext context) {
      final bloc = Provider.of<SignInBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Time Tracker'),
        elevation: 2.0,
      ),
      body: StreamBuilder<bool>(
          stream: bloc.isLoadingStream,
          initialData: false,
          builder: (context,snapshot){
            return _buildContent(context, snapshot.data!);
          },
          ),
      backgroundColor: Colors.grey[200],
    );
  }

  Widget _buildContent(BuildContext context, bool isLoading) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         SizedBox(
             height: 50.0,
             child: _buildHeader(isLoading)),
         const SizedBox(height: 48.0,),
         SocialSignInButton(
              imageUri: 'images/google-logo.png',
             text: 'Sign in with Google',
             textColor: Colors.black87,
             color: Colors.white,
             onPressed: isLoading ? null : (){}
         ),
         const SizedBox(
            height: 8.0,
          ),
          SocialSignInButton(
              imageUri: 'images/facebook-logo.png',
              text: 'Sign in with facebook',
              textColor: Colors.white,
              color: Color(0xFF334D92),
              onPressed: isLoading ?  null : (){}
          ),
          const SizedBox(
            height: 8.0,
          ),
          SignInButton(
            text: 'Sign in with email',
            color: Colors.teal[700],
            texColor: Colors.white,
            onPressed: isLoading ? null : (){
              _signInWithEmail(context);
            },
          ) ,
         const SizedBox(
            height: 8.0,
          ),
         const Text(
            'or',textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14.0,color: Colors.black87),
          ),
         const SizedBox(
            height: 8.0,
          ),
          SignInButton(
              text: 'Go anonymous',
              texColor: Colors.black,
              color: Colors.lime[300],
              onPressed: isLoading ? null :(){
                _signInAnonymously(context);

              })

        ],
      ),
    );
  }

  Widget _buildHeader(bool isLoading) {
      if(isLoading){
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      return Text('Sign in',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w600),);

  }

  void _signInWithGoogle(){
    // TODO: Auth with Google
  }
}


