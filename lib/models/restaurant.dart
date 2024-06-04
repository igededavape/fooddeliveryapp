import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_delivery/models/cart_item.dart';
import 'package:intl/intl.dart';

import 'food.dart';

class Restaurant extends ChangeNotifier{
// list of food menu
final List<Food> _menu = [
  //BURGERS
  Food(
  name: "Classic cheeseburger",
  description:" Classic Cheeseburger adalah burger sederhana dengan patty daging sapi, keju leleh, selada, tomat, acar, bawang, dan saus khas, disajikan dalam roti bun lembut.",
  imagePath:"Lib/images/burgers/cheese_burger.png", 
  price: 8.99,
  category: FoodCatergory.burgers ,
  availableAddons: [
    Addon(name:"Extra cheese", price: 0.99),
    Addon(name:"Bacon", price: 0.99),
    Addon(name:"extra tomato", price: 0.99),
  ], 
  ),

  Food(
  name: "BBQ Bacon Burger",
  description:" BBQ Bacon Burger adalah burger lezat dengan patty daging sapi, keju leleh, bacon renyah, saus BBQ, selada, dan tomat, disajikan dalam roti bun lembut. Rasanya gurih, manis, dan berasap..",
  imagePath:"Lib/images/burgers/bbq_burger.png", 
  price: 10.99,
  category: FoodCatergory.burgers ,
  availableAddons: [
    Addon(name:"=Grilled Onions", price: 0.99),
    Addon(name:"Jalapenos", price: 1.49),
    Addon(name:"Extra BBQ sauce", price: 1.49),
  ], 
  ),

  Food(
  name: "veggie Burger",
  description:" Veggie Burger adalah burger sehat dengan patty sayuran, keju leleh, selada, tomat, bawang, dan saus, disajikan dalam roti bun lembut. Rasanya segar dan lezat..",
  imagePath:"Lib/images/burgers/vege_burger.png", 
  price: 9.49,
  category: FoodCatergory.burgers ,
  availableAddons: [
    Addon(name:"Vegan cheese", price: 0.99),
    Addon(name:"Grilled Mushrooms", price: 1.49),
    Addon(name:"Humus Spread", price: 1.49),
  ], 
  ),

  Food(
  name: "Aloha Burger",
  description:"Aloha Burger adalah burger tropis dengan patty daging sapi, keju, nanas panggang, dan saus manis gurih dalam roti bun lembut. Rasanya manis, asam, dan gurih, ",
  imagePath:"Lib/images/burgers/aloha_burger.png", 
  price: 9.49,
  category: FoodCatergory.burgers ,
  availableAddons: [
    Addon(name:"Teriyaki Glaze", price: 0.99),
    Addon(name:"Extra pineaple", price: 0.49),
    Addon(name:"Bacon", price: 1.49),
  ], 
  ),

  Food(
  name: "Blue Moon Burger",
  description:" burger unik dengan patty daging sapi, keju biru, bacon renyah, bawang karamel, dan saus khusus, disajikan dalam roti bun lembut kaya akan cita rasa dan bertingkat tingkat rotinya., ",
  imagePath:"Lib/images/burgers/bluemoon_burger.png", 
  price: 9.99,
  category: FoodCatergory.burgers ,
  availableAddons: [
    Addon(name:"sauteed mushrooms", price: 0.99),
    Addon(name:"fried Egg", price: 1.49),
    Addon(name:"Spicy mayo", price: 0.49),
  ], 
  ),
  
  //SALADS
  Food(
  name: "Caesar salad",
  description:" Caesar Salad adalah salad klasik yang terdiri dari selada romaine segar, crouton renyah, keju Parmesan parut, dan saus Caesar yang creamy. Rasanya gurih dan segar.",
  imagePath:"Lib/images/salads/caesar_salad.png", 
  price: 7.99,
  category: FoodCatergory.salads,
  availableAddons: [
    Addon(name:"Grilled chicken", price: 0.99),
    Addon(name:"Anchovies", price: 1.49),
    Addon(name:"Extra parmesan", price: 1.99),
  ], 
  ),

  Food(
  name: "Greek salad",
  description:" Greek Salad adalah salad segar yang terdiri dari tomat, mentimun, paprika, bawang merah, zaitun, dan keju feta, semuanya diaduk dengan minyak zaitun dan oregano. Rasanya ringan dan segar.",
  imagePath:"Lib/images/salads/greek_salad.png", 
  price: 8.99,
  category: FoodCatergory.salads,
  availableAddons: [
    Addon(name:"Feta Cheese", price: 0.99),
    Addon(name:"Kalamata Olives", price: 1.49),
    Addon(name:"Grilled Shrimp", price: 1.99),
  ], 
  ),

   Food(
  name: "Quinoa salad",
  description:" Quinoa Salad adalah salad sehat yang terdiri dari quinoa yang dimasak, dicampur dengan sayuran segar seperti tomat, mentimun, paprika, dan bumbu-bumbu segar, sering kali dilengkapi dengan saus lemon atau vinaigrette. Rasanya ringan dan menyegarkan.",
  imagePath:"Lib/images/salads/quinoa_salad.png", 
  price: 9.99,
  category: FoodCatergory.salads,
  availableAddons: [
    Addon(name:"Feta Cheese", price: 0.99),
    Addon(name:"Kalamata Olives", price: 1.49),
    Addon(name:"Grilled Shrimp", price: 1.99),
  ], 
  ),

   Food(
  name: "Asian Sesame salad",
  description:" Asian Sesame Salad adalah salad segar dengan campuran selada, kol, wortel, dan edamame, ditaburi biji wijen panggang dan kacang almond, serta diberi saus wijen-ginger yang gurih dan sedikit manis. Rasanya segar dan sedikit eksotis.",
  imagePath:"Lib/images/salads/asiansesame_salad.png", 
  price: 9.99,
  category: FoodCatergory.salads,
  availableAddons: [
    Addon(name:"Mandarin orange", price: 0.99),
    Addon(name:"Almond silvers", price: 1.49),
    Addon(name:"Extra Teriyaki Chiken", price: 1.99),
  ], 
  ),

  Food(
  name: "Shouth West Chiken salad",
  description:" Southwest Chicken Salad adalah salad yang memadukan potongan daging ayam panggang dengan campuran selada, jagung manis, kacang hitam, tomat, dan keju cheddar, disajikan dengan saus salsa dan sour cream. Rasanya segar dengan sentuhan kekhasan dari rempah-rempah Barat Daya.",
  imagePath:"Lib/images/salads/southwest_salad.png", 
  price: 9.99,
  category: FoodCatergory.salads,
  availableAddons: [
    Addon(name:"sour cream", price: 0.99),
    Addon(name:"Pico de Gallo", price: 1.49),
    Addon(name:"Guacamole", price: 1.99),
  ], 
  ),

  //SIDES
  Food(
  name: "sweet Potato fries",
  description:"Sweet Potato Fries adalah kentang manis yang dipotong memanjang dan digoreng hingga renyah, memberikan rasa manis alami dengan sedikit krispi di luar dan lembut di dalam. Biasanya disajikan dengan saus seperti aioli atau saus barbekyu untuk menambahkan rasa.",
  imagePath:"Lib/images/sides/sweet_potato_side.png", 
  price: 4.99,
  category: FoodCatergory.sides,
  availableAddons: [
    Addon(name:"cheese Sauce", price: 0.99),
    Addon(name:"Truffle Oil", price: 1.49),
    Addon(name:"Cajun spice", price: 1.49),
  ], 
  ),

  Food(
  name: "Onion Rings",
  description:"Onion Rings adalah irisan bawang yang dicelupkan ke dalam adonan berbumbu, kemudian digoreng hingga garing dan renyah di luar, namun tetap lembut di dalam. Rasanya gurih dengan sentuhan manis dari bawang, cocok sebagai camilan atau pendamping hidangan utama.",
  imagePath:"Lib/images/sides/onion_rings_side.png", 
  price: 4.99,
  category: FoodCatergory.sides,
  availableAddons: [
    Addon(name:"Ranch Dip", price: 0.99),
    Addon(name:"Spicy Mayo", price: 1.49),
    Addon(name:"Parmesan Dust", price: 1.99),
  ], 
  ),

  Food(
  name: "garlic bread",
  description:"Garlic Bread adalah roti yang diolesi campuran mentega dan bawang putih cincang, lalu dipanggang hingga garing dan beraroma harum. Rasanya gurih dan kaya akan cita rasa bawang putih, sempurna sebagai pendamping hidangan pasta atau sup.",
  imagePath:"Lib/images/sides/garlic_bread_side.png", 
  price: 4.99,
  category: FoodCatergory.sides,
  availableAddons: [
    Addon(name:"Extra garlic", price: 0.99),
    Addon(name:"Mozzarella Cheese", price: 1.49),
    Addon(name:"Marina dip", price: 1.99),
  ], 
  ),

  Food(
  name: "Loaded Sweet Potato Fries",
  description:"Loaded Sweet Potato Fries adalah kentang manis yang dipotong memanjang dan digoreng hingga renyah, kemudian diberi berbagai topping lezat seperti keju leleh, bacon renyah, irisan jalapeño, dan saus ranch atau sour cream. Hidangan ini menawarkan perpaduan rasa manis, gurih, dan sedikit pedas, sempurna sebagai camilan atau hidangan pembuka yang memuaskan.",
  imagePath:"Lib/images/sides/loadedfries_side.png", 
  price: 4.49,
  category: FoodCatergory.sides,
  availableAddons: [
    Addon(name:"sour Cream", price: 0.99),
    Addon(name:"bacon bits", price: 1.49),
    Addon(name:"green onions", price: 0.99),
  ], 
  ),

  Food(
  name: "Mac and Cheese",
  description:"Mac and Cheese adalah hidangan pasta klasik yang terdiri dari makaroni yang dimasak dan dicampur dengan saus keju krimi. Hidangan ini biasanya dipanggang hingga keju di atasnya meleleh dan berwarna keemasan, menghasilkan tekstur yang lembut dan kenyal dengan rasa gurih dan cheesy yang memanjakan.",
  imagePath:"Lib/images/sides/mac_cheese_side.png", 
  price: 4.49,
  category: FoodCatergory.sides,
  availableAddons: [
    Addon(name:"jalapeno Slices", price: 1.99),
    Addon(name:"bacon bits", price: 0.49),
    Addon(name:"Sriraca Drizzle", price: 0.99),
  ], 
  ),
  //DESSERTS
  Food(
  name: "Chocolate Brownie",
  description:" Chocolate Brownie adalah kue cokelat yang padat dan lembut dengan tekstur fudgy atau cakey, tergantung pada resepnya. Biasanya dibuat dari campuran cokelat leleh, mentega, gula, telur, dan tepung, sering kali ditambahkan kacang atau cokelat chip. Rasanya kaya dan manis, sempurna sebagai pencuci mulut atau camilan manis.",
  imagePath:"Lib/images/desserts/brownie_dessert.png", 
  price: 5.99,
  category: FoodCatergory.desserts,
  availableAddons: [
    Addon(name:"Vanilla ice cream", price: 0.99),
    Addon(name:"Bacon", price: 1.49),
    Addon(name:"Avocado", price: 1.99),
  ], 
  ),

  Food(
  name: "Cheesecake",
  description:" Cheesecake adalah pencuci mulut yang lezat terdiri dari lapisan dasar yang biasanya terbuat dari remah biskuit atau graham cracker, diisi dengan campuran krim keju, gula, dan telur. Toppingnya bisa berupa buah segar, saus buah, cokelat, atau karamel. Rasanya kaya, creamy, dan sedikit manis, dengan tekstur yang lembut dan halus.",
  imagePath:"Lib/images/desserts/cheesecake_dessert.png", 
  price: 6.99,
  category: FoodCatergory.desserts,
  availableAddons: [
    Addon(name:"strawbary topping", price: 0.99),
    Addon(name:"Bluebarry compote", price: 1.49),
    Addon(name:"chocolate chips", price: 1.99),
  ], 
  ),

  Food(
  name: "Apple pie",
  description:" Apple Pie adalah kue pai tradisional yang diisi dengan irisan apel manis yang dibumbui dengan gula, kayu manis, dan kadang-kadang pala atau lemon. Dibungkus dengan kulit pai yang renyah dan bermentega, Apple Pie biasanya disajikan hangat, sering kali dengan es krim vanila atau whipped cream. Rasanya manis dan sedikit asam dengan aroma rempah yang harum.",
  imagePath:"Lib/images/desserts/apple_pie_dessert.png", 
  price: 5.49,
  category: FoodCatergory.desserts,
  availableAddons: [
    Addon(name:"Caramel Sauce", price: 0.99),
    Addon(name:"Vanila Ice Cream", price: 1.49),
    Addon(name:"chocolate puki", price: 1.99),
  ], 
  ),

  Food(
  name: "Red velvet",
  description:" Red Velvet Dessert adalah hidangan manis berwarna merah dengan rasa cokelat ringan dan tekstur lembut, biasanya dilengkapi dengan krim keju frosting.",
  imagePath:"Lib/images/desserts/redvelvet_dessert.png", 
  price: 5.49,
  category: FoodCatergory.desserts,
  availableAddons: [
    Addon(name:"Caramel Sauce", price: 0.99),
    Addon(name:"Cream cheese Icing", price: 1.49),
    Addon(name:"chocolate pukimai", price: 1.99),
  ], 
  ),

  Food(
  name: "Pear pie",
  description:" Pear Pie adalah pai dengan isian irisan pir manis yang dibumbui, dalam kulit pai renyah. Rasanya manis dan harum.",
  imagePath:"Lib/images/desserts/pear_pie_dessert.png", 
  price: 5.49,
  category: FoodCatergory.desserts,
  availableAddons: [
    Addon(name:"Caramel Sauce", price: 0.99),
    Addon(name:"Cream extra", price: 1.49),
    Addon(name:"extra pear", price: 1.99),
  ], 
  ),
  //drinks
  Food(
  name: "Lemonade",
  description:"Lemonade adalah minuman segar yang terbuat dari campuran air, jus lemon, dan gula. Biasanya disajikan dingin dengan es batu, minuman ini memiliki rasa yang manis dan asam, cocok untuk menghilangkan dahaga, terutama di hari-hari panas.",
  imagePath:"Lib/images/drinks/lemonade_drink.png", 
  price: 2.99,
  category: FoodCatergory.drinks,
  availableAddons: [
    Addon(name:"Strawbary Flavor", price: 0.99),
    Addon(name:"Mint leaves", price: 1.99),
    Addon(name:"ginger Zest", price: 1.9),
  ], 
  ),

  Food(
  name: "Iced Tea",
  description:"Iced Tea adalah minuman teh yang disajikan dingin dengan es batu. Teh ini bisa dibuat dari berbagai jenis teh, seperti teh hitam atau teh hijau, dan sering kali diberi tambahan gula atau pemanis lain, serta irisan lemon untuk rasa segar dan sedikit asam. Iced Tea adalah minuman yang menyegarkan, ideal untuk dinikmati pada hari-hari panas.",
  imagePath:"Lib/images/drinks/ice_tea_drink.png", 
  price: 2.99,
  category: FoodCatergory.drinks,
  availableAddons: [
    Addon(name:"Peach Flavor", price: 0.99),
    Addon(name:"lemon Slices", price: 1.69),
    Addon(name:"Honey", price: 1.99),
  ], 
  ),

  Food(
  name: "smoothie",
  description:"Smoothie adalah minuman kental yang dibuat dengan mencampurkan buah-buahan segar atau beku, yogurt atau susu, dan sering kali tambahan lainnya seperti madu, biji chia, atau sayuran hijau. Smoothie memiliki tekstur yang halus dan creamy, serta rasa yang manis dan menyegarkan.",
  imagePath:"Lib/images/drinks/smoothie_drink.png", 
  price: 5.99,
  category: FoodCatergory.drinks,
  availableAddons: [
    Addon(name:"protein powder", price: 0.99),
    Addon(name:"Almond milk", price: 1.69),
    Addon(name:"Chia seeds", price: 1.99),
  ], 
  ),

  Food(
  name: "Mojito",
  description:"Smoothie adalah minuman kental yang dibuat dengan mencampurkan buah-buahan segar atau beku, yogurt atau susu, dan sering kali tambahan lainnya seperti madu, biji chia, atau sayuran hijau. Smoothie memiliki tekstur yang halus dan creamy, serta rasa yang manis dan menyegarkan.",
  imagePath:"Lib/images/drinks/mojito_drink.png", 
  price: 5.10,
  category: FoodCatergory.drinks,
  availableAddons: [
    Addon(name:"Extra mint", price: 0.49),
    Addon(name:"Raspbery pureel", price: 0.99),
    Addon(name:"Splas of coconut Rum", price: 1.99),
  ], 
  ),
  
  Food(
  name: "Caramel Macchiato",
  description:"Caramel Macchiato adalah minuman kopi yang terdiri dari espresso, susu panas, dan sirup vanilla, dengan lapisan busa susu di atasnya. Minuman ini kemudian diberi topping saus karamel yang manis dan kaya rasa. Kombinasi ini menciptakan rasa yang creamy, manis, dan sedikit pahit dari espresso, cocok untuk pecinta kopi dengan sentuhan rasa karamel yang khas.",
  imagePath:"Lib/images/drinks/caramel_drink.png", 
  price: 5.50,
  category: FoodCatergory.drinks,
  availableAddons: [
    Addon(name:"Extra Shot of Espreso", price: 0.49),
    Addon(name:"Hazelnut Syrup", price: 0.99),
    Addon(name:"whipped Cream", price: 1.99),
  ], 
  ),
  ];

