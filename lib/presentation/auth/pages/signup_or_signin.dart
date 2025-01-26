import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_flutter/common/helpers/is_dartk_mode.dart';
import 'package:spotify_flutter/common/widgets/appbart/app_bar.dart';
import 'package:spotify_flutter/common/widgets/buttons/basic_app_button.dart';
import 'package:spotify_flutter/core/configs/assets/app_images.dart';
import 'package:spotify_flutter/core/configs/assets/app_vectors.dart';
import 'package:spotify_flutter/core/configs/theme/app_colors.dart';
import 'package:spotify_flutter/presentation/auth/pages/signin.dart';
import 'package:spotify_flutter/presentation/auth/pages/signup.dart';

class SignupOrSigninpage extends StatelessWidget {
  const SignupOrSigninpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BasicAppbar(),
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(AppVectors.topPattern),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset(AppVectors.bottomPattern),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset(AppImages.authBG),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppVectors.logo),
                  const SizedBox(height: 55),
                  const Text(
                    'Enjoy Listening To Music',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Spotify is a proprietary Swedish audio streaming and media services provider ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.grey,
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 21),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: BasicAppButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (BuildContext context) => SingupPage()),
                              );
                            },
                            title: 'Register'),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        flex: 1,
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (BuildContext context) => SinginPage()),
                              );
                            },
                            child: Text(
                              'Sign in',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: context.isDarkMode ? Colors.white : Colors.black,
                              ),
                            )),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
