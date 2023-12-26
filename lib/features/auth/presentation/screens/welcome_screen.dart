import 'package:colposcopy/core/constants/app_pages.dart';
import 'package:colposcopy/core/constants/string.dart';
import 'package:colposcopy/features/auth/presentation/cubits/auth/auth_cubit.dart';
import 'package:colposcopy/presentation/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AuthCubit>();
    return Scaffold(
      body: Stack(
        children: [
          Transform.flip(
            flipX: true,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/welcome_bg3.jpg'),
                ),
              ),
            ),
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
                              onPressed: () {
                                cubit.clearSignUpForm();

                                AppRouter.goModal(Modals.signUp, context);
                              },
                              child: const Text(Strings.authNewUser),
                            ),
                            const SizedBox(width: 15),
                            ElevatedButton(
                              onPressed: () => const LoginRoute().go(context),
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
}
