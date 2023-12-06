import '../models/search_modal.dart';
import '../state/search_state.dart';

abstract class SearchPrensenterAbstract {
  set view(SearchState view) {}
}

class SearchPrensenter implements SearchPrensenterAbstract {
  final SearchModal _searchModal = SearchModal();
  late SearchState _searchState;

  @override
  set view(SearchState view) {
    _searchState = view;
    _searchState.refreshData(_searchModal);
  }
}
