
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteEvent {}

class ToggleFavorite extends FavoriteEvent {
  final String itemName;

  ToggleFavorite({required this.itemName});
}

class FavoriteState {
  final List<String> items;

  FavoriteState({required this.items});
}

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final SharedPreferences prefs;

  FavoriteBloc(this.prefs) : super(FavoriteState(items: []));

  Stream<FavoriteState> mapEventToState(FavoriteEvent event) async* {
    if (event is ToggleFavorite) {
      List<String> updatedItems = List.from(state.items);
      if (updatedItems.contains(event.itemName)) {
        updatedItems.remove(event.itemName);
      } else {
        updatedItems.add(event.itemName);
      }
      prefs.setStringList('favorites', updatedItems);
      yield FavoriteState(items: updatedItems);
    }
  }
}
