

// sealed class AddToFavoriteState extends Equatable {
//   const AddToFavoriteState();
  
//   @override
//   List<Object> get props => [];
// }

// final class AddToFavoriteInitial extends AddToFavoriteState {}
part of 'add_to_favorite_bloc.dart';

class FavoriteState{
  final List<ProductList>favoriteItems;
  FavoriteState(this.favoriteItems);
}
