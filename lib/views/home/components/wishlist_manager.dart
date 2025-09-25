import 'package:owala_app/models/products_model.dart';

class WishlistManager {
  static final List<ProductsModel> _wishlist = [];

  static List<ProductsModel> get wishlist => _wishlist;

  static void toggleProduct(ProductsModel product) {
    if (_wishlist.contains(product)) {
      _wishlist.remove(product);
    } else {
      _wishlist.add(product);
    }
  }

  static bool isFavorite(ProductsModel product) {
    return _wishlist.contains(product);
  }
}
