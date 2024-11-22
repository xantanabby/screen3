import 'package:flutter/material.dart';

void main() {
  runApp(SignUpApp());
}

class SignUpApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SignUpScreen1(),
    );
  }
}

class SignUpScreen1 extends StatefulWidget {
  @override
  _SignUpScreen1State createState() => _SignUpScreen1State();
}

class _SignUpScreen1State extends State<SignUpScreen1> {
  final TextEditingController _emailController = TextEditingController();
  bool _isEmailValid = false;

  void _checkEmailValidity(String email) {
    if (email.endsWith('@gmail.com') ||
        email.endsWith('.edu.vn') ||
        email.endsWith('@yahoo.com')) {
      setState(() {
        _isEmailValid = true;
      });
    } else {
      setState(() {
        _isEmailValid = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Sign up',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.lightBlue,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Log in',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightBlue),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus(); // Bỏ focus, ẩn bàn phím
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "App name",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                "Create an account",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                "Enter your email to sign up for this app",
                style: TextStyle(fontSize: 15),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              TextField(
                controller: _emailController,
                onChanged: _checkEmailValidity,
                decoration: InputDecoration(
                  labelText: "Email@domain.com",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _isEmailValid
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpScreen2()),
                        );
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                ),
                child: Text("Continue"),
              ),
              SizedBox(height: 20),
              Text(
                "You already have an account?",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                "or",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    icon: Icon(Icons.g_mobiledata_rounded),
                    label: Text("Continue with Google"),
                    onPressed: () {},
                  ),
                  SizedBox(width: 10),
                  ElevatedButton.icon(
                    icon: Icon(
                      Icons.apple,
                      color: Colors.black,
                    ),
                    label: Text("Continue with Apple"),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Screen 2: Profile Details
class SignUpScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Sign Up"),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus(); // Bỏ focus, ẩn bàn phím
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Create an account",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Text(
                  "Please complete your profile",
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(labelText: "Full name"),
                ),
                TextField(
                  decoration: InputDecoration(labelText: "Date of Birth"),
                ),
                TextField(
                  decoration: InputDecoration(labelText: "Phone Number"),
                ),
                TextField(
                  decoration: InputDecoration(labelText: "Username"),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("Student"),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("Teacher"),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpScreen3()),
                    );
                  },
                  child: Text("Continue"),
                ),
              ],
            ),
          ),
        ));
  }
}

//screen3
class SignUpScreen3 extends StatefulWidget {
  @override
  _SignUpScreen3State createState() => _SignUpScreen3State();
}

class _SignUpScreen3State extends State<SignUpScreen3> {
  bool _isNewPassWordVisible = false;
  bool _isConfirmPasswordVisible = false;

  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  void _validatePasswords() {
    if (_newPasswordController.text.isEmpty ||
        _confirmPasswordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Both fields are required."),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    if (_newPasswordController.text != _confirmPasswordController.text) {
      _newPasswordController.clear();
      _confirmPasswordController.clear();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Passwords do not match. Please try again."),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Password updated successfully!"),
          backgroundColor: Colors.green,
        ),
      );

      // Thêm logic lưu mật khẩu tại đây nếu cần
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(
                    "Secure Your Account",
                    style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 8),
                  Icon(
                    Icons.lock_open_sharp,
                    color: const Color.fromARGB(255, 242, 235, 141),
                    size: 38,
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                "Set a new password for your account. Make sure it's secure and easy for you to remember.",
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _newPasswordController,
                obscureText: !_isNewPassWordVisible,
                style: TextStyle(
                  fontSize: 24,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.black.withOpacity(0.3),
                  ),
                  labelText: "New Password",
                  border: UnderlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isNewPassWordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isNewPassWordVisible = !_isNewPassWordVisible;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _confirmPasswordController,
                obscureText: !_isConfirmPasswordVisible,
                style: TextStyle(
                  fontSize: 24,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.black.withOpacity(0.3),
                  ),
                  labelText: "Confirm New Password",
                  border: UnderlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isConfirmPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                      });
                    },
                  ),
                ),
              ),
              Spacer(),
              Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  onPressed: _validatePasswords,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                    backgroundColor: const Color.fromARGB(255, 110, 55, 250),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Save New Password",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
