import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_flutter/common/helpers/is_dartk_mode.dart';
import 'package:spotify_flutter/common/widgets/appbart/app_bar.dart';
import 'package:spotify_flutter/core/configs/assets/app_images.dart';
import 'package:spotify_flutter/core/configs/assets/app_vectors.dart';
import 'package:spotify_flutter/core/configs/theme/app_colors.dart';
import 'package:spotify_flutter/presentation/home/widgets/news_songs.dart';
import 'package:spotify_flutter/presentation/home/widgets/play_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        hideBack: true,
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 40,
          width: 40,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _homeArtistCard(),
            _tabs(),
            SizedBox(
              height: 260,
              child: TabBarView(
                controller: _tabController,
                children: [
                  const NewsSongs(),
                  Container(),
                  Container(),
                  Container(),
                ],
              ),
            ),
            const PlayList(),
          ],
        ),
      ),
    );
  }

  Widget _homeArtistCard() {
    return Center(
      child: SizedBox(
        height: 140,
        child: Stack(
          children: [
            Align(alignment: Alignment.bottomCenter, child: SvgPicture.asset(AppVectors.homeTopCard)),
            Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 60),
                  child: Image.asset(AppImages.homeArtist),
                )),
          ],
        ),
      ),
    );
  }

  Widget _tabs() {
    return Center(
      child: TabBar(
        controller: _tabController,
        tabAlignment: TabAlignment.center,
        labelColor: context.isDarkMode ? Colors.white : Colors.black,
        indicatorColor: AppColors.primary,
        indicatorSize: TabBarIndicatorSize.tab,
        dividerHeight: 0,
        isScrollable: true,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        tabs: [
          Text('News', style: _styleText()),
          Text('Videos', style: _styleText()),
          Text('Artist', style: _styleText()),
          Text('Podcast', style: _styleText()),
        ],
      ),
    );
  }

  TextStyle _styleText() {
    return const TextStyle(fontWeight: FontWeight.w500, fontSize: 16);
  }
}
