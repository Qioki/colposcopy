import 'package:colposcopy/core/constants/string.dart';
import 'package:colposcopy/features/patients/presentation/cubits/patients/patients_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatientsScreen extends StatelessWidget {
  const PatientsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<PatientsCubit>();
    return Scaffold(
      body: Container(
        // color: Colors.red,
        child: Column(
          children: [
            Container(
                // height: 500,
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.settings,
                          color: Colors.black54,
                        )),
                    // TextButton(
                    //   child: const Text(Strings.menuLogOut),
                    //   onPressed: () => const LoginRoute().go(context),
                    // ),
                  ],
                )),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      // color: Colors.green,
                      alignment: Alignment.topCenter,
                      child: Column(
                        children: [
                          Text('patients'),
                          SearchField(cubit.onSearchTextChanged),
                          BlocBuilder<PatientsCubit, PatientsState>(
                              builder: (context, state) => state.when(
                                    initial: () => const Text('initial'),
                                    search: (items) {
                                      return ListView.builder(
                                        itemCount: items.length,
                                        itemBuilder: (context, index) =>
                                            Text(items[index].firstname),
                                      );
                                    },
                                  )),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      alignment: Alignment.topCenter,
                      // color: Colors.red,
                      child: Column(
                        children: [
                          Text('patients'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  SearchField(this.onChanged, {super.key});

  final _controller = TextEditingController();
  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: _controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          prefixIcon: const Icon(Icons.search),
          // contentPadding: EdgeInsets.all(8),
          isDense: true,
          hintText: Strings.commandsSearch,
          hintStyle: const TextStyle(color: Colors.black45, fontSize: 14),
        ));
  }
}
