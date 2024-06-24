import 'package:freezed_annotation/freezed_annotation.dart';

part 'spotify_web_api_service.freezed.dart';
part 'spotify_web_api_service.g.dart';

@freezed
class SpotifyTrackModel with _$SpotifyTrackModel {
  factory SpotifyTrackModel({
    required String trackName,
    required String trackImage,
    required String artistsName,
  }) = _SpotifyTrackModel;

  factory SpotifyTrackModel.fromJson(Map<String, dynamic> json) =>
      _$SpotifyTrackModel(json);
}
