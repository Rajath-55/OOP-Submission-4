import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/screens/details/components/cartItems.dart';
import 'package:shop_app/screens/details/details_screen.dart';
import 'package:shop_app/screens/home/components/item_card.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/screens/payment/payment.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  List<Product> cartItems = cartProducts;
  int addPayments() {
    int sum = 0;
    if (cartItems != null) {
      cartItems.forEach((element) => sum += element.price);
    }
    return sum;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'ShoppingCart',
        ),
        actions: <Widget>[
          IconButton(
            icon: SvgPicture.asset(
              "assets/icons/cart.svg",
              // By default our  icon color is white
              color: kTextColor,
            ),
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeScreen())),
          ),
          SizedBox(width: kDefaultPaddin / 2)
        ],
      ),
      body: Column(
        children: <Widget>[
          cartItems.length == 0
              ? Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: kDefaultPaddin, vertical: kDefaultPaddin),
                  child: Text(
                    "No items in cart! Add some before checking out!",
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                )
              : Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: kDefaultPaddin, vertical: kDefaultPaddin),
                    child: GridView.builder(
                        itemCount: cartItems.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: kDefaultPaddin,
                          crossAxisSpacing: kDefaultPaddin,
                          childAspectRatio: 0.75,
                        ),
                        itemBuilder: (context, index) => ItemCard(
                              product: cartItems[index],
                              press: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailsScreen(
                                      product: products[index],
                                    ),
                                  )),
                            )),
                  ),
                ),
        ],
      ),
      bottomNavigationBar: new Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(
              child: ListTile(
                title: new Text("Total: "),
                subtitle: new Text("Rs " +
                    addPayments().toString()), //Total to be displayed here
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
                child: MaterialButton(
                  padding: const EdgeInsets.symmetric(
                    horizontal: kDefaultPaddin,
                  ),
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Payment())), //Action to be changed here so that this takes us to payment page
                  child: new Text(
                    "Check out",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.lightBlueAccent,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
                child: MaterialButton(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
                  onPressed: () => {
                    CartItems().removeAll(),
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Cart())),
                  }, //Action to be changed here so that this takes us to payment page
                  child: new Text(
                    "Clear Cart",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.lightBlueAccent,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
