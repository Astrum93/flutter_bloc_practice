import 'package:equatable/equatable.dart';

abstract class SpotifySearchEvent extends Equatable {}

class SearchMusicEvent extends SpotifySearchEvent {
  final String query;

  SearchMusicEvent({required this.query});

  @override
  // TODO: implement props
  List<Object?> get props => [query];
}
