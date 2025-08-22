
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sportspartner/AuthGate.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';

class LogInSignUp extends StatefulWidget {
  const LogInSignUp({super.key});


  @override
  State<LogInSignUp> createState() => _LogInSignUpState();
}

class _LogInSignUpState extends State<LogInSignUp> {
  final auth = AuthGate();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("LogIn or SignUp"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SupaEmailAuth(
              onSignInComplete: (response) { _onSingInComp(response); },
              onSignUpComplete: (response) {  },
              showConfirmPasswordField: true,
              metadataFields: [
                MetaDataField(
                  prefixIcon: const Icon(Icons.person),
                  label: 'Username',
                  key: 'username',
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'Please enter something';
                    }
                    return null;
                  },
                ),
              ],
            ),
            SupaSocialsAuth(
              socialProviders: [
                OAuthProvider.apple,
                OAuthProvider.google,
                OAuthProvider.facebook,
                OAuthProvider.github,
                OAuthProvider.linkedin,
              ],
              socialButtonVariant: SocialButtonVariant.icon,
              colored: true,
              onSuccess: (Session response) {},
              onError: (error) {},
            )
          ],
        ),
      ), // This trailing comma makes auto-formattingFuture<void>er for build methods.
    );
  }

  void _onSingInComp(AuthResponse response) {
    //Navigator.of(context).pushReplacement(
    //  MaterialPageRoute(builder: (_) => const HomeScreen()),
    //);
  }
}