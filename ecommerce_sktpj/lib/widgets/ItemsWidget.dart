import 'package:ecommerce_sktpj/data/Product_data.dart';
import 'package:ecommerce_sktpj/models/Product.dart';
import 'package:ecommerce_sktpj/pages/ProductPage.dart';
import 'package:flutter/material.dart';

class Itemswidget extends StatelessWidget {
  final List<Product> filteredProduct;

  // Constructor to accept filtered products
  const Itemswidget({super.key, required this.filteredProduct});

  @override
  Widget build(BuildContext context) {
    int crossAxisCount = MediaQuery.sizeOf(context).width > 480 ? 2 : 1;
    
    return GridView.count(
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: crossAxisCount,
      childAspectRatio: 0.68,
      shrinkWrap: true,
      padding: EdgeInsets.all(10),
      children: List.generate(filteredProduct.length, (index) {
        Product product = filteredProduct[index]; // Use filtered product list
        
        return InkWell(
          onTap: () {
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => Productpage(varProduct: product))
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
                    product.imageAsset,
                    height: MediaQuery.sizeOf(context).width > 480 ? 120 : 100,
                    width: MediaQuery.sizeOf(context).width > 480 ? 120 : 100,
                    fit: BoxFit.contain,
                  ),
                ),

                // Content section (title, description, price)
                Container(
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
                        overflow: TextOverflow.ellipsis,
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
              ],
            ),
          ),
        );
      }),
    );
  }
}
