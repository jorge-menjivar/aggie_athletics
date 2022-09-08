import 'package:flutter/material.dart';

class SportSelect extends StatefulWidget {
  const SportSelect({Key? key}) : super(key: key);

  @override
  State<SportSelect> createState() => _SportSelectState();
}

class _SportSelectState extends State<SportSelect> {
  List<bool> isSelected = List.generate(8, (_) => false);

  var favorite_all_flag = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 100),
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.all(8),
          children: [
            ToggleButtons(
              direction: Axis.vertical,
              isSelected: isSelected,
              fillColor: Color(0xFF000b27),
              selectedColor: Colors.white,
              color: Color(0xFF000b27),
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('FOOTBALL'),
                      // can use this similar idea to change icon from star outlined to filled star?
                      // Icon(Icons.star, color: isSelected[0] ? Colors.white : Colors.black),
                      // Icon(isSelected[0] ? Icons.star : Icons.star_border_outlined)
                      Icon(Icons.star)
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('BASKETBALL'),
                      Icon(Icons.star)
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('BASEBALL'),
                      Icon(Icons.star)
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('SWIM'),
                      Icon(Icons.star)
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('VOLLEYBALL'),
                      Icon(Icons.star)
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('SOCCER'),
                      Icon(Icons.star)
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('TRACK AND FIELD'),
                      Icon(Icons.star)
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('LACROSSE'),
                      Icon(Icons.star)
                    ],
                  ),
                ),
              ],
              onPressed: (int index) {
                setState(() {
                  isSelected[index] = !isSelected[index];
                });
              },
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (favorite_all_flag == false) {
                    for (var i = 0; i < isSelected.length; i++) {
                      isSelected[i] = true;
                    }
                    favorite_all_flag = true;
                  }
                  else {
                    for (var i = 0; i < isSelected.length; i++) {
                      isSelected[i] = false;
                    }
                    favorite_all_flag = false;
                  }
                });
              },
              child: const Text("FAVORITE ALL SPORTS")
            ),
          ],
        ),
      ),
    );
  }
}