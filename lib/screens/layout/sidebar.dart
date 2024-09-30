import 'package:flutter/material.dart';
import 'package:food/screens/loginScreen.dart';
import 'package:food/service/api_service.dart';
import 'package:sidebarx/sidebarx.dart';

class SideBar extends StatelessWidget {
  final SidebarXController controller;

  const SideBar({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.extended
        ? Column(
            children: [
              Expanded(
                child: SidebarX(
                  controller: controller,
                  theme: const SidebarXTheme(
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                    ),
                    textStyle: TextStyle(color: Colors.white),
                    selectedTextStyle: TextStyle(color: Colors.white),
                    iconTheme: IconThemeData(color: Colors.white),
                    selectedIconTheme: IconThemeData(color: Colors.white),
                  ),
                  extendedTheme: const SidebarXTheme(
                    width: 250,
                  ),
                  footerDivider:
                      Divider(color: Colors.white.withOpacity(0.5), height: 1),
                  items: [
                    const SidebarXItem(icon: Icons.home, label: 'Home'),
                    const SidebarXItem(icon: Icons.search, label: 'Search'),
                    const SidebarXItem(icon: Icons.settings, label: 'Settings'),
                    SidebarXItem(
                      icon: Icons.delete,
                      label: 'Logout',
                      onTap: () async {
                        final ApiService _apiService = ApiService();
                        await _apiService.logout();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Loginscreen()),
                        );

                        print('Logged out');
                      },
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close,
                    color: Color.fromARGB(255, 0, 0, 0)),
                onPressed: () {
                  controller.setExtended(false); // Close the sidebar
                },
              ),
            ],
          )
        : Container();
  }
}
