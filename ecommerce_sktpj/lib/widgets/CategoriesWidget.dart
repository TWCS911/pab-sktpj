import 'package:ecommerce_sktpj/data/type_product_data.dart';
import 'package:ecommerce_sktpj/models/type_product.dart';
import 'package:flutter/material.dart';

class Categorieswidget extends StatelessWidget {
  const Categorieswidget({super.key, this.onTap});
  final void Function(String)? onTap;

  @override
  Widget build(BuildContext context) {
    List<TypeProduct> typeList = listType;
    
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(typeList.length, (index) {
          TypeProduct type = typeList[index];

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: ElevatedButton(
              onPressed: () => onTap!(type.name),  // Pass selected type back to parent
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "images/1.png",
                    width: 40,
                    height: 40,
                  ),
                  SizedBox(width: 8),
                  Text(
                    type.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color(0xFF4C54A5),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
