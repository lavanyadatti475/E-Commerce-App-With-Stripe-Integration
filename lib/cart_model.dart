import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  // ========================
  // PRIVATE DATA LISTS
  // ========================
  final List<Map<String, String>> _items = [];     // Products in cart
  final List<Map<String, String>> _wishlist = [];  // Wishlist items
  final List<Map<String, String>> _orders = [];    // Placed orders

  // ========================
  // GETTERS
  // ========================
  List<Map<String, String>> get items => List.unmodifiable(_items);
  List<Map<String, String>> get wishlist => List.unmodifiable(_wishlist);
  List<Map<String, String>> get orders => List.unmodifiable(_orders);

  bool get isCartEmpty => _items.isEmpty;
  bool get isWishlistEmpty => _wishlist.isEmpty;
  bool get isOrdersEmpty => _orders.isEmpty;

  // ========================
  // TOTAL PRICE CALCULATION
  // ========================
  double get totalPrice {
    double total = 0;
    for (var item in _items) {
      final priceStr = item['price'] ?? '0';
      final numericPrice = priceStr.replaceAll(RegExp(r'[^0-9.]'), '');
      total += double.tryParse(numericPrice) ?? 0;
    }
    return total;
  }

  // ========================
  // CART OPERATIONS
  // ========================

  /// ✅ Compatible with your UI (addItem)
  void addItem(Map<String, String> item) {
    addItemToCart(item);
  }

  void addItemToCart(Map<String, String> item) {
    if (!_items.any((i) => i['title'] == item['title'])) {
      _items.add(item);
      notifyListeners();
    }
  }

  void removeItem(Map<String, String> item) {
    removeItemFromCart(item);
  }

  void removeItemFromCart(Map<String, String> item) {
    _items.removeWhere((i) => i['title'] == item['title']);
    notifyListeners();
  }

  void removeItemAtIndex(int index) {
    if (index >= 0 && index < _items.length) {
      _items.removeAt(index);
      notifyListeners();
    }
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }

  // ========================
  // ORDER OPERATIONS
  // ========================
  void placeOrder() {
    if (_items.isEmpty) return;

    for (var item in _items) {
      _orders.add({
        "title": item["title"] ?? "",
        "price": item["price"] ?? "",
        "image": item["image"] ?? "",
        "date": DateTime.now().toString().split(' ')[0],
        "status": "Processing",
      });
    }
    clearCart();
    notifyListeners();
  }

  void updateOrderStatus(int index, String status) {
    if (index >= 0 && index < _orders.length) {
      _orders[index]["status"] = status;
      notifyListeners();
    }
  }

  void clearOrders() {
    _orders.clear();
    notifyListeners();
  }

  // ========================
  // WISHLIST OPERATIONS
  // ========================
  void addToWishlist(Map<String, String> item) {
    if (!_wishlist.any((i) => i['title'] == item['title'])) {
      _wishlist.add(item);
      notifyListeners();
    }
  }

  void removeFromWishlist(Map<String, String> item) {
    _wishlist.removeWhere((i) => i['title'] == item['title']);
    notifyListeners();
  }

  bool isInWishlist(Map<String, String> item) {
    return _wishlist.any((i) => i['title'] == item['title']);
  }

  void clearWishlist() {
    _wishlist.clear();
    notifyListeners();
  }
}
