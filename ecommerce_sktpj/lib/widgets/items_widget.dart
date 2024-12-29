import 'package:ecommerce_sktpj/models/Product.dart';
import 'package:ecommerce_sktpj/pages/product_page.dart';
import 'package:flutter/material.dart';

class Itemswidget extends StatelessWidget {
  final List<Product> filteredProduct;

  const Itemswidget({super.key, required this.filteredProduct});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2, // Selalu 2 item per baris
      childAspectRatio: 0.54, // Menentukan rasio lebar dan tinggi per item
      shrinkWrap: true,
      padding: EdgeInsets.all(10),
      children: List.generate(filteredProduct.length, (index) {
        Product product = filteredProduct[index];

        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Productpage(varProduct: product)),
            );
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
                        "-50%", // Placeholder discount
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),

                // Image of the product
                Container(
                  margin: EdgeInsets.all(10),
                  child: AspectRatio(
                    aspectRatio: 1, // Aspect ratio 1:1 for square aspect ratio
                    child: Image.asset(
                      product.imageAsset,
                      fit: BoxFit.contain, // Menjaga gambar tetap responsif
                    ),
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
                          product.name,
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFF4C54A5),
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis, // Menghindari overflow pada teks
                        ),

                        // Product description
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            product.description,
                            style: TextStyle(
                              fontSize: MediaQuery.sizeOf(context).width > 480 ? 15 : 13,
                              color: Colors.black,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis, // Menghindari overflow pada teks
                          ),
                        ),

                        // Price section
                        Padding(
                          padding: EdgeInsets.only(top: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Rp.${product.harga}",
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
  }
}
