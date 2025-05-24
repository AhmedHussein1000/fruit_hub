part of 'search_bloc.dart';


sealed class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchSuccess extends SearchState {
  final List<ProductEntity> products;

  SearchSuccess({required this.products});
}

class SearchFailure extends SearchState {
  final String message;

  SearchFailure({required this.message});
}