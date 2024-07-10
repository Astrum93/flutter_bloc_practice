import 'package:equatable/equatable.dart';

sealed class SpotifySearchEvent extends Equatable {
  const SpotifySearchEvent();
}

final class SearchMusicEvent extends SpotifySearchEvent {
  final String query;

  const SearchMusicEvent({required this.query});

  @override
  // TODO: implement props
  List<Object?> get props => [query];
}
