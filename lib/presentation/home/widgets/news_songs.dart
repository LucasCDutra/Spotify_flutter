import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_flutter/common/helpers/is_dartk_mode.dart';
import 'package:spotify_flutter/core/configs/theme/app_colors.dart';
import 'package:spotify_flutter/core/constants/app_constans.dart';
import 'package:spotify_flutter/domain/entities/song/song.dart';
import 'package:spotify_flutter/presentation/home/bloc/news_songs_cubit.dart';
import 'package:spotify_flutter/presentation/home/bloc/news_songs_state.dart';
import 'package:spotify_flutter/presentation/song_player/pages/song_player.dart';

class NewsSongs extends StatelessWidget {
  const NewsSongs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NewsSongsCubit()..getNewsSongs(),
      child: SizedBox(
        height: 200,
        child: BlocBuilder<NewsSongsCubit, NewsSongsState>(builder: (
          context,
          state,
        ) {
          if (state is NewsSongsLoading) {
            return Container(alignment: Alignment.center, child: const CircularProgressIndicator());
          }

          if (state is NewsSongsLoaded) {
            return _songs(state.songs);
          }

          return Container();
        }),
      ),
    );
  }

  Widget _songs(List<SongEntity> songs) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext contexet) => SongPlayerPage(songEntity: songs[index]),
              ),
            );
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            width: 160,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(AppConstans.pathConvers + songs[index].cover),
                        )),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        height: 40,
                        width: 40,
                        transform: Matrix4.translationValues(10, 10, 0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: context.isDarkMode ? AppColors.darkGrey : const Color(0xffe6e6e6),
                        ),
                        child: Icon(
                          Icons.play_arrow_rounded,
                          color: context.isDarkMode ? const Color(0XFF959595) : const Color(0x0ff55555),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  songs[index].title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  songs[index].artist,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(width: 14),
      itemCount: songs.length,
    );
  }
}
