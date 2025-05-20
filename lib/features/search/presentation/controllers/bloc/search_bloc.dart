import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fruit_hub/core/entities/product_entity.dart';
import 'package:fruit_hub/features/search/domain/repository/base_search_repo.dart';
import 'package:fruit_hub/generated/l10n.dart';
import 'package:rxdart/rxdart.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final BaseSearchRepo baseSearchRepo;

  SearchBloc(this.baseSearchRepo) : super(SearchInitial()) {
    on<SearchTextChangedEvent>(
      _searchProducts,
      transformer: (events, mapper) => events
          .debounceTime(const Duration(milliseconds: 500))
          .switchMap(mapper),
    );
    on<ClearSearchTextChangedEvent>(_clearSearch);
  }
  FutureOr<void> _searchProducts(
    SearchTextChangedEvent event,
    Emitter<SearchState> emit,
  ) async {
    if (event.query.isEmpty) {
      emit(SearchSuccess(products: const []));
      return;
    }

    emit(SearchLoading());
    final result = await baseSearchRepo.searchProducts(
        query: event.query, localization: event.localization);
    result.fold(
      (failure) => emit(SearchFailure(message: failure.message)),
      (products) => emit(SearchSuccess(products: products)),
    );
  }

  FutureOr<void> _clearSearch(
    ClearSearchTextChangedEvent event,
    Emitter<SearchState> emit,
  ) async {
    emit(SearchSuccess(products: const []));
  }
}
