import 'package:flutter/material.dart';

class TopLeftNavBar extends StatefulWidget {
  const TopLeftNavBar({super.key});

  @override
  State<TopLeftNavBar> createState() => _TopLeftNavBarState();
}

class _TopLeftNavBarState extends State<TopLeftNavBar> {
  int _selectedIndex = 0;
  NavigationRailLabelType labelType = NavigationRailLabelType.none;
  bool showLeading = false;
  bool showTrailing = false;
  double groupAlignment = -1.0;
  bool isExtended = true;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: <Widget>[
            NavigationRail(
              selectedIndex: _selectedIndex,
              groupAlignment: groupAlignment,
              extended: isExtended,
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              labelType: labelType,
              leading: showLeading
                  ? FloatingActionButton(
                elevation: 0,
                onPressed: () {
                  // Add your onPressed code here!
                },
                child: const Icon(Icons.add),
              )
                  : const SizedBox(),
              trailing: showTrailing
                  ? IconButton(
                onPressed: () {
                  // Add your onPressed code here!
                },
                icon: const Icon(Icons.more_horiz_rounded),
              )
                  : const SizedBox(),
              destinations: const <NavigationRailDestination>[
                NavigationRailDestination(
                  icon: Icon(Icons.dashboard_outlined),
                  selectedIcon: Icon(Icons.dashboard),
                  label: Text('Dashboard'),
                ),
                NavigationRailDestination(
                  icon: Badge(child: Icon(Icons.notifications_outlined)),
                  selectedIcon: Badge(child: Icon(Icons.notifications)),
                  label: Text('Notifications'),
                ),
                NavigationRailDestination(
                  icon: Badge(
                    label: Text('3'),
                    child: Icon(Icons.mail_outline),
                  ),
                  selectedIcon: Badge(
                    label: Text('3'),
                    child: Icon(Icons.mail),
                  ),
                  label: Text('Messages'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.people_outline),
                  selectedIcon: Icon(Icons.people),
                  label: Text('Team'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.settings_outlined),
                  selectedIcon: Icon(Icons.settings),
                  label: Text('Settings'),
                ),
              ],
            ),
            const VerticalDivider(thickness: 1, width: 1),
            // This is the main content.
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('selectedIndex: $_selectedIndex'),
                  const SizedBox(height: 20),

                  const SizedBox(height: 20),
                  Text('Label type: ${labelType.name}'),
                  const SizedBox(height: 10),
                  const SizedBox(height: 20),
                  Text('Group alignment: $groupAlignment'),
                  const SizedBox(height: 10),
                  SegmentedButton<double>(
                    segments: const <ButtonSegment<double>>[
                      ButtonSegment<double>(value: -1.0, label: Text('Top')),
                      ButtonSegment<double>(value: 0.0, label: Text('Center')),
                      ButtonSegment<double>(value: 1.0, label: Text('Bottom')),
                    ],
                    selected: <double>{groupAlignment},
                    onSelectionChanged: (Set<double> newSelection) {
                      setState(() {
                        groupAlignment = newSelection.first;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  SwitchListTile(
                    title: Text(showLeading ? 'Hide Leading' : 'Show Leading'),
                    value: showLeading,
                    onChanged: (bool value) {
                      setState(() {
                        showLeading = value;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: Text(
                      showTrailing ? 'Hide Trailing' : 'Show Trailing',
                    ),
                    value: showTrailing,
                    onChanged: (bool value) {
                      setState(() {
                        showTrailing = value;
                      });
                    },
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
