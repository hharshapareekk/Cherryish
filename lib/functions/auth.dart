import 'package:firebase_auth/firebase_auth.dart';

Future<void> signUp(String email, String password) async {
  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }
}

Login(String email , String password) async{
  try{
  UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
  email: "barry.allen@example.com",
  password: "SecretPassword",
  );
} on FirebaseAuthException catch(e) {
  if(e.code == 'weak-password')
  {
    print('password is weak');
  }
  else if(e.code == 'email-already-in-use')
  {
    print('account already exists');
  }
}
catch(e)
{
  print(e);
}
}