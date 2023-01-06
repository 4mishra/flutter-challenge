import 'package:challenge/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'src/generate_material_color.dart';

// Gorouter configurations
final _router = GoRouter(
  routes: [
    GoRoute(
      path: 'dashboard',
      name: 'dashboard',
      builder: (context,state) => const Dashboard(),
    )
  ]
);
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = "Demo Challenge";


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        primarySwatch: generateMaterialColor(
          Color(0xff3e4685),
        ),
      ),
      home: Scaffold(
        body: const MyHomePage(),
      )
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // show th password or not
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(100),
            child: CircleAvatar(
              radius: 70,
              backgroundImage: NetworkImage('https://cdn.pixabay.com/photo/2018/03/24/00/36/girl-3255402_960_720.png',),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
                filled: true,
                fillColor: Colors.white,
                labelText: 'User Name',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10,10, 50),
            child: TextField(
              obscureText: _isObscure,
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock),
                // this button toggle the password visibility
                suffixIcon: IconButton(
                  icon: Icon(
                    _isObscure? Icons.visibility: Icons.visibility_off
                  ),
                  onPressed: () {
                    setState(() {
                        _isObscure = !_isObscure ;
                    });
                  }
                ),
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Container(
            height: 50,
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: ElevatedButton(
              child: const Text('Login'),
              onPressed: () {
                print(nameController.text);
                print(passwordController.text);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Dashboard()),
                );
              },
            )
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Column(
              children: [
                Row(
                  children: <Widget>[
                    const Text('Signup'),
                    const Text('Forgot Password')
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                )
              ]
            )
          )
        ],
      )
    );
  }
}
