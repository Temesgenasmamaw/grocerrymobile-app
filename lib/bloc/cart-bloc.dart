import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartEvent {}

class AddToCart extends CartEvent {
  final String itemName;

  AddToCart({required this.itemName});
}

class CartState {
  final List<String> items;

  CartState({required this.items});
}

class CartBloc extends Bloc<CartEvent, CartState> {
  final SharedPreferences prefs;

  CartBloc(this.prefs) : super(CartState(items: []));

  Stream<CartState> mapEventToState(CartEvent event) async* {
    if (event is AddToCart) {
      List<String> updatedItems = List.from(state.items)..add(event.itemName);
      prefs.setStringList('cart', updatedItems);
      yield CartState(items: updatedItems);
    }
  }
}
