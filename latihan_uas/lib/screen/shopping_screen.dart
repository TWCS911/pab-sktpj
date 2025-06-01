import 'package:flutter/material.dart';
import 'package:latihan_uas/service/shopping_services.dart';

class ShoppingScreen extends StatefulWidget {
  const ShoppingScreen({super.key});

  @override
  State<ShoppingScreen> createState() => _ShoppingScreenState();
}

class _ShoppingScreenState extends State<ShoppingScreen> {
  final TextEditingController _jenis = TextEditingController();
  final TextEditingController _nama = TextEditingController();
  final ShoppingServices _shoppingServices = ShoppingServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Shopping List'),),
      body: Padding(
  padding: const EdgeInsets.all(10.0),
  child: Column(
    children: [
      Row(
        children: [
          Expanded(
            child: TextField(
              controller: _jenis,
              decoration: const InputDecoration(
                hintText: 'Masukkan jenis barang',
              ),
            ),
          ),
          // IconButton(
          //   icon: const Icon(Icons.add),
          //   onPressed: () {
          //     _shoppingServices.addShoppingItem(_controller.text);
          //     _controller.clear();
          //   },
          // ),
        ],
      ),
      Expanded(
        child: TextField(
          controller: _nama,
          decoration: const InputDecoration(
            hintText: 'Masukkan nama barang',
          ),
        ),
      ),
      ElevatedButton(
        onPressed: () {
          _shoppingServices.addShoppingItem(_nama.text, _jenis.text);
          _nama.clear();
          _jenis.clear();
        },
        child: const Text('Tambah'),
      ),
      const SizedBox(height: 10), // biar gak nempel
      Expanded(
  child: StreamBuilder<Map<String, Map<String, String>>>(
    stream: _shoppingServices.getShoppingList(),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        final items = snapshot.data!;
        return ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final key = items.keys.elementAt(index);
            final item = items[key]!;

            final name = item['name'];
            final jenis = item['jenis'];

            return ListTile(
              title: Text(name ?? 'Tanpa Nama'),
              subtitle: Text(jenis ?? 'Tanpa Jenis'), // ← ini sekarang tampil
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  _shoppingServices.removeShoppingItem(key);
                },
              ),
            );
          },
        );
      } else if (snapshot.hasError) {
        return Center(
          child: Text('Error: ${snapshot.error}'),
        );
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    },
  ),
)
    ],
  ),
),
    );
  }
}