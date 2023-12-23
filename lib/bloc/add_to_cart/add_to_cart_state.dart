part of 'add_to_cart_bloc.dart';

// sealed class AddToCartState extends Equatable {
//   const AddToCartState();
  
//   @override
//   List<Object> get props => [];
// }

// final class AddToCartInitial extends AddToCartState {}
class CartState{
  final List<ProductList>cartItems;
  CartState(this.cartItems);
}
