import 'package:flutter/material.dart';

class SelectedImageScreen extends StatefulWidget {
  const SelectedImageScreen({super.key});

  @override
  State<SelectedImageScreen> createState() => _SelectedImageScreenState();
}

class _SelectedImageScreenState extends State<SelectedImageScreen> {
  List<String> images = [
    'assets/laptop/labtop1.png',
    'assets/laptop/labtop3.png',
    'assets/laptop/labtop2.png',
    'assets/laptop/labtop4.png',
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade500,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 24),
        child: Column(
          children: [
            SizedBox(height: 350, child: Image.asset(images[selectedIndex])),
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(images.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: AnimatedContainer(
                        height: 140,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: selectedIndex == index
                                ? Colors.blue
                                : Colors.white,
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        duration: Duration(milliseconds: 500),
                        margin: EdgeInsets.only(right: 12),
                        child: Image.asset(images[index]),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
