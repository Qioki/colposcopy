import 'package:colposcopy/core/constants/strings.dart';
import 'package:colposcopy/features/form_engine/presentation/form_items.dart';
import 'package:colposcopy/features/protocol/presentation/cubits/cubit/protocol_cubit.dart';
import 'package:colposcopy/presentation/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ProtocolScreen extends StatelessWidget {
  const ProtocolScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.watch<ProtocolCubit>();
    return Container(
      // padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 30),
      // width: double.infinity,
      // constraints: const BoxConstraints(maxWidth: 1100, minWidth: 800),
      // width: double.infinity,
      // height: double.infinity,
      // constraints: const BoxConstraints(maxHeight: 700),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  cubit.clearForm();
                  Navigator.pop(context);
                },
                child: const Text(Strings.commandsCancel),
              ),
              const SizedBox(width: 30),
            ],
          ),
          Expanded(
            child: Container(
              color: AppColors.primaryLight,

              child: Center(
                // child: Text('s'),
                child: ReactiveForm(
                  formGroup: cubit.formGroup,
                  child: FormRoot(
                    child: cubit.scheme.build(),
                  ),
                ),
              ),
              // child: DefaultTabController(
              //   animationDuration: const Duration(milliseconds: 100),
              //   length: 2,
              //   child: Column(
              //     children: [
              //       TabBar(
              //         tabs: [
              //           Tab(
              //               child: Text(
              //             '1',
              //             style: const TextStyle(fontSize: 16),
              //           )),
              //           Tab(
              //               child: Text(
              //             '2',
              //             style: const TextStyle(fontSize: 16),
              //           )),
              //         ],
              //       ),
              //       Flexible(
              //         child: Container(
              //           padding: const EdgeInsets.all(30),
              //           color: AppColors.primaryLight,
              //           child: TabBarView(
              //             children: [
              //               Text(
              //                 '1',
              //                 style: const TextStyle(fontSize: 16),
              //               ),
              //               Text(
              //                 '1',
              //                 style: const TextStyle(fontSize: 16),
              //               )
              //             ],
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
