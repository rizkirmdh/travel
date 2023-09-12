import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/cubit/app_cubits.dart';
import 'package:travel/misc/colors.dart';
import 'package:travel/widgets/app_text_large.dart';
import 'package:travel/widgets/app_text_normal.dart';
import 'package:travel/widgets/responsive_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    'assets/images/welcome-1.png',
    'assets/images/welcome-2.png',
    'assets/images/welcome-3.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(images[index]),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppTextLarge(text: "Trips"),
                          AppTextNormal(
                            text: "Mountain",
                            size: 30,
                          ),
                          SizedBox(height: 20),
                          Container(
                            width: 250,
                            child: AppTextNormal(
                              text:
                                  "Mountain hikes give you an incredible sense of freedom along with endurance test",
                              color: AppColors.textColor2,
                              size: 14,
                            ),
                          ),
                          SizedBox(height: 20),
                          GestureDetector(
                            onTap: (){
                              BlocProvider.of<AppCubits>(context).getData();
                            },
                            child: Container(
                              width: 200,
                              child: Row(
                                children: [
                                  ResponsiveButton(
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ]),
                    Column(
                      children: List.generate(images.length, (indexSlider) {
                        return Container(
                            margin: const EdgeInsets.only(bottom: 4),
                            width: 8,
                            height: index == indexSlider ? 25 : 8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: index == indexSlider
                                  ? AppColors.mainColor
                                  : AppColors.mainColor.withOpacity(0.5),
                            ));
                      }),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
