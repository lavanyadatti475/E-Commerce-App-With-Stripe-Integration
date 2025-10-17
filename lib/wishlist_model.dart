import 'package:flutter/material.dart';

class WishlistModel extends ChangeNotifier {
  // ========================
  // PRIVATE DATA LIST
  // ========================
  final List<Map<String, String>> _wishlist = [];

  // ========================
  // GETTERS
  // ========================
  /// Returns an unmodifiable list of wishlist items
  List<Map<String, String>> get items => List.unmodifiable(_wishlist);

  /// Returns true if the wishlist is empty
  bool get isEmpty => _wishlist.isEmpty;

  /// Returns true if the wishlist has at least one item
  bool get isNotEmpty => _wishlist.isNotEmpty;

  // ========================
  // WISHLIST OPERATIONS
  // ========================

  /// Adds an item to the wishlist
  /// Prevents duplicate items based on the title
  void addToWishlist(Map<String, String> item) {
    if (!_wishlist.any((i) => i['title'] == item['title'])) {
      _wishlist.add({
        'title': item['title'] ?? '',
        'price': item['price'] ?? '',
        'image': item['image'] ?? '',
      });
      notifyListeners();
    }
  }

  /// Removes an item from the wishlist
  void removeFromWishlist(Map<String, String> item) {
    _wishlist.removeWhere((i) => i['title'] == item['title']);
    notifyListeners();
  }

  /// Checks if an item is in the wishlist
  bool isInWishlist(Map<String, String> item) {
    return _wishlist.any((i) => i['title'] == item['title']);
  }

  /// Clears all items from the wishlist
  void clearWishlist() {
    _wishlist.clear();
    notifyListeners();
  }
}
