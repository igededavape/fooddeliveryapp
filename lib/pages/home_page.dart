
import 'package:flutter/material.dart';
import 'package:flutter_food_delivery/components/my_drawer.dart';
import 'package:flutter_food_delivery/models/restaurant.dart';
import 'package:provider/provider.dart';

import '../components/my_current_location.dart';
import '../components/my_description_box.dart';
import '../components/my_food_tile.dart';
import '../components/my_sliver_app_bar.dart';
import '../components/my_tab_bar.dart';
import '../models/food.dart';
import 'food_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{

  // tab controller
late TabController _tabController;

@override
  void initState() {
    super.initState();
    _tabController = TabController(length: FoodCatergory.values.length, vsync: this);
  }

  @override
  void dispose() {
   _tabController.dispose();
    super.dispose();
  }

  //sort out and return a list of food  items that belong to a specific category
  List<Food> _filterMenuByCategory(FoodCatergory category,  List<Food> fullMenu) {
    return fullMenu.where((food) => food.category == category).toList();
  }

  //return list of foods in given category 
  List<Widget> getFoodInThisCategory(List<Food> fullMenu) {
    return FoodCatergory.values.map((Category) {
      // get category menu
      List<Food> categoryMenu = _filterMenuByCategory(Category, fullMenu);

      return ListView.builder(
        itemCount: categoryMenu.length,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          //get indibidual food
          final food=categoryMenu[index];

          // return food tile UI
          return FoodTile(
            food: food,
           ontTap: () => Navigator.push(
            context,
             MaterialPageRoute(
              builder: (context) => FoodPage(food: food)
              ),
            ),
           );
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [ 
          MySliverAppBar(
            title: MyTabBar(tabController: _tabController),
            child: Column(
              children: [

                Divider(indent: 25, endIndent: 25, color: Theme.of(context).colorScheme.secondary,
                ),

              // my current location
             const MyCurrentLocation(),

              //description box
             const MyDescriptionBox(),
            ],
          ),
        ),
      ],
            body:Consumer<Restaurant>(
              builder: (context,restaurant, child) => TabBarView(
              controller: _tabController,
              children: getFoodInThisCategory(restaurant.menu),
            ),
          ),
        ),
    );
  }
}