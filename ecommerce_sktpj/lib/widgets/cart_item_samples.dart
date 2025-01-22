import 'package:flutter/material.dart';

class Cartitemsamples extends StatefulWidget {
  @override
  _CartitemsamplesState createState() => _CartitemsamplesState();
}

class _CartitemsamplesState extends State<Cartitemsamples> {
  // Store the quantity for each cart item
  List<int> quantities = [1, 1, 1]; // Initial quantities for 3 items

  void _increaseQuantity(int index) {
    setState(() {
      quantities[index]++;
    });
  }

  void _decreaseQuantity(int index) {
    setState(() {
      if (quantities[index] > 1) {
        quantities[index]--;
      }
    });
  }

  void _removeItem(int index) {
    setState(() {
      // Remove item from the list
      quantities.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < 3; i++) 
          Container(
            height: 110,
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                // Radio button example
                Radio(
                  value: i,
                  groupValue: -1,  // Example value, update with actual selected index
                  activeColor: Color(0xFF4C54A5),
                  onChanged: (value) {},
                ),
                Container(
                  height: 70,
                  width: 70,
                  margin: EdgeInsets.only(right: 15),
                  child: Image.asset("images/1.png"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Judul Produk",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4C54A5),
                        ),
                      ),
                      Text(
                        "\$55",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4C54A5),
                        ),
                      )
                    ],
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // Delete icon
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () => _removeItem(i),
                      ),
                      Row(
                        children: [
                          // Decrease quantity button
                          IconButton(
                            icon: Icon(Icons.remove, size: 18),
                            onPressed: () => _decreaseQuantity(i),
                          ),
                          Text(
                            quantities[i].toString(),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF4C54A5),
                            ),
                          ),
                          // Increase quantity button
                          IconButton(
                            icon: Icon(Icons.add, size: 18),
                            onPressed: () => _increaseQuantity(i),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
