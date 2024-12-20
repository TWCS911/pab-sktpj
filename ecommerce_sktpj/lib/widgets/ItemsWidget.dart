import 'package:flutter/material.dart';

class Itemswidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio: 0.68,
      crossAxisCount: 2,
      shrinkWrap: true,
      padding: EdgeInsets.all(10),
      children: [
        Container(
          padding: EdgeInsets.only(left: 15, right: 15, top: 10),
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Discount and favorite button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Color(0xFF4C54A5),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      "-50%",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.favorite_border,
                    color: Colors.red,
                  ),
                ],
              ),
              
              // Image of the product
              InkWell(
                onTap: () {
                  // Handle the image tap action
                  print('Image tapped');
                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Image.asset(
                    "images/1.png",
                    height: 120,
                    width: 120,
                    fit: BoxFit.contain, // Ensuring the image fits properly
                  ),
                ),
              ),

              // All content (title, description, and price) in one container
              Container(
                padding: EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Product title
                    Text(
                      "Judul Produk",
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF4C54A5),
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    // Product description
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        "Deskripsi produk ditulis disini. Deskripsi ini mungkin cukup panjang dan membutuhkan banyak ruang. Kami ingin memastikan bahwa teks tidak terpotong dan dapat digulirkan jika diperlukan.",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                        maxLines: 3, // Optional: Limit to 3 lines
                        overflow: TextOverflow.ellipsis, // Adds "..." if the text overflows
                      ),
                    ),
                    
                    // Price
                    Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "\$55",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF4C54A5),
                            ),
                          ),
                          Icon(
                            Icons.shopping_cart_checkout,
                            color: Color(0xFF4C54A5),
                          ),
                        ],
                      ),
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
