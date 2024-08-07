import 'package:bloc_practice/bloc/spotify_web_api/spotify_search_bloc.dart';
import 'package:bloc_practice/bloc/spotify_web_api/spotify_search_event.dart';
import 'package:bloc_practice/bloc/spotify_web_api/spotify_search_state.dart';
import 'package:bloc_practice/common/widget/width_height_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApiScreen extends StatefulWidget {
  const ApiScreen({super.key});

  @override
  State<ApiScreen> createState() => _ApiScreenState();
}

class _ApiScreenState extends State<ApiScreen> {
  String query = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<SpotifySearchBloc>().add(SearchMusicEvent(query: query));
        },
        child: const Icon(Icons.search),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                query = value;
              },
            ),
            height20,
            BlocBuilder<SpotifySearchBloc, SpotifySearchState>(
              builder: (context, state) {
                /// 비어있는 경우
                if (state is Empty) {
                  return Container(
                      width: 100,
                      height: 100,
                      decoration: const BoxDecoration(color: Colors.black));

                  /// 에러가 난 경우
                } else if (state is Error) {
                  return Center(child: Text(state.message));

                  /// 로딩 중인 경우
                } else if (state is Loading) {
                  return const Center(child: CircularProgressIndicator());

                  /// 완료 된 경우
                } else if (state is Loaded) {
                  final items = state.spotifyTracks;

                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.separated(
                          itemBuilder: (_, index) {
                            final track = items[index];
                            return Row(
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  child: Image.network(track['trackImage']),
                                ),
                                const Width(30),
                                Expanded(
                                    child: Text(
                                  track['trackName'],
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                                width30,
                                Expanded(
                                  child: Text(
                                    track['artistsName'],
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            );
                          },
                          separatorBuilder: (_, index) => const Divider(),
                          itemCount: items.length),
                    ),
                  );
                }

                /// 그 외 모든 상황
                return Container(
                    decoration: const BoxDecoration(color: Colors.grey));
              },
            ),
          ],
        ),
      ),
    );
  }
}
