import 'package:colposcopy/core/constants/string.dart';
import 'package:colposcopy/presentation/routes/app_router.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Image.asset('assets/images/welcome_bg.jpg', fit: BoxFit.scaleDown),
          // Expanded(
          //     child:
          //         Image.asset('assets/images/welcome_bg.jpg', fit: BoxFit.cover)),
          // child const Image(image: AssetImage('assets/background.png'));
          Container(
              // decoration: const BoxDecoration(
              //   image: DecorationImage(
              //     fit: BoxFit.cover,
              //     image: AssetImage('assets/images/welcome_bg.jpg'),
              //   ),
              // ),
              ),
          Row(
            children: [
              const Expanded(
                flex: 3,
                child: SizedBox(),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 550,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          Strings.authWelcome1,
                          style: TextStyle(
                              fontSize: 38, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 15),
                        const Text(
                          Strings.authWelcome2,
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(height: 15),
                        const Text(
                          Strings.authWelcome3,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.italic),
                        ),
                        const SizedBox(height: 25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              onPressed: _onNewUserPressed,
                              // style: ElevatedButton.styleFrom(
                              //   shape: const StadiumBorder(),
                              // ),
                              child: const Text(Strings.authNewUser),
                            ),
                            const SizedBox(width: 15),
                            ElevatedButton(
                              onPressed: () => const LoginRoute().push(context),
                              // onPressed: _onLogInPressed,
                              style: ElevatedButton.styleFrom(
                                shape: const StadiumBorder(),
                              ),
                              child: const Text(Strings.commandsLogIn),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _onNewUserPressed() {}
  void _onLogInPressed() {}
}
