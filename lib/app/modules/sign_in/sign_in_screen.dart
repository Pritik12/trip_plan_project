import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jotrip/app/modules/sign_in/sign_in_controller.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final SignInController controller = Get.find<SignInController>();

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            // Full background image
            Image.asset(
              'assets/login.png',
              fit: BoxFit.cover, // Ensures the image covers the entire background
              width: double.infinity,
              height: double.infinity,
            ),
            Center(
              child: Obx(() => controller.isSigningIn.value
                  ? CircularProgressIndicator(color: Colors.white)
                  : controller.user == null
                  ? Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 550),
                        child: Column(
                          children: [
                            Center(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "JoTrip",
                                    style: TextStyle(
                                      fontSize: 38,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0XFFFFFFFF),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 80, vertical: 130),
                              child: ElevatedButton(
                                onPressed: () async {
                                  await controller.signInWithGoogle();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0XFF2D2F2E),
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(10),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.g_mobiledata_outlined,
                                      color: Colors.white,
                                      size: 40,
                                    ),
                                    SizedBox(width: 6),
                                    Text(
                                      'Continue with Google',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                ],
              )
                  : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        controller.user?.photoURL ?? ''),
                    radius: 50,
                    backgroundColor: Colors.white,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Hello, ${controller.user?.displayName}!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () async {
                      await controller.signOut();
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          horizontal: 40, vertical: 15),
                      backgroundColor: Colors.redAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'Sign out',
                      style: TextStyle(
                          color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              )),
            ),
          ],
        ),
      ),
    );
  }
}
