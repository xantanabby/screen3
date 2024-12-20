import 'package:flutter/material.dart';
import 'dart:async';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late Timer _timer;
  int _timeRemaining = 3600; // 1 hour in seconds
  String _selectedOption = "";

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_timeRemaining > 0) {
        setState(() {
          _timeRemaining--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  String _formatTime(int seconds) {
    int hours = seconds ~/ 3600;
    int minutes = (seconds % 3600) ~/ 60;
    int secs = seconds % 60;
    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 125, 201, 236),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Timer Display
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade400,
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Text(
                'Time remaining\n${_formatTime(_timeRemaining)}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 0),

            // Question Section with Background
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade400,
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 180,
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: Colors.blue[800],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        alignment: Alignment(-0.9, -0.75),
                        child: Text(
                          'Question 01/20',
                          style: TextStyle(
                              color: const Color.fromARGB(255, 255, 255, 121),
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              shadows: [
                                Shadow(
                                  offset: Offset(3, 3),
                                  blurRadius: 6.0,
                                  color: Colors.black.withOpacity(0.5),
                                ),
                              ],
                              fontFamily: 'Roboto'),
                        ),
                      ),
                      Positioned(
                        top: 5, // Khoảng cách từ viền trên
                        right: 30, // Khoảng cách từ viền phải
                        child: Icon(
                          Icons.bookmark,
                          color: const Color.fromARGB(
                              255, 230, 230, 230), // Màu icon
                          size: 34, // Kích thước icon
                        ),
                      ),
                      Container(
                        height: 170,
                        padding: EdgeInsets.all(15),
                        margin:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 60),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade400,
                              blurRadius: 5,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10),
                            Text(
                              '1. Giải phương trình bậc hai sau đây:\n    x² - 5x + 6 = 0',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  // Answer Options
                  Column(
                    children: [
                      _buildOption('A. x = 2 hoặc x = 3'),
                      _buildOption('B. x = -2 hoặc x = 3'),
                      _buildOption('C. x = -2 hoặc x = -3'),
                      _buildOption('D. x = 2 hoặc x = -3'),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            // Navigation Buttons
            Container(
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                // Màu nền
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ), // Bo góc trên
              ),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween, // Căn chỉnh đều
                children: [
                  // Icon bên trái
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back, // Mũi tên trái
                      color: const Color.fromARGB(255, 35, 121, 192),
                      size: 60,
                    ),
                    onPressed: () {
                      // Xử lý sự kiện khi nhấn nút
                    },
                  ),

                  // Icon chính giữa
                  IconButton(
                    icon: Icon(
                      Icons.apps, // Icon dạng lưới
                      color: Colors.black,
                      size: 60,
                    ),
                    onPressed: () {
                      // Xử lý sự kiện khi nhấn nút
                    },
                  ),

                  // Icon bên phải

                  IconButton(
                    icon: Icon(
                      Icons.arrow_forward, // Mũi tên phải
                      color: const Color.fromARGB(255, 35, 121, 192),
                      size: 60,
                    ),
                    onPressed: () {
                      // Xử lý sự kiện khi nhấn nút
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildOption(String text) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedOption = text;
        });
      },
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(vertical: 6, horizontal: 30),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: _selectedOption == text ? Colors.purple[100] : Colors.white,
          border: Border.all(color: Colors.purple, width: 2),
          borderRadius: BorderRadius.circular(20),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
