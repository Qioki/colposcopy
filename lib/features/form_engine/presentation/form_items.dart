import 'package:colposcopy/features/form_engine/domain/form_controller.dart';
import 'package:colposcopy/features/form_engine/domain/models/form_item_data/form_item_data.dart';
import 'package:colposcopy/features/form_engine/domain/models/scheme_item/scheme_item.dart';
import 'package:colposcopy/presentation/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class FormItemInputLine extends StatelessWidget {
  const FormItemInputLine(this.si, {super.key});
  final SchemeItem si;
  // final FormItemData fid;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, bottom: 5),
          child: Text(si.fid.title),
        ),
        ReactiveTextField<String>(
          // readOnly: true,
          formControlName: si.fid.key,
          // onSubmitted: (control) {},
          // readOnly: true,
          decoration: InputDecoration(
              // constraints: const BoxConstraints(maxHeight: 36, maxWidth: 300),
              // enabledBorder: InputBorder.none,
              // focusedBorder: InputBorder.none,
              // prefixText: fid.title,
              // prefix: Padding(
              //   padding: const EdgeInsets.only(right: 10),
              //   child: Text(fid.title),
              // ),
              disabledBorder: InputBorder.none),
        ),
      ],
    );
  }
}

class FormItemDate extends StatelessWidget {
  const FormItemDate(this.si, {super.key});
  // final FormItemData fid;
  final SchemeItemDate si;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, bottom: 5),
          child: Text(si.fid.title),
        ),
        ReactiveTextField<DateTime?>(
          onSubmitted: (control) {
            print(control.value);
          },
          onChanged: (control) {
            print(control.value);
          },
          formControlName: si.fid.key,
          readOnly: true,
          decoration: InputDecoration(
            // labelText: 'Birthday',
            suffixIcon: ReactiveDatePicker<DateTime>(
              formControlName: si.fid.key,
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
              builder: (context, picker, child) => IconButton(
                onPressed: picker.showPicker,
                icon: const Icon(Icons.date_range),
              ),
            ),
            disabledBorder: InputBorder.none,
          ),
        ),
      ],
    );
  }
}

class FormItemExpander extends StatelessWidget {
  const FormItemExpander(this.si, {super.key});
  final SchemeItemExpander si;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
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
