class SpotifyTrackModel {
  final String trackName, trackImage, artistsName;

  SpotifyTrackModel({
    required this.trackName,
    required this.trackImage,
    required this.artistsName,
  });

  factory SpotifyTrackModel.fromJson(Map<String, dynamic> json) {
    return SpotifyTrackModel(
      trackName: json['trackName'],
      trackImage: json['trackImage'],
      artistsName: json['artistsName'],
    );
  }
}

enum SpotifySearchTrackState {
  loading,
  done,
  error,
}
