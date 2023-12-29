import 'package:colposcopy/presentation/routes/app_router.dart';
import 'package:colposcopy/presentation/theme/app_theme.dart';
import 'package:flutter/material.dart';

class VisitScreen extends StatelessWidget {
  const VisitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryLight,
      body: AppRouter.getProtocolScreen(),
      // body: Expanded(child: AppRouter.getProtocolScreen()),
      //  Column(
      //   children: [

      //     // Text('Visit'),
      //   ],
      // ),
    );
  }
}
