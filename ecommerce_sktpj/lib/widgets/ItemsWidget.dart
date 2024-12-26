import 'package:flutter/material.dart';

class Itemswidget extends StatelessWidget {
  const Itemswidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Set the number of columns based on screen width (more columns for larger screens)
        int crossAxisCount = constraints.maxWidth > 480 ? 2 : 1;

        return GridView.count(
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: crossAxisCount,
          childAspectRatio: 0.68,
          shrinkWrap: true,
          padding: EdgeInsets.all(10),
          children: List.generate(10, (index) {
            return InkWell(
              onTap: () {
                Navigator.pushNamed(context, 'productPage');
              },
              child: Container(
                padding: EdgeInsets.only(left: 15, right: 15, top: 10),
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
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
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Image.asset(
                        "images/1.png",
                        height: constraints.maxWidth > 480 ? 120 : 100,
                        width: constraints.maxWidth > 480 ? 120 : 100,
                        fit: BoxFit.contain,
                      ),
                    ),

                    // Content section (title, description, price)
                    Expanded(
                      child: Container(
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
                                  fontSize: constraints.maxWidth > 480 ? 15 : 13,
                                  color: Colors.black,
                                ),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),

                            // Price section
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
                    ),
                  ],
                ),
              ),
            );
          }),
        );
      },
    );
  }
}
