import 'package:ecommerce_sktpj/models/Product.dart';
import 'package:ecommerce_sktpj/widgets/product_appbar.dart';
import 'package:clippy_flutter/arc.dart';
import 'package:ecommerce_sktpj/widgets/product_bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Productpage extends StatefulWidget {
  final Product varProduct;
  const Productpage({super.key, required this.varProduct});

  @override
  _ProductpageState createState() => _ProductpageState();
}

class _ProductpageState extends State<Productpage> {
  bool isFavorite = false;
  int quantity = 1;
  TextEditingController quantityController = TextEditingController();

  Future<void> _loadFavoriteStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favoriteHomes = prefs.getStringList('favoriteHomes') ?? [];
    setState(() {
      // Mengecek apakah produk ini ada dalam daftar favorit
      isFavorite = favoriteHomes.contains(widget.varProduct.name);
    });
  }

  @override
  void initState() {
    super.initState();
    quantityController.text = quantity.toString();
    _loadFavoriteStatus();
  }

    Future<void> _toggleFavorite() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favoriteHomes = prefs.getStringList('favoriteHomes') ?? [];

    if (isFavorite) {
      // Jika produk sudah di favoritkan, maka hapus dari daftar favorit
      favoriteHomes.remove(widget.varProduct.name);
      // isFavorite = false;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('${widget.varProduct.name} Removed from favorites'),
        duration: Duration(seconds: 1),
      ));
    } else {
      // Jika produk belum di favoritkan, tambahkan ke daftar favorit
      favoriteHomes.add(widget.varProduct.name);
      // isFavorite = true;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('${widget.varProduct.name} Added to favorites'),
        duration: Duration(seconds: 1),
      ));
    }
    await prefs.setStringList('favoriteHomes', favoriteHomes);
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  // Function to handle decrease in quantity
  void _decreaseQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
        quantityController.text = quantity.toString(); // Update the text field
      });
    }
  }

  // Function to handle increase in quantity
  void _increaseQuantity() {
    setState(() {
      quantity++;
      quantityController.text = quantity.toString(); // Update the text field
    });
  }

  // Function to handle text field changes and validation
  void _onQuantityChanged(String value) {
    // Try to parse the value and ensure it's a valid integer and greater than 0
    int newQuantity = int.tryParse(value) ?? quantity;
    if (newQuantity < 1) {
      newQuantity = 1; // Prevent negative or zero quantity
    }
    setState(() {
      quantity = newQuantity;
      quantityController.text = quantity.toString(); // Update text field
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEDECF2),
      body: ListView(
        children: [
          Productappbar(varProduct: widget.varProduct),
          Padding(
            padding: EdgeInsets.all(16),
            child: Image.asset(widget.varProduct.imageAsset, height: 300),
          ),
          Arc(
            edge: Edge.TOP,
            arcType: ArcType.CONVEY,
            height: 30,
            child: Container(
              width: double.infinity,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 50,
                        bottom: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              widget.varProduct.name,
                              style: TextStyle(
                                fontSize: MediaQuery.of(context).size.width > 360 ? 25 : 20, // Sesuaikan ukuran font
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF4C54A5),
                              ),
                              maxLines: 3, // Sesuaikan jumlah maksimum baris
                              overflow: TextOverflow.visible, // Teks akan terus dilanjutkan tanpa potongan
                            ),
                          ),

                          IconButton(
                            onPressed: _toggleFavorite,
                            icon: Icon(
                              (isFavorite ? Icons.favorite : Icons.favorite_border),
                              size: 30,
                              color: isFavorite ? Colors.red : null,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5, bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RatingBar.builder(
                            initialRating: 4.5,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemSize: 20,
                            itemPadding: EdgeInsets.symmetric(horizontal: 1),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Color(0xFF4C54A5),
                            ),
                            onRatingUpdate: (index) {
                              // Add your onRatingUpdate code here!
                            },
                          ),
                          Row(
                            children: [
                              Container(
                                width: 40, // Fixed width
                                height: 40, // Fixed height
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 3,
                                      blurRadius: 10,
                                      offset: Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: Center(  // Center the icon
                                  child: IconButton(
                                    icon: Icon(Icons.remove, size: 18), // Adjust the icon size
                                    onPressed: _decreaseQuantity, // Decrease quantity
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                child: SizedBox(
                                  width: 50,
                                  child: TextField(
                                    controller: quantityController,
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.number,
                                    onChanged: _onQuantityChanged, // Update quantity when changed
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      contentPadding: EdgeInsets.symmetric(vertical: 0),
                                    ),
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF4C54A5),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: 40, // Fixed width
                                height: 40, // Fixed height
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 3,
                                      blurRadius: 10,
                                      offset: Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: Center(  // Center the icon
                                  child: IconButton(
                                    icon: Icon(Icons.add, size: 18), // Adjust the icon size
                                    onPressed: _increaseQuantity, // Increase quantity
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Text(
                        widget.varProduct.description,
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF4C54A5),
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: ProductBottomNavBar(
          onAddToCart: () {
            // Add your onAddToCart code here!
          },
        ),
      ),
    );
  }
}
