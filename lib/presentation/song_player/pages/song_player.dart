// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:spotify_flutter/common/widgets/appbart/app_bar.dart';
import 'package:spotify_flutter/core/configs/theme/app_colors.dart';
import 'package:spotify_flutter/core/constants/app_constans.dart';
import 'package:spotify_flutter/domain/entities/song/song.dart';
import 'package:spotify_flutter/presentation/song_player/pages/bloc/song_player_cubit.dart';
import 'package:spotify_flutter/presentation/song_player/pages/bloc/song_player_state.dart';

class SongPlayerPage extends StatelessWidget {
  final SongEntity songEntity;

  const SongPlayerPage({
    super.key,
    required this.songEntity,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        title: const Text(
          'Now Playing',
          style: TextStyle(fontSize: 18),
        ),
        action: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert_rounded,
            )),
      ),
      body: BlocProvider(
        create: (_) => SongPlayerCubit()..loadSong(AppConstans.pathSongs + songEntity.song),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: [
              _songConver(context),
              const SizedBox(height: 20),
              _songDetail(),
              const SizedBox(height: 5),
              _songPlayer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _songConver(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(AppConstans.pathConvers + songEntity.cover),
        ),
      ),
    );
  }

  Widget _songDetail() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              songEntity.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              songEntity.artist,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.favorite_outline_rounded,
            size: 35,
            color: AppColors.darkGrey,
          ),
        ),
      ],
    );
  }

  Widget _songPlayer() {
    return BlocBuilder<SongPlayerCubit, SongPlayerState>(builder: (context, state) {
      if (state is SongPlayerLoading) {
        return const CircularProgressIndicator();
      }

      if (state is SongPlayerLoaded) {
        return Column(
          children: [
            Slider(
              activeColor: AppColors.primary,
              value: context.read<SongPlayerCubit>().songPosition.inSeconds.toDouble(),
              min: 0.0,
              max: context.read<SongPlayerCubit>().songDuration.inSeconds.toDouble(),
              onChanged: (value) {},
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  formatDuration(context.read<SongPlayerCubit>().songPosition),
                ),
                Text(
                  formatDuration(context.read<SongPlayerCubit>().songDuration),
                ),
              ],
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                context.read<SongPlayerCubit>().playOrPauseSong();
              },
              child: Container(
                height: 60,
                width: 60,
                decoration: const BoxDecoration(shape: BoxShape.circle, color: AppColors.primary),
                child:
                    Icon(context.read<SongPlayerCubit>().audioPlayer.playing ? Icons.pause : Icons.play_arrow_rounded),
              ),
            )
          ],
        );
      }

      return Container();
    });
  }

  String formatDuration(Duration duration) {
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);

    return "${minutes.toString().padLeft(2, '0')} : ${seconds.toString().padLeft(2, '0')}";
  }
}
