import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'authprovider.dart'; 
import 'screens/login.dart'; 


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: MaterialApp(
        title: 'Authentication using dummyjson',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Consumer<AuthProvider>(
          builder: (context, auth, _) => auth.token == null ? LoginScreen() : Scaffold(
            appBar: AppBar(
              title: Text('Welcome'),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('You are logged in!'),
                  
                ],
              ),
            ),
          )
        ),
      ),
    );
  }
}
