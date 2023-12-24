
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../model/product_list.dart';

part 'add_to_favorite_state.dart';
part 'add_to_favorite_event.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(FavoriteState([])) {
    on<FavoriteEvent>(_AddToFavorite);
  }

  FutureOr<void> _AddToFavorite(FavoriteEvent event, Emitter<FavoriteState> emit) async {
    if(event is AddToFavoriteEvent){
      final updateItems=List<ProductList>.from(state.favoriteItems)..add(event.product);
      emit(FavoriteState(updateItems));
    }else if(event is RemoveFromFavoriteEvent){
      final removeItems=List<ProductList>.from(state.favoriteItems)..remove(event.product);
      emit(FavoriteState(removeItems));
    }
  }
}
