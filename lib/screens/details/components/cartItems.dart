import 'package:shop_app/models/Product.dart';

class CartItems {
  void addToProducts(Product item) {
    if (item != null) {
      if (!cartProducts.contains(item)) cartProducts.add(item);
    }
  }

  void removeAll() {
    cartProducts.clear();
  }
}

List<Product> cartProducts = [];