  /*
  G E T T E R S
  */

  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;

  /*
  O P E R A T I O N S
  */

  //user cart
  List<CartItem> _cart = [];

  // add to cart
  void addToCart(Food food, List<Addon> selectedAddons) {
    //  see if three is a cart item alredy with the same food an selected addons
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      //check if the food items are the same
      bool isSameFood = item.food == food;

      //check if the list of selected addons are the same
      bool isSameAddons = ListEquality().equals(item.selectedAddons, selectedAddons);


      return isSameFood && isSameAddons;
    });

    //if itema already exists increase it's quantity
    if (cartItem != null) {
      cartItem.quantity++;
    }

    // otherwise, add a new cart item to the cart 
    else {
      _cart.add(
        CartItem(
          food: food,
          selectedAddons: selectedAddons,
      ),
     );
    }
    notifyListeners();
  }

  //remove from cart
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else{
        _cart.removeAt(cartIndex);
      }
    }

    notifyListeners();
  }

  //get total price of cart
  double getTotalPrice() {
    double total= 0.0;

    for(CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;

      for(Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }

      total += itemTotal * cartItem.quantity;
    }

    return total;
  }

  //get total number of items in cart
  int getTotalItemCount() {
    int TotalItemCount = 0;

    for(CartItem cartItem in _cart) {
      TotalItemCount += cartItem.quantity;
    }

    return TotalItemCount;
  }

  // clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  /*
  H E L P E R S
  */

  //generate a receipt
  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Here's your receipt.");
    receipt.writeln();

    //format  the date to include up to seconds only
    String formattedDate = 
    DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln("----------");

    for (final cartItem in _cart) {
      receipt.writeln("${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}");
      if(cartItem.selectedAddons.isNotEmpty) {
        receipt
        .writeln("   Add-ons: ${_formatAddons(cartItem.selectedAddons)}");
      }
      receipt.writeln();
    }

    receipt.writeln("----------");
    receipt.writeln();
    receipt.writeln("Total Items: ${getTotalItemCount()}");
    receipt.writeln("Total price: ${_formatPrice(getTotalPrice())}");

    return receipt.toString();
  }

  // format double value into money
  String _formatPrice(double price) {
    return "\$${price.toStringAsFixed(2)}";
  }

  // format list of addons into a string summary
  String _formatAddons(List<Addon> addons) {
    return addons
    .map((addon) => "${addon.name} (${_formatPrice(addon.price)})")
    . join(",");
  }
}
