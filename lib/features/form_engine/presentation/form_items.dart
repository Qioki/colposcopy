import 'package:colposcopy/features/form_engine/domain/models/scheme_item/scheme_item.dart';
import 'package:colposcopy/presentation/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

// TABS
class FormItemTabs extends StatelessWidget {
  const FormItemTabs(this.si, {super.key});
  final SchemeItems si;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      animationDuration: const Duration(milliseconds: 100),
      length: si.items.length,
      child: Column(
        children: [
          TabBar(
            tabs: [
              for (var item in si.items)
                Tab(
                    child: Text(
                  item.fid.title,
                  style: const TextStyle(fontSize: 16),
                )),
            ],
          ),
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(30),

              // color: Colors.red,
              // color: AppColors.primaryLight,
              child: TabBarView(
                children: [
                  for (var item in si.items)
                    SingleChildScrollView(child: item.build()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// INPUT LINE
class FormItemInputLine extends StatelessWidget {
  const FormItemInputLine(this.si, {super.key});
  final SchemeItem si;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InputLineTitle(si.fid.title),
        ReactiveTextField<String>(
          maxLines: si is SchemeItemNotes ? 5 : 1,
          style: const TextStyle(fontSize: 18, color: Colors.black),
          // readOnly: true,
          formControlName: si.fid.key,
          // onSubmitted: (control) {},
          // readOnly: true,
          decoration: InputDecoration(
            // helperMaxLines: 1,
            helperText: '',
            constraints: si is SchemeItemNotes
                ? const BoxConstraints(minHeight: 150, maxWidth: 630)
                : null,
            // constraints: const BoxConstraints(maxHeight: 65, maxWidth: 300),
            contentPadding: si is SchemeItemNotes
                ? const EdgeInsets.symmetric(horizontal: 20, vertical: 20)
                : null,
            filled: !si.formGroup.disabled,

            // enabledBorder: InputBorder.none,
            // focusedBorder: InputBorder.none,
            // prefixText: fid.title,
            // prefix: Padding(
            //   padding: const EdgeInsets.only(right: 10),
            //   child: Text(fid.title),
            // ),
            // disabledBorder: InputBorder.none),
          ),
        ),
      ],
    );
  }
}

// INPUT DATE
class FormItemDate extends StatelessWidget {
  const FormItemDate(this.si, {super.key});
  final SchemeItemDate si;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InputLineTitle(si.fid.title),
        ReactiveTextField<DateTime?>(
          onSubmitted: (control) {
            print(control.value);
          },
          onChanged: (control) {
            print(control.value);
          },
          formControlName: si.fid.key,
          readOnly: true,
          style: const TextStyle(fontSize: 18, color: Colors.black),
          decoration: InputDecoration(
            helperText: '',
            filled: !si.formGroup.disabled,
            // constraints: const BoxConstraints(maxHeight: 36, maxWidth: 300),
            // labelText: 'Birthday',
            suffixIcon: si.formGroup.disabled
                ? null
                : ReactiveDatePicker<DateTime>(
                    formControlName: si.fid.key,
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                    builder: (context, picker, child) => IconButton(
                      onPressed: picker.showPicker,
                      icon: const Icon(Icons.date_range),
                    ),
                  ),
            // disabledBorder: InputBorder.none,
          ),
        ),
      ],
    );
  }
}

// EXPANDER
class FormItemExpander extends StatelessWidget {
  const FormItemExpander(this.si, {super.key});
  final SchemeItemExpander si;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      onExpansionChanged: (value) {
        print('onExpansionChanged $value');
      },
      controller: si.controller,
      title: Text(si.fid.title),
      childrenPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      expandedAlignment: Alignment.centerLeft,
      shape: const RoundedRectangleBorder(),
      controlAffinity: ListTileControlAffinity.leading,
      // backgroundColor: AppColors.primaryLight,
      children: [for (var e in si.items) e.build()],
    );
  }
}

// class FormItemTabs extends StatelessWidget {
//   const FormItemTabs(this.si, {super.key});
//   final SchemeItemTabs si;

//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }

// class FormItemContainer extends StatelessWidget {
//   const FormItemContainer(this.si, {super.key});
//   final SchemeItemContainer si;

//   @override
//   Widget build(BuildContext context) {
//     return Container(child: si.item.build());
//   }
// }

// class FormItem extends StatelessWidget {
//   FormItem(this.fid, {super.key}) {
//     print('Form item: ${fid.itemType}');
//     switch (fid.itemType) {
//       case FormItemType.inputLine:
//         buildItem = (fid) => FormItemInputLine(fid);
//         break;
//       case FormItemType.inputDate:
//         buildItem = (fid) => FormItemDate(fid);
//         break;
//       default:
//         buildItem = (fid) => FormItemExpander(fid);
//     }
//   }

//   final FormItemData fid;

//   @override
//   Widget build(BuildContext context) {
//     return buildItem(fid);
//     // return FormItemExpander(fid);
//   }

//   late final Widget Function(FormItemData) buildItem;
// }

class InputLineTitle extends StatelessWidget {
  const InputLineTitle(this.title, {super.key});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, bottom: 5, top: 10),
      child: Text(title),
    );
  }
}

class FormRoot extends StatelessWidget {
  const FormRoot({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return child;
    // return Theme(
    //     data: ThemeData(
    //       disabledColor: Colors.red,
    //       textTheme: TextTheme(
    //           displayMedium: Theme.of(context)
    //               .textTheme
    //               .displayMedium!
    //               .copyWith(color: Colors.red)),
    //       // colorScheme: const ColorScheme.dark(),
    //     ),
    //     child: child
    //     //  TextFormField(
    //     //   enabled: false,
    //     //   decoration: const InputDecoration(
    //     //     icon: Icon(Icons.person),
    //     //     hintText: 'What do people call you?',
    //     //     labelText: 'Name *',
    //     //   ),
    //     // ),
    //     );
  }
}
