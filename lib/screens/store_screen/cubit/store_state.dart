part of 'store_cubit.dart';

@immutable
abstract class StoreState {}

class StoreInitial extends StoreState {}
class StoreSuccess extends StoreState {}
class StoreLoading extends StoreState {}
class FavoritesLoading extends StoreState {}
class UserDataSuccess extends StoreState {}
class FavoriteSelected extends StoreState {}
class SearchStoreSuccess extends StoreState {}
class ErrorOccurred extends StoreState {
  final String error;

  ErrorOccurred({required this.error});
}

