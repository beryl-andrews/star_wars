part of 'character_listing_bloc.dart';

@immutable
abstract class CharacterListingState {}

// loading state
class CharacterListingLoadingState extends CharacterListingState {
  List<Object> get props => [];
}

//loaded state
class CharacterListingLoadedState extends CharacterListingState {
  CharacterListingLoadedState(this.responseModel);
  final ResponseModel responseModel;
  List<Object> get props => [responseModel];
}

//loading state error
class CharacterListingErrorState extends CharacterListingState {
  CharacterListingErrorState(this.error);
  final String error;
  List<Object> get props => [error];
}
