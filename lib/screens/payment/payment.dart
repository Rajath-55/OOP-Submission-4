import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/screens/cart/Cart.dart';
import 'package:shop_app/screens/details/components/cartItems.dart';
import 'package:shop_app/screens/details/details_screen.dart';
import 'package:shop_app/screens/home/components/item_card.dart';

class Payment extends StatefulWidget {
  Payment({Key key}) : super(key: key);

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
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
      appBar: buildAppBar(context),
      body: Column(children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: kDefaultPaddin, vertical: kDefaultPaddin),
          child: Text(
            "Items from the cart: ",
            style: Theme.of(context)
                .textTheme
                .headline4
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
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
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 2 * kDefaultPaddin, vertical: 2 * kDefaultPaddin),
          child: Text(
            "Total amount payable : Rs. " + addPayments().toString(),
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        FlatButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          color: Colors.lightGreenAccent,
          onPressed: () => Navigator.pop(context),
          child: Text(
            "Pay  Now".toUpperCase(),
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
      ]),
    );
  }
}

AppBar buildAppBar(context) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 1,
    title: Text(
      "Shopping simplified",
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
    leading: IconButton(
      icon: SvgPicture.asset(
        'assets/icons/back.svg',
        color: Colors.black45,
      ),
      onPressed: () => Navigator.pop(context),
    ),
    actions: <Widget>[
      IconButton(
        icon: SvgPicture.asset(
          "assets/icons/cart.svg",
          // By default our  icon color is white
          color: kTextColor,
        ),
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => Cart())),
      ),
      SizedBox(width: kDefaultPaddin / 2)
    ],
  );
}
