import '../models/search_modal.dart';

abstract class SearchState {
  void refreshData(SearchModal searchModal);
  void onSuccess(String success);
  void onError(String error);
}
