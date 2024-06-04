import 'package:flutter/material.dart';
import 'package:flutter_food_delivery/components/my_quantity_selector.dart';
import 'package:flutter_food_delivery/models/cart_item.dart';
import 'package:flutter_food_delivery/models/restaurant.dart';
import 'package:provider/provider.dart';

class MyCartTile extends StatelessWidget {
  final CartItem cartItem;

  const MyCartTile({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) => Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(8),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Food image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      cartItem.food.imagePath,
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
              
                  const SizedBox(width: 10),
              
                  // Name and price
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Food name
                        Text(
                          cartItem.food.name,
                          style: Theme.of(context).textTheme.subtitle1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 5),
                        // Food price
                        Text(
                          '\$${cartItem.food.price}',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Increment or decrement quantity
                  QuantitySelector(
                    quantity: cartItem.quantity, 
                    food: cartItem.food, 
                    onDecrement: () {
                      restaurant.removeFromCart(cartItem);
                    }, 
                    onIncrement: () {
                      restaurant.addToCart(
                        cartItem.food, cartItem.selectedAddons);
                    },
                  ),
                ],
              ),
            ),

            // Addons
            if (cartItem.selectedAddons.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: SizedBox(
                  height: 40,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.only(left: 10, bottom: 10, right: 10),
                    children: cartItem.selectedAddons.map(
                      (addon) => Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: FilterChip(
                          label: Row(
                            children: [
                              // Addon name
                              Text(
                                addon.name,
                                overflow: TextOverflow.ellipsis,
                              ),
                              // Addon price
                              Text(
                                ' (\$${addon.price})',
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                          shape: StadiumBorder(
                            side: BorderSide(color: Theme.of(context).colorScheme.primary),
                          ),
                          onSelected: (value) {},
                          backgroundColor: Theme.of(context).colorScheme.secondary,
                          labelStyle: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ).toList(),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
