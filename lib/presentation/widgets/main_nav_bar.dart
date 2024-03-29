import 'package:colposcopy/core/constants/strings.dart';
import 'package:colposcopy/features/auth/presentation/cubits/auth/auth_cubit.dart';
import 'package:colposcopy/presentation/routes/app_router.dart';
import 'package:colposcopy/presentation/widgets/logo_zmir_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainNavBarWidget extends StatelessWidget {
  const MainNavBarWidget({required this.child, super.key});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow()],
      ),
      child: Row(
        children: [
          Expanded(child: child),
          const MainNavBarRightButtonsWidget(),
        ],
      ),
    );
  }
}

class MainNavBarRightButtonsWidget extends StatelessWidget {
  const MainNavBarRightButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AuthCubit>();
    return IntrinsicHeight(
      child: Row(
        children: [
          const VerticalDivider(
              thickness: 0.5,
              indent: 9,
              endIndent: 9,
              width: 30,
              color: Colors.black54),
          IconButton(
            tooltip: Strings.settings,
            onPressed: () {},
            icon: const Icon(
              Icons.settings,
              color: Colors.black54,
              // color: AppColors.primary,
              size: 20,
            ),
          ),
          const SizedBox(width: 15),
          IconButton(
            onPressed: () {
              if (cubit.tryLogout()) {
                const LoginRoute().go(context);
              }
            },
            icon: const Icon(
              Icons.logout,
              color: Colors.black54,
              size: 20,
            ),
            tooltip: Strings.menuUserLogOut,
          ),
          const VerticalDivider(
              thickness: 0.5,
              indent: 9,
              endIndent: 9,
              width: 30,
              color: Colors.black54),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
            child: const LogoMiniZmirWidget(60),
          ),
          const SizedBox(width: 15),
        ],
      ),
    );
  }
}
