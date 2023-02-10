import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';



class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const LoginPage({Key? key,required this.showRegisterPage}) : super(key:key);

  @override
  State<LoginPage> createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage> {
  // text controller
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();


  Future signIn() async {
    await FirebaseAuth.instance.
    signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
    );
}

  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height:25),
        //greetings
        Text('Hello Again!',
        style:TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24
        )
        ),
                SizedBox(height:10),
        Text("Welcome to App",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24
        ),
        ),
                    SizedBox(height:25),


        //email
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepOrangeAccent),
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: 'Email',
                fillColor: Colors.grey[200],
                filled: true,
                ),
              ),
          ),
                SizedBox(height:10),



        //password
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: TextField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.deepOrangeAccent),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          hintText: 'Password',
                          fillColor: Colors.grey[200],
                          filled: true,
                        ),
                      ),
                    ),
                    SizedBox(height:10),
        //sign in
    Padding(
    padding: const EdgeInsets.symmetric(horizontal: 25.0),
    child:   GestureDetector(
      onTap: signIn,
      child: Container(
        padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.deepOrangeAccent,
        borderRadius: BorderRadius.circular(12),
      ),
        child: Center(
        child: Text(
          "Sign In",
          style: TextStyle(color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18
          ),
        ),
      ),
  ),
    ),
),
                    SizedBox(height:10),

                    //not a member register
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Not a member?',
                          style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                        ),
                        GestureDetector(
                          onTap: widget.showRegisterPage,
                          child: Text(
                            " Register Now",
                            style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                          ),
                        )
                      ],
                    ),
        ],
              ),
            ),
          ),
      ),
    );
  }
}