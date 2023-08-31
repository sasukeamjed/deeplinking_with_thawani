import 'package:uuid/uuid.dart';

class ThawaniCartItem{
  late final Uuid cartItemId;
  final int quantity;
  // final ProductIsChosen productIsChosen;
  final String productName;
  final String price;


  ThawaniCartItem({this.quantity = 1, required this.productName, required this.price}){
    cartItemId = Uuid();
  }

  // ThawaniCartItem copyWithAddExtraQuantity(){
  //   return ThawaniCartItem(productIsChosen: productIsChosen, quantity: this.quantity + 1);
  // }
  //
  // ThawaniCartItem copyWithLessQuantity(){
  //   return ThawaniCartItem(productIsChosen: productIsChosen, quantity: this.quantity - 1);
  // }

  Map toJson(){
    // print("Generate Session Inside a Json");
    //
    // print("product price inside json => ${this.price}");
    // print("product price inside json after trim => ${this.price.trim().length}");
    // print("product price inside json parse to double => ${double.parse(this.price)}");
    // print("product price length inside json => ${this.price.length}");
    return {
      'name': this.productName,
      'quantity' : this.quantity,
      //per unit price
      // 'unit_amount' : int.parse(this.price) * 1000,
      'unit_amount' : (double.parse(this.price) * 1000).toInt(),

    };
  }

  @override
  String toString() {
    return "cartItemId => ${this.cartItemId}, quantity => ${this.quantity}, productName => ${this.productName}, price => ${this.price}";
  }
}