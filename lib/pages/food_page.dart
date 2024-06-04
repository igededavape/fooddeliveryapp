import 'package:flutter/material.dart';
import 'package:flutter_food_delivery/components/my_button.dart';
import 'package:flutter_food_delivery/models/restaurant.dart';
import 'package:provider/provider.dart';
import '../models/food.dart';

class FoodPage extends StatefulWidget {
  final Food food;
  final Map<Addon, bool> selectedAddons = {};

  FoodPage({
    super.key,
    required this.food,
  }) {
    // Inisialisasi addon yang dipilih
    for (Addon addon in food.availableAddons) {
      selectedAddons[addon] = false;
    }
  }

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  // Metode untuk menambah ke keranjang
  void addToCart(Food food, Map<Addon, bool> selectedAddons) {
    // Tutup halaman makanan saat ini untuk kembali ke menu
    Navigator.pop(context);

    // Format addon yang dipilih
    List<Addon> currentlySelectedAddons = [];
    for (Addon addon in widget.food.availableAddons) {
      if (widget.selectedAddons[addon] == true) {
        currentlySelectedAddons.add(addon);
      }
    }
    // Tambah ke keranjang
    context.read<Restaurant>().addToCart(food, currentlySelectedAddons);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // UI Scaffold
        Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Gambar makanan
                  Center(
                    child: Image.asset(
                      widget.food.imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                  // Nama makanan
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(
                      widget.food.name,
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // Harga makanan
                  Text(
                    '\$${widget.food.price}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Deskripsi makanan
                  Text(widget.food.description),
                  const SizedBox(height: 10),
                  Divider(color: Theme.of(context).colorScheme.secondary),
                  const SizedBox(height: 10),
                  // Addon
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(
                      'Add-ons',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Theme.of(context).colorScheme.secondary),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemCount: widget.food.availableAddons.length,
                      itemBuilder: (context, index) {
                        // Mendapatkan addon individu
                        Addon addon = widget.food.availableAddons[index];
                        // Mengembalikan UI Checkbox
                        return CheckboxListTile(
                          title: Text(addon.name),
                          subtitle: Text(
                            '\$${addon.price}',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          value: widget.selectedAddons[addon],
                          onChanged: (bool? value) {
                            setState(() {
                              widget.selectedAddons[addon] = value!;
                            });
                          },
                        );
                      },
                    ),
                  ),
                  // Tombol -> Tambah ke keranjang
                  MyButton(
                    onTap: () => addToCart(widget.food, widget.selectedAddons),
                    text: "Add To cart",
                  ),
                ],
              ),
            ),
          ),
        ),
        // Tombol kembali
        SafeArea(
          child: Opacity(
            opacity: 0.7,
            child: Container(
              margin: const EdgeInsets.only(left: 25),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/**import 'package:flutter/material.dart';
import 'package:flutter_food_delivery/components/my_button.dart';
import 'package:flutter_food_delivery/models/restaurant.dart';
import 'package:provider/provider.dart';
import '../models/food.dart';

class FoodPage extends StatefulWidget {
  final Food food;
  final Map<Addon, bool> selectedAddons = {};

  FoodPage({
    super.key, 
    required this.food,
  }) {
    // Inisialisasi addon yang dipilih
    for (Addon addon in food.availableAddons) {
      selectedAddons[addon] = false;
    }
  }

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {

  // Metode untuk menambah ke keranjang
  void addToCart(Food food, Map<Addon, bool> selectedAddons) {

    //close the current food page to go back to menu
    Navigator.pop(context);

    //format the selected  addons
    List<Addon> currentlySelectedAddons = [];
    for (Addon addon in widget.food.availableAddons) {
      if (widget.selectedAddons[addon] == true) {
        currentlySelectedAddons.add(addon);
      }
    }
    // add to cart
    context.read()<Restaurant>().addToCart(food, currentlySelectedAddons);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // UI Scaffold
        Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Gambar makanan
                  Center(
                    child: Image.asset(
                      widget.food.imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                  // Nama makanan
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(
                      widget.food.name,
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // Harga makanan
                  Text(
                    '\$${widget.food.price}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Deskripsi makanan
                  Text(widget.food.description),
                  const SizedBox(height: 10),
                  Divider(color: Theme.of(context).colorScheme.secondary),
                  const SizedBox(height: 10),
                  // Addon
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(
                      'Add-ons',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Theme.of(context).colorScheme.secondary),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemCount: widget.food.availableAddons.length,
                      itemBuilder: (context, index) {
                        // Mendapatkan addon individu
                        Addon addon = widget.food.availableAddons[index];
                        // Mengembalikan UI Checkbox
                        return CheckboxListTile(
                          title: Text(addon.name),
                          subtitle: Text(
                            '\$${addon.price}',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          value: widget.selectedAddons[addon],
                          onChanged: (bool? value) {
                            setState(() {
                              widget.selectedAddons[addon] = value!;
                            });
                          },
                        );
                      },
                    ),
                  ),
                  // Tombol -> Tambah ke keranjang
                  MyButton(
                    onTap: ()=> addToCart(widget.food, widget.selectedAddons),
                    text: "Add To cart",
                  ),
                ],
              ),
            ),
          ),
        ),
        // Tombol kembali
        SafeArea(
          child: Opacity(
            opacity: 0.7,
            child: Container(
              margin: const EdgeInsets.only(left: 25),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
        ),
      ],
    );
  }
}*/
