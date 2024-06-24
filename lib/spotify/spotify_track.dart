import 'package:freezed_annotation/freezed_annotation.dart';

part 'spotify_track.freezed.dart';
part 'spotify_track.g.dart';

@freezed
class SpotifyTrack with _$SpotifyTrack {
  factory SpotifyTrack({
    required String trackName,
    required String trackImage,
    required String artistsName,
  }) = _SpotifyTrack;

  factory SpotifyTrack.fromJson(Map<String, dynamic> json) =>
      _$SpotifyTrackFromJson(json);
}
