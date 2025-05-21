part of 'search_bloc.dart';

sealed class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

final class SearchTextChangedEvent extends SearchEvent {
  final String query;
  final S localization;
  const SearchTextChangedEvent(
      {required this.query, required this.localization});
  @override
  List<Object> get props => [query];
}
final class ClearSearchTextChangedEvent extends SearchEvent {
  const ClearSearchTextChangedEvent();
}
