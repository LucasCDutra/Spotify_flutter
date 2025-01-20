import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_flutter/common/widgets/buttons/basic_app_button.dart';
import 'package:spotify_flutter/core/configs/assets/app_images.dart';
import 'package:spotify_flutter/core/configs/assets/app_vectors.dart';
import 'package:spotify_flutter/core/configs/theme/app_colors.dart';
import 'package:spotify_flutter/presentation/choose_mode/pages/choose_mode.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 40, horizontal: 40),
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  AppImages.introBG,
                ),
              ),
            ),
          ),
          Container(color: Colors.black.withOpacity(0.15)),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
            child: Column(
              children: [
                Align(alignment: Alignment.topCenter, child: SvgPicture.asset(AppVectors.logo)),
                const Spacer(),
                const Text(
                  'Enjoy Listening To Music',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 21),
                const Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: AppColors.grey,
                    fontSize: 13,
                  ),
                ),
                SizedBox(height: 20),
                BasicAppButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ChooseModePage()),
                      );
                    },
                    title: 'Get Started')
              ],
            ),
          ),
        ],
      ),
    );
  }
}
