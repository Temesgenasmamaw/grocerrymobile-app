
part of 'add_to_favorite_bloc.dart';

sealed class FavoriteEvent extends Equatable {
  const FavoriteEvent();

  @override
  List<Object> get props => [];
}

 class AddToFavoriteEvent extends FavoriteEvent {
  const AddToFavoriteEvent(this.product);
  final ProductList product;

  @override
  List<Object> get props => [product];
}

 class RemoveFromFavoriteEvent extends FavoriteEvent {
  const RemoveFromFavoriteEvent(this.product);

  final ProductList product;

  @override
  List<Object> get props => [product];
}
