part of 'category_cubit.dart';

@immutable
abstract class CategoryState {}

class CategoryInitial extends CategoryState {}
class CategorySuccess extends CategoryState {}
class CategoryLoading extends CategoryState {}
class ErrorCategoryOccurred extends CategoryState {
  final String error;

  ErrorCategoryOccurred({required this.error});
}
