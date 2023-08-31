import 'package:uuid/uuid.dart';

import 'thawani_cart_item.dart';

class ThawaniPaymentSession{
  final List<ThawaniCartItem> _cartItems;
  final String _customerId;
  final String _customerName;

  ThawaniPaymentSession(cartItems, customerId, customerName) : _cartItems = cartItems, _customerId = customerId, _customerName = customerName;

  generateSessionData(){
    // print('Generate Session Function');
    // print('This is the cart items => ${_cartItems[0].toJson()}');
    // print('this is the products session list ${[..._cartItems.map((cartItem) => cartItem.toJson())]}');

    return {
      'client_reference_id' : const Uuid().v1().toString(),
      'mode' : 'payment',
      'products' : [{
        'name': 'fish',
        'quantity' : 1,
        //per unit price
        // 'unit_amount' : int.parse(this.price) * 1000,
        'unit_amount' : (1.2 * 1000).toInt(),

      },],
      'success_url': 'https://myghzlahapp.com/details',
      'cancel_url': 'https://company.com/cancel',
      // "customer_id": this._customerId,
      'metadata': {
        'Customer name': this._customerName,
        'order id': 0
      }
    };
  }
}