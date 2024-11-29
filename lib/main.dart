import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

class SignUpScreen2 extends StatefulWidget {
  @override
  _SignUpScreen2State createState() => _SignUpScreen2State();
}

class _SignUpScreen2State extends State<SignUpScreen2> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();
  String? selectedRole; // Biến lưu trạng thái vai trò được chọn
  TextEditingController _phoneController =
      TextEditingController(); // Controller cho phone number
  FocusNode _phoneFocusNode =
      FocusNode(); // FocusNode để theo dõi trạng thái focus của ô số điện thoại

  @override
  void initState() {
    super.initState();
    // Lắng nghe sự thay đổi của focus trên ô phone number
    _phoneFocusNode.addListener(() {
      setState(() {}); // Cập nhật giao diện mỗi khi focus thay đổi
    });
  }

  @override
  void dispose() {
    _phoneFocusNode.dispose(); // Đảm bảo giải phóng tài nguyên
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // Điều chỉnh khi bàn phím xuất hiện
      appBar: AppBar(
        titleSpacing: 0,
        title: const Text("Sign Up"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context)
              .unfocus(); // Đóng bàn phím khi nhấn vào vùng trống
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey, // Gắn khóa Form
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "Create an account",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 5),
                const Text(
                  "Please complete your profile",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 5),
                const Text(
                  "Don`t worry. Your data will remain private and only you can see it.",
                  style: TextStyle(fontSize: 10),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: const InputDecoration(labelText: "Full name"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Full name cannot be empty";
                    }
                    return null; // Trả về null nếu hợp lệ
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _controller,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: "Date of Birth"),
                  onChanged: (value) {
                    if (value.length == 2 || value.length == 5) {
                      if (value.endsWith('/')) {
                        _controller.text = "$value/";
                        _controller.selection = TextSelection.collapsed(
                            offset: _controller.text.length);
                      }
                    }
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Date of Birth cannot be empty";
                    }
                    if (!RegExp(r'^\d{2}/\d{2}/\d{4}$').hasMatch(value)) {
                      return "Enter a valid date in DD/MM/YYYY format";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller:
                      _phoneController, // Sử dụng controller cho phone number
                  focusNode: _phoneFocusNode, // Gắn FocusNode vào TextField
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    FilteringTextInputFormatter
                        .digitsOnly, // Chỉ cho phép nhập chữ số
                  ],
                  decoration: InputDecoration(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Phone Number cannot be empty";
                    }
                    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                      return "Phone Number must be numeric";
                    }
                    if (value.length > 12) {
                      // Kiểm tra số điện thoại phải có 12 ký tự (bao gồm +84)
                      return "Phone Number must be 12 digits (+ 8 digits)";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    // Nếu người dùng bắt đầu với '0', thay thế nó bằng '+84'
                    if (value.startsWith('0') && value.length > 1) {
                      _phoneController.text = '+84' + value.substring(1);
                      _phoneController.selection = TextSelection.collapsed(
                          offset: _phoneController.text.length);
                    } else if (value.isNotEmpty && !value.startsWith('0')) {
                      // Nếu không bắt đầu bằng '0', không thay đổi gì
                      _phoneController.text = value;
                      _phoneController.selection = TextSelection.collapsed(
                          offset: _phoneController.text.length);
                    }
                  },
                  onTap: () {
                    setState(() {
                      // Khi người dùng tap vào ô nhập, ẩn phần +84
                    });
                  },
                  onEditingComplete: () {
                    // Sau khi người dùng hoàn tất nhập, nếu nhập số bắt đầu bằng '0', thay thế bằng +84
                    if (_phoneController.text.startsWith('0')) {
                      _phoneController.text =
                          '+84' + _phoneController.text.substring(1);
                      _phoneController.selection = TextSelection.collapsed(
                          offset: _phoneController.text.length);
                    }
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  decoration: const InputDecoration(labelText: "Username"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Username cannot be empty";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: selectedRole == "Student"
                            ? Colors.blue
                            : Colors.grey.shade300,
                        foregroundColor: selectedRole == "Student"
                            ? Colors.white
                            : Colors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          selectedRole = "Student"; // Cập nhật lựa chọn
                        });
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize
                            .min, //Đảm bảo Column không chiếm quá nhiều không gian
                        children: [
                          Icon(
                            Icons.person, //Icon cho "Student"
                            color: selectedRole == "Student"
                                ? Colors.white
                                : Colors.black,
                          ),
                          SizedBox(height: 8),
                          const Text("Student"),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: selectedRole == "Teacher"
                            ? Colors.blue
                            : Colors.grey.shade300,
                        foregroundColor: selectedRole == "Teacher"
                            ? Colors.white
                            : Colors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          selectedRole = "Teacher"; // Cập nhật lựa chọn
                        });
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize
                            .min, //Đảm bảo Column không chiếm quá nhiều không gian
                        children: [
                          Icon(
                            Icons.school,
                            color: selectedRole == "Teacher"
                                ? Colors.white
                                : Colors.black,
                          ),
                          const Text("Teacher"),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Kiểm tra tính hợp lệ của Form
                    if (_formKey.currentState!.validate()) {
                      // Nếu tất cả hợp lệ
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpScreen3(),
                        ),
                      );
                    } else {
                      // Nếu có trường không hợp lệ
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text("Please fill out all fields")),
                      );
                    }
                  },
                  child: const Text("Continue"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
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

  // FocusNode để quản lý focus
  final FocusNode focusNodeNewPassword = FocusNode();
  final FocusNode focusNodeConfirmPassword = FocusNode();

  /// Hàm kiểm tra điều kiện và xác thực mật khẩu
  void _validatePasswords() {
    String password = _newPasswordController.text;
    String confirmPassword = _confirmPasswordController.text;

    // Biểu thức chính quy kiểm tra yêu cầu mật khẩu
    RegExp passwordRegex = RegExp(
        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,}$');

    // Kiểm tra nếu một trong hai trường để trống
    if (password.isEmpty || confirmPassword.isEmpty) {
      _clearBothFields(); // Xóa cả hai trường nhập liệu
      focusNodeNewPassword.requestFocus(); // Focus về ô New Password
      _showSnackBar(
        "Both fields are required.",
        const Color.fromARGB(255, 255, 100, 79),
      );
      return;
    }

    // Kiểm tra mật khẩu chứa dấu cách
    if (password.contains(" ") || confirmPassword.contains(" ")) {
      _clearBothFields(); // Xóa cả hai trường nhập liệu
      focusNodeNewPassword.requestFocus(); // Focus về ô New Password
      _showSnackBar(
        "Password cannot contain spaces.",
        Colors.red,
      );
      return;
    }

    // Kiểm tra điều kiện mật khẩu theo regex
    if (!passwordRegex.hasMatch(password)) {
      _clearBothFields(); // Xóa cả hai trường nhập liệu
      focusNodeNewPassword.requestFocus(); // Focus về ô New Password
      _showSnackBar(
        "Password must be at least 6 characters long, include a number, an uppercase letter, a lowercase letter, and a special character.",
        Colors.orange,
      );
      return;
    }

    // Kiểm tra mật khẩu khớp nhau
    if (password != confirmPassword) {
      _clearBothFields(); // Xóa cả hai trường nhập liệu
      focusNodeNewPassword.requestFocus(); // Focus về ô New Password
      _showSnackBar(
        "Passwords do not match. Please try again.",
        Colors.red,
      );
      return;
    }

    // Nếu mật khẩu hợp lệ
    _showSnackBar(
      "Password updated successfully!",
      Colors.green,
    );
  }

  /// Hàm xóa cả hai trường nhập liệu
  void _clearBothFields() {
    _newPasswordController.clear();
    _confirmPasswordController.clear();
  }

  /// Hàm hiển thị SnackBar
  void _showSnackBar(String message, Color backgroundColor) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height / 10,
          left: 20,
          right: 20,
        ),
        backgroundColor: backgroundColor,
      ),
    );
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
                    Icons.lock,
                    color: const Color.fromARGB(255, 242, 235, 141),
                    size: 38,
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                "Set a new password for your account. Make sure it's secure and easy for you to remember.",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _newPasswordController,
                focusNode: focusNodeNewPassword, // Gắn focus node
                obscureText: !_isNewPassWordVisible,
                inputFormatters: [
                  FilteringTextInputFormatter.deny(
                      RegExp(r'\s')), // Loại bỏ ký tự khoảng trắng
                ],
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
                focusNode: focusNodeConfirmPassword, // Gắn focus node
                obscureText: !_isConfirmPasswordVisible,
                inputFormatters: [
                  FilteringTextInputFormatter.deny(
                      RegExp(r'\s')), // Loại bỏ ký tự khoảng trắng
                ],
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
                  child: Text(
                    "Save New Password",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
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
