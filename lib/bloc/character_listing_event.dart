part of 'character_listing_bloc.dart';

@immutable
abstract class CharacterListingEvent {
  const CharacterListingEvent();
}

class LoadCharacterListingEvent extends CharacterListingEvent {
  final int page;
  const LoadCharacterListingEvent(this.page);

  List<Object> get props => [];
}

class LoadMoreCharacterListingEvent extends CharacterListingEvent {
  final int page;
  const LoadMoreCharacterListingEvent(this.page);

  List<Object> get props => [];
}
