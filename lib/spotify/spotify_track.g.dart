// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spotify_track.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SpotifyTrackImpl _$$SpotifyTrackImplFromJson(Map<String, dynamic> json) =>
    _$SpotifyTrackImpl(
      trackName: json['trackName'] as String,
      trackImage: json['trackImage'] as String,
      artistsName: json['artistsName'] as String,
    );

Map<String, dynamic> _$$SpotifyTrackImplToJson(_$SpotifyTrackImpl instance) =>
    <String, dynamic>{
      'trackName': instance.trackName,
      'trackImage': instance.trackImage,
      'artistsName': instance.artistsName,
    };
