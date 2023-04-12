import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:starwars/models/response.dart';
import 'package:starwars/repository/repository.dart';

part 'character_listing_event.dart';
part 'character_listing_state.dart';

class CharacterListingBloc
    extends Bloc<CharacterListingEvent, CharacterListingState> {
  final Repository _charRepository;

  CharacterListingBloc(this._charRepository)
      : super(CharacterListingLoadingState()) {
    // on load initial
    on<LoadCharacterListingEvent>((event, emit) async {
      ResponseModel? resp = ResponseModel(results: [], count: 0);

      emit(CharacterListingLoadingState());
      try {
        final response = await _charRepository.get(event.page);
        resp.results = resp.results! + response.results!;
        resp.count = response.count;

        emit(CharacterListingLoadedState(resp));
      } catch (e) {
        emit(CharacterListingErrorState(e.toString()));
      }
    });

    on<LoadMoreCharacterListingEvent>((event, emit) async {
      ResponseModel? resp = ResponseModel(results: [], count: 0);
      try {
        final response = await _charRepository.get(event.page);
        resp.results = resp.results! + response.results!;
        resp.count = response.count;

        emit(CharacterListingLoadedState(resp));
      } catch (e) {
        emit(CharacterListingErrorState(e.toString()));
      }
    });
  }
}
