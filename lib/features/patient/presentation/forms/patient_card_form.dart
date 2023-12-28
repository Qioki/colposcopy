import 'package:colposcopy/core/constants/string.dart';
import 'package:colposcopy/features/patient/presentation/cubits/patient_card/patient_card_cubit.dart';
import 'package:colposcopy/features/form_engine/presentation/form_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

class PatientCardForm extends StatelessWidget {
  const PatientCardForm({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.watch<PatientCardCubit>();
    print(cubit.scheme.fid.itemType);
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 30),
              width: double.infinity,
              // height: double.infinity,
              constraints: const BoxConstraints(maxHeight: 700),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                // mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            print(cubit.formGroup.value);
                            cubit.setReadOnly(true);
                          },
                          child: const SizedBox(
                            width: 90,
                            height: 30,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(Strings.commandsCreate),
                                Icon(
                                  Icons.arrow_forward,
                                  size: 15,
                                ),
                              ],
                            ),
                          )),
                      ElevatedButton(
                        onPressed: () {
                          // print(cubit.formGroup.value);
                          cubit.expand('anamn_2', true);
                        },
                        child: Text(Strings.commandsCreate),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Flexible(
                    child: ReactiveForm(
                      formGroup: cubit.formGroup,
                      child: FormRoot(
                        child: cubit.scheme.build(),
                      ),
                    ),
                  ),
                  // const SizedBox(height: 40),
                  // Flexible(
                  //   child: DefaultTabController(
                  //     length: 3,
                  //     child:
                  //         // Scaffold(
                  //         // appBar: AppBar(
                  //         //   bottom: TabBar(
                  //         //     tabs: [
                  //         //       for (var item in items) Tab(text: item.fid.title),
                  //         //     ],
                  //         //   ),
                  //         // ),
                  //         // ),

                  //         SizedBox(
                  //       child: Column(
                  //         // mainAxisSize: MainAxisSize.min,
                  //         // mainAxisAlignment: MainAxisAlignment.start,
                  //         children: [
                  //           const TabBar(
                  //             tabs: [
                  //               Tab(text: '1'),
                  //               Tab(text: '2'),
                  //               Tab(text: '3'),
                  //             ],
                  //           ),
                  //           Flexible(
                  //             child: Container(
                  //               // width: 400,
                  //               // height: 400,
                  //               child: TabBarView(
                  //                 children: [
                  //                   SingleChildScrollView(
                  //                     child: Center(
                  //                       child: Container(
                  //                         color: Colors.red,
                  //                         child: Text('Tab 1'),
                  //                         height: 222222,
                  //                       ),
                  //                     ),
                  //                   ),
                  //                   Center(child: Text('Tab 2')),
                  //                   Center(child: Text('Tab 3')),
                  //                 ],
                  //               ),
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
          // AppBar(backgroundColor: Colors.transparent, elevation: 0),
        ],
      ),
    );
  }
}
