import 'package:flutter/material.dart';
import 'package:time_tracker_app/app/sign_in/email_sign_in_form_bloc_based.dart';
import 'package:time_tracker_app/app/sign_in/email_sign_in_form_stateful.dart';
import 'package:time_tracker_app/services/auth.dart';

class EmailSignInPage extends StatelessWidget {

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('Sign in')),
      body: SingleChildScrollView(
          child: _buildContent(context),
      ),
      backgroundColor: Colors.grey[200],
    );
  }

 Widget _buildContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        child: EmailSignInFormBlocBased.create(context),
      ),
    );
  }
}
