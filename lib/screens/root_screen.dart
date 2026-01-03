import 'package:flutter/material.dart';
import 'package:selection_logic/screens/multi_selection_screen.dart';
import 'package:selection_logic/screens/single_selection_screen.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  late PageController controller;

  List<Widget> pages = [SingleSelctionScreen(), MultiSelctionScreen()];
  @override
  void initState() {
    super.initState();
    controller = PageController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView(
          controller: controller,
          onPageChanged: (value) {
            setState(() {});
          },
          children: pages,
        ),
        bottomNavigationBar: Container(
          padding: .symmetric(vertical: 24),
          color: Colors.grey[200],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  controller.previousPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: .symmetric(horizontal: 16, vertical: 12),
                  child: Icon(Icons.arrow_back, color: Colors.white),
                ),
              ),
              GestureDetector(
                onTap: () {
                  controller.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: .symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    children: [
                      Text('next page'),
                      SizedBox(width: 8),
                      Icon(Icons.arrow_forward),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
