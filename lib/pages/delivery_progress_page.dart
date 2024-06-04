import 'package:flutter/material.dart';
import 'package:flutter_food_delivery/components/my_receipt.dart';

class DeliveryProgressPage extends StatelessWidget {
  const DeliveryProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("Delivery in progress.."),
        backgroundColor: Colors.transparent,
        ),
        bottomNavigationBar: _buildBottomNavBar(context),
        body: Column(
          children: [
          MyReceipt(),
        ],
      ),
    );
  }

  //Custom Bottom nav Bar - Message / Call delivery driver
  Widget _buildBottomNavBar(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.secondary,
      borderRadius:  const BorderRadius.only(
      topLeft: Radius.circular(40),
      topRight: Radius.circular(40),
       ),
      ),
      padding:  const EdgeInsets.all(25),
      child: Row(
        children: [
          //profile pic of driver
          Container(decoration: BoxDecoration(color: Theme.of(context).colorScheme.background,
          shape: BoxShape.circle,
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person),
          ),
         ),

         const SizedBox(width: 10),

         //driver details
         Column(children: [
          Text("Dava ganteng akwkw",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 10,
            color: Theme.of(context).colorScheme.primary,
            ),
          ),
          Text(
            "Driver",
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
         ],
        ),

        const Spacer(),

         Row(
          children: [
          //mesage button
        Container(
          decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          shape: BoxShape.circle,
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.message),
            color: Theme.of(context).colorScheme.primary,
          ),
         ),

         const SizedBox(width: 10),

          //call button
          Container(
          decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          shape: BoxShape.circle,
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.call),
            color: Colors.green,
          ),
         ),

         ],
        ),
        ],
      ),
    );
  }
}