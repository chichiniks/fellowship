import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key:key);

  @override
  State<LoginPage> createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
          child: Center(
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
            child: Container(
              decoration: BoxDecoration(
              color: Colors.grey[200],
              border:Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Email",

                  ),
                ),
              ),
            ),
          ),
                  SizedBox(height:10),

        //password
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border:Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Password",

                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height:10),
        //sign in
    Padding(
    padding: const EdgeInsets.symmetric(horizontal: 25.0),
    child:   Container(
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
                  SizedBox(height:10),

                  //not a member register
                  Row(
                    children: [
                      Text('Not a member?',
                        style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                      ),
                      Text(
                        " Register Now",
                        style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                      )
                    ],
                  ),
        ],
            ),
          ),
      ),
    );
  }
}