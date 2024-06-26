import 'package:bloc_practice/spotify/spotify_track.dart';
import 'package:equatable/equatable.dart';

/// Bloc의 상태

abstract class SpotifySearchState extends Equatable {}

class Empty extends SpotifySearchState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class Loading extends SpotifySearchState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class Error extends SpotifySearchState {
  final String message;

  Error({required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}

class Loaded extends SpotifySearchState {
  final List<SpotifyTrack> spotifyTracks;

  Loaded({required this.spotifyTracks});

  @override
  // TODO: implement props
  List<Object?> get props => [spotifyTracks];
}
