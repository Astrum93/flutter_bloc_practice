import 'package:bloc_practice/bloc/spotify_web_api/spotify_search_event.dart';
import 'package:bloc_practice/bloc/spotify_web_api/spotify_search_state.dart';
import 'package:bloc_practice/bloc/spotify_web_api/spotify_web_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpotifySearchBloc extends Bloc<SpotifySearchEvent, SpotifySearchState> {
  final SpotifyWebApi spotifyWebApi;

  SpotifySearchBloc({
    required this.spotifyWebApi,
  }) : super(Empty()) {
    on<SearchMusicEvent>((event, emit) async {
      await _trackSearch(event, emit);
    });
  }

  /// query 를 통한 음악 검색
  Future<void> _trackSearch(
      SearchMusicEvent event, Emitter<SpotifySearchState> emit) async {
    emit(Loading());
    try {
      await spotifyWebApi.getAccessToken();
      List spotifyTracks = await spotifyWebApi.searchMusic(event.query);

      emit(Loaded(spotifyTracks: spotifyTracks));
    } catch (e) {
      emit(
        Error(message: e.toString()),
      );
    }
  }
}
