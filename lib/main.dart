import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'myapp',
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Lets Code Together",
          ),
        ),
        body: Forms(),
      ),
    );
  }
}

class Forms extends StatefulWidget {
  @override
  _FormsState createState() => _FormsState();
}

class _FormsState extends State<Forms> {
  final keys = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: keys,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            decoration: InputDecoration(
              hintText: "Enter Username",
              labelText: "Name",
              icon: Icon(Icons.person),
            ),
            validator: (value){
              if(value!.isEmpty){
                return 'Please enter your name';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: "Enter Password",
              labelText: "Password",
              icon: Icon(Icons.lock),
            ),
            validator: (value){
              if(value!.isEmpty){
                return 'Please enter the password';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: "Confirm Password",
              labelText: "Confirm Password",
              icon: Icon(Icons.lock),
            ),
            validator: (value){
              if(value!.isEmpty){
                return 'Please confirm the password';
              }
              return null;
            },
          ),
          Container(
            child: RaisedButton(
              onPressed: (){
                if(keys.currentState!.validate()){
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
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
