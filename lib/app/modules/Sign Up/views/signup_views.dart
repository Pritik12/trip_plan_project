import 'package:flutter/material.dart';
import 'package:jotrip/app/modules/sign_in/sign_in_screen.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        // Dismiss the keyboard when tapping outside a TextField
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset:
            false, // Prevent resizing when the keyboard is shown
        body: Container(
          height: screenHeight,
          width: screenWidth,
          color: const Color.fromRGBO(162, 217, 196, 1.0),
          child: SingleChildScrollView(
            child: Column(children: [
              const SizedBox(
                width: 390,
              ),
              Container(
                margin: const EdgeInsets.only(top: 228),
                height: 724,
                width: screenWidth,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Container(
                      height: 85,
                      width: 85,
                      margin: const EdgeInsets.only(top: 35),
                      child: const CircleAvatar(
                        backgroundImage: NetworkImage(
                          "https://tse1.mm.bing.net/th?id=OIP.xhr_DjXbHe2bRrR3OqBrewHaFj&pid=Api&P=0&h=180",
                        ),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      child: const Text(
                        "Welcome Back",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Color(0XFF32392F),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text(
                        "Please enter your login information!",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 280, top: 40),
                      child: const Text(
                        "Full Name",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: 360,
                      child: TextField(
                        decoration: InputDecoration(
                          fillColor: const Color.fromARGB(255, 246, 247, 249),
                          filled: true,
                          prefixIcon: const Icon(
                            Icons.person_2_outlined,
                            color: Color(0XFFA3A3A3),
                            size: 28,
                          ),
                          hintText: "User Name",
                          hintStyle: const TextStyle(
                            color: Color(0XFFA3A3A3),
                            fontSize: 18,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 300, top: 15),
                      child: const Text(
                        "Email",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    SizedBox(
                      width: 360,
                      child: TextField(
                        decoration: InputDecoration(
                          fillColor: const Color.fromARGB(255, 246, 247, 249),
                          filled: true,
                          prefixIcon: const Icon(
                            Icons.mail_outline_outlined,
                            color: Color(0XFFA3A3A3),
                            size: 28,
                          ),
                          hintText: "Enter Your E mail",
                          hintStyle: const TextStyle(
                            color: Colors.black38,
                            fontSize: 18,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 275, top: 15),
                      child: const Text(
                        "Password",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    SizedBox(
                      width: 360,
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          fillColor: const Color.fromARGB(255, 246, 247, 249),
                          filled: true,
                          prefixIcon: const Icon(
                            Icons.lock_outline,
                            color: Color(0XFFA3A3A3),
                            size: 28,
                          ),
                          hintText: "Create Your Password",
                          hintStyle: const TextStyle(
                            color: Colors.black38,
                            fontSize: 18,
                          ),
                          suffixIcon: const Icon(
                            Icons.remove_red_eye_outlined,
                            color: Colors.black38,
                            size: 28,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    SizedBox(
                      height: 50,
                      width: 450,
                      child: ElevatedButton(
                        onPressed: () {
                          FocusScope.of(context)
                              .unfocus(); // Dismiss the keyboard when button is pressed
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                        ),
                        child: Ink(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Color.fromRGBO(79, 131, 45, 1.0),
                                Color.fromRGBO(123, 162, 97, 1.0),
                                Color.fromRGBO(79, 131, 45, 1.0),
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            child: const Text(
                              "Sign up",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      margin: const EdgeInsets.only(left: 142),
                      child: const Row(
                        children: [
                          Text(
                            "----------",
                            style: TextStyle(fontSize: 24),
                          ),
                          SizedBox(width: 5),
                          Text(
                            "Or",
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(width: 5),
                          Text(
                            "----------",
                            style: TextStyle(fontSize: 24),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      margin: const EdgeInsets.only(left: 100),
                      child: Row(
                        children: [
                          const Text(
                            "Already have an account?",
                            style: TextStyle(fontSize: 16),
                          ),
                          const SizedBox(width: 5),
                          GestureDetector(
                            onTap: () {
                              // Navigate to the LoginView when tapped
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignInScreen()),
                              );
                            },
                            child: const Text(
                              "Sign In",
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0XFF709C53),
                              ),
                            ),
                          ),
                          const SizedBox()
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
