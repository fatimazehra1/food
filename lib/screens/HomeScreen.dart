import 'package:flutter/material.dart';
import 'package:food/screens/layout/sidebar.dart';
import 'package:food/screens/selectAreaScreen.dart';
import 'package:food/shared/styled_button.dart';
import 'package:food/shared/styled_text.dart';
import 'package:food/screens/components/productTabs.dart';
import 'package:sidebarx/sidebarx.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final SidebarXController _controller =
      SidebarXController(selectedIndex: 0, extended: false);


  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showSelectAreaPopup();
    });
  }

  void _showSelectAreaPopup() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const SelectAreaPopup();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(
                  top: screenHeight * 0.05,
                  left: screenWidth * 0.05,
                  right: screenWidth * 0.05
                  ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                        SidebarButton(onPressed: () {
                          setState(() {
                            _controller.setExtended(!_controller.extended);
                          });
                        }
                        ),
                          SizedBox(width: screenWidth * 0.05),
                          const Column(
                            children: [
                              primaryBoldText('DELIVER TO'),
                              StyledText('MR# 52696'),
                            ],
                          ),
                          SizedBox(width: screenWidth * 0.025),
                          const arrowDown(),
                        ],
                      ),
                      const CartButton()
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: screenHeight * 0.015),
                        child: const Row(children: [
                          Text(
                            'Hey Ali, ',
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                          Text(
                            'Good Afternoon!',
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                color: Colors.black,
                                fontSize: 16),
                          )
                        ]),
                      ),
                    ],
                  ),
                  Container(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: TextField(
                        decoration: InputDecoration(
                          fillColor: const Color.fromARGB(255, 239, 239, 239),
                          filled: true,
                          hintText: 'Search ...',
                          prefixIcon: SizedBox(
                            width: screenWidth * 0.15,
                            child: const Icon(
                              Icons.search,
                              size: 30,
                            ),
                          ),
                          hintStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: screenHeight * 0.025,
                          ),
                        ),
                        style: const TextStyle(
                          fontSize: 14.0,
                        ),
                      )),
                  const Expanded(
                    child: ProductTabs(),
                  ),
                ],
              ),
            ),
            if (_controller.extended)
              Positioned(
                left: 0,
                top: 0,
                bottom: 0,
                child: SideBar(controller: _controller),
              ),
          ],
        ),
    );
  }
}
