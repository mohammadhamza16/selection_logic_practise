import 'package:flutter/material.dart';

class SingleSelctionScreen extends StatefulWidget {
  const SingleSelctionScreen({super.key});

  @override
  State<SingleSelctionScreen> createState() => _SingleSelctionScreenState();
}

class _SingleSelctionScreenState extends State<SingleSelctionScreen> {
  final List<Map<String, String>> itemMap = [
    {'name': 'cow', 'image': 'assets/animals/cow.png'},
    {'name': 'deer', 'image': 'assets/animals/deer.png'},
    {'name': 'giraffe', 'image': 'assets/animals/giraffe.png'},

    {'name': 'lion', 'image': 'assets/animals/lion.png'},
    {'name': 'pingeon', 'image': 'assets/animals/pingeon.png'},
    {'name': 'tiger', 'image': 'assets/animals/tiger.png'},
    {'name': 'rat', 'image': 'assets/animals/rat.png'},
    {'name': 'white-tiger', 'image': 'assets/animals/white-tiger.png'},
  ];
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Padding(
        padding: const .symmetric(vertical: 30, horizontal: 24),
        child: GridView.builder(
          itemCount: itemMap.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 15,
            childAspectRatio: .7,
            crossAxisSpacing: 8,
            crossAxisCount: 3,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Stack(
                children: [
                  Container(
                    margin: .only(top: 25),
                    decoration: BoxDecoration(
                      borderRadius: .circular(12),
                      gradient: LinearGradient(
                        colors: [
                          Colors.black12,
                          Colors.black26,
                          Colors.black12,
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Image.asset(
                        itemMap[index]['image']!,
                        height: index == selectedIndex ? 120 : 100,
                      ),
                      SizedBox(height: 8),
                      index == selectedIndex
                          ? SizedBox.shrink()
                          : Text(
                              itemMap[index]['name']!.toUpperCase(),
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                    ],
                  ),
                  index == selectedIndex
                      ? Positioned(
                          right: 0,
                          bottom: 0,
                          left: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: .circular(6),
                              color: Colors.redAccent,
                              shape: BoxShape.rectangle,
                            ),
                            padding: .symmetric(vertical: 7),
                            child: Center(
                              child: Text(
                                'Send',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        )
                      : SizedBox.shrink(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
