import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


// UI
class AccountInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Account Information'),),
        body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Write Data to Cloud Firestore',
                    style: TextStyle(fontSize: 20),
                  ),
                  MyCustomForm()
                ]
            )
        )
    );
  }
}

@override
State<StatefulWidget> createState() {
  // TODO: implement createState
  throw UnimplementedError();
}

class MyCustomForm extends StatefulWidget{
  @override
  /*MyCustomFormState createState() {
      return MyCustomFormState();
  }*/
  State<MyCustomForm> createState() => _MyCustomFormState();
}


class _MyCustomFormState extends State<MyCustomForm> {
    final _formKey = GlobalKey<FormState>();
    @override
    Widget build(BuildContext context){
      return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                hintText: "Please Enter Your Name",
                labelText: 'First Name',
              ),
              onChanged: (value) {},
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter some text";
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.date_range),
                hintText: "Please Enter Your Birth Year",
                labelText: 'Birth Year',
              ),
              onChanged: (value) {},
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter some text";
                }
                return null;
              },
            ),
          SizedBox(height: 10),
          Center(
            child: ElevatedButton(
              onPressed: (){
                if (_formKey.currentState!.validate()){
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Sending data to cloud firestore"),
                    ),
                    );
                }
              },
            child: Text("Submit"),
            ),
          ),
        ],
        ),
      );
      }
    }



 // }


/* //from firestore website
var db = FirebaseFirestore.instance;

// create a new user
final user = <String, dynamic> {
  "first name" : "John",
  "last name" : "David",
  "birth year" : 1997
};

// add new document with a generated ID
db.collection("users").add(user).then(DocumentReference doc) =>
    print('DocumentSnapshot added with ID: ${doc.id}'));

// read data
await db.collection("users").get().then((event)) {
  for (var doc in event.docs){
    print("${doc.id} => ${doc.data()}");
  }
}
*/


