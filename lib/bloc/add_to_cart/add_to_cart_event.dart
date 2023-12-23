part of 'add_to_cart_bloc.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

 class AddToCartEvent extends CartEvent {
  const AddToCartEvent(this.product);
  final ProductList product;

  @override
  List<Object> get props => [product];
}

 class RemoveFromCartEvent extends CartEvent {
  const RemoveFromCartEvent(this.product);

  final ProductList product;

  @override
  List<Object> get props => [product];
}
