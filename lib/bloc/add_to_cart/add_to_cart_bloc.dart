
import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/product_list.dart';

part 'add_to_cart_event.dart';
part 'add_to_cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState([])) {
    on<CartEvent>(_AddToCart);
  }

  FutureOr<void> _AddToCart(CartEvent event, Emitter<CartState> emit) async {
    if(event is AddToCartEvent){
      final updateItems=List<ProductList>.from(state.cartItems)..add(event.product);
      emit(CartState(updateItems));
    }else if(event is RemoveFromCartEvent){
      final removeItems=List<ProductList>.from(state.cartItems)..remove(event.product);
      emit(CartState(removeItems));
    }
  }
}
