import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SignUpPage1(),
    );
  }
}

class SignUpPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Create an account', style: TextStyle(fontSize: 24)),
            SizedBox(height: 60),
            TextField(
              decoration: InputDecoration(labelText: 'Enter your email'),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                // Navigate to next page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpPage2()),
                );
              },
              child: Text('Continue'),
              style: TextButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.black),
            ),
            SizedBox(height: 20),
            Text('Already have an account? Log in'),
            SizedBox(height: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.g_mobiledata),
                  label: Text('Continue with Google'),
                ),
                SizedBox(width: 10),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.apple),
                  label: Text('Continue with Apple'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SignUpPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Create an account', style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(labelText: 'Full name'),
            ),
            TextField(
              decoration:
                  InputDecoration(labelText: 'Date of birth (DD/MM/YYYY)'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Phone Number'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Username'),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Student'),
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Teacher'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                ),
              ],
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                // Navigate to the next page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpPage3()),
                );
              },
              child: Text('Next'),
              style: TextButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}

class SignUpPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Secure Your Account'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Set a new password', style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            TextField(
              obscureText: true,
              decoration: InputDecoration(labelText: 'New Password'),
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(labelText: 'Confirm New Password'),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                // Handle password saving action
                print('Password saved');
              },
              child: Text('Save New Password'),
              style: TextButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}
