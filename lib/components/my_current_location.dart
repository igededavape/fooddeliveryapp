import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyCurrentLocation extends StatelessWidget {
  const MyCurrentLocation({super.key});
void openLocationSearchBox(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text("Your Location"),
      content: const TextField(
        decoration: const InputDecoration(hintText: "Search address.."),
      ),
      actions:[
        //cancel button
        MaterialButton(onPressed: ()  => Navigator.pop(context),
        child: const Text('Cancel')
        ),

        //Save button
        MaterialButton(onPressed: ()  => Navigator.pop(context),
        child: const Text('Yesss')
        ),
      ],
    ),
  );
}
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Deliver now", 
            style: TextStyle(color:Theme.of(context).colorScheme.primary),
          ),
          GestureDetector(
            onTap: () => openLocationSearchBox(context),
            child: Row(
              children: [
                //addres
                Text(
                  "6910 Hollywood Blv",
                  style: TextStyle(
                  color:Theme.of(context).colorScheme.inversePrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
                  
                //drop dwon menu
                Icon(Icons.keyboard_arrow_down_rounded),
                  
              ],
            ),
          ),
        ],
      ),
    );
  }
}