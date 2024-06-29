import 'package:bloc_practice/bloc/spotify_web_api/spotify_repository.dart';
import 'package:bloc_practice/bloc/spotify_web_api/spotify_search_event.dart';
import 'package:bloc_practice/bloc/spotify_web_api/spotify_search_state.dart';
import 'package:bloc_practice/spotify/spotify_track.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpotifySearchBloc extends Bloc<SpotifySearchEvent, SpotifySearchState> {
  final SpotifyRepository repository;

  SpotifySearchBloc({
    required this.repository,
  }) : super(Empty());

  Stream<SpotifySearchState> mapEventToState(SpotifySearchEvent event) async* {
    if (event is SearchMusicEvent) {
      yield* _mapSearchMusicEvent(event);
    }
  }

  Stream<SpotifySearchState> _mapSearchMusicEvent(
      SearchMusicEvent event, String query) async* {
    try {
      /// loading 상태
      yield Loading();

      /// repository에서 track 받아오는 상태
      final repo = await repository.searchMusic(query);
      final result = repo.map((e) => SpotifyTrack.fromJson(e)).toList();

      /// loaded 상태
      yield Loaded(spotifyTracks: result);
    } catch (e) {
      yield Error(message: e.toString());
    }
  }
}
