import 'package:colposcopy/core/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class VisitNavBarWidget extends StatelessWidget {
  const VisitNavBarWidget({
    required this.navigationShell,
    // required this.hideVisitTabs,
    super.key,
  });
  final StatefulNavigationShell navigationShell;
  // final bool hideVisitTabs;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        VisitTabsWidget(
          navigationShell: navigationShell,
          hideVisitTabs: false,
        ),
        Expanded(
          child: Row(
            children: [
              ElevatedButton(
                  onPressed: () {}, child: const Text(Strings.commandsSave))
            ],
          ),
        ),
      ],
    );
  }
}

class VisitTabsWidget extends StatelessWidget {
  const VisitTabsWidget(
      {required this.navigationShell, required this.hideVisitTabs, super.key});
  final StatefulNavigationShell navigationShell;
  final bool hideVisitTabs;
  // final VisitEnumState visitState;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: hideVisitTabs ? 200 : 600,
      child: BottomNavigationBar(
        backgroundColor: Colors.white,
        landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
        elevation: 0,
        currentIndex: navigationShell.currentIndex,
        onTap: (int index) => _onTap(context, index),
        items: _getNavBarItems(hideVisitTabs),
      ),
    );
  }

  void _onTap(BuildContext context, int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  List<BottomNavigationBarItem> _getNavBarItems(bool hideVisitTabs) {
    return (hideVisitTabs)
        ? const [
            BottomNavigationBarItem(
                icon: Icon(Icons.account_box), label: Strings.patient),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_box), label: Strings.patient),
          ]
        : const [
            BottomNavigationBarItem(
                icon: Icon(Icons.account_box), label: Strings.patient),
            BottomNavigationBarItem(
                icon: Icon(Icons.camera), label: Strings.examination),
          ];
  }
}
