import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/cubit/app_cubit_states.dart';
import 'package:travel/cubit/app_cubits.dart';
import 'package:travel/misc/colors.dart';
import 'package:travel/widgets/app_button.dart';
import 'package:travel/widgets/app_text_large.dart';
import 'package:travel/widgets/app_text_normal.dart';
import 'package:travel/widgets/responsive_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  int gottenStars = 0;
  int selectedButton = -1;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitState>(
        builder: (context, state){
          DetailState detailState = state as DetailState;
          return Scaffold(
            body: Container(
              width: MediaQuery.of(context).size.width,
              height: double.maxFinite,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    right: 0,
                    child: Container(
                      width: double.maxFinite,
                      height: 350,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage("http://mark.bslmeiyu.com/uploads/" + detailState.place.img),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    top: 60,
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              BlocProvider.of<AppCubits>(context).goHome();
                            },
                            icon: const Icon(Icons.arrow_back, size: 30,),
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 320,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 500,
                      padding: const EdgeInsets.only(top: 30, left: 20, right:20),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppTextLarge(text: detailState.place.name, color: Colors.black54.withOpacity(0.8),),
                              AppTextLarge(text: "\$${detailState.place.price}", color: AppColors.mainColor),
                            ],
                          ),
                          const SizedBox(height: 10,),
                          Row(
                            children: [
                              Icon(Icons.location_on, color: AppColors.mainColor,),
                              const SizedBox(width: 5,),
                              AppTextNormal(text: detailState.place.location, color: Colors.black54.withOpacity(0.8),),
                            ],
                          ),
                          const SizedBox(height: 10,),
                          Row(
                            children: [
                              Wrap(
                                  children: List.generate(5, (index) {
                                    gottenStars = detailState.place.stars;
                                    return Icon(Icons.star, size: 20, color: index < gottenStars ?
                                    AppColors.starColor
                                        : Colors.grey.withOpacity(0.5),);
                                  })
                              ),
                              const SizedBox(width: 10,),
                              AppTextNormal(text: "($gottenStars.0)", color: Colors.black54.withOpacity(0.8),),
                            ],
                          ),
                          const SizedBox(height: 30,),
                          AppTextLarge(text: "People", color: Colors.black54.withOpacity(0.8),),
                          const SizedBox(height: 5,),
                          AppTextNormal(text: "Number of people in your group", color: AppColors.mainTextColor,),
                          const SizedBox(height: 20,),
                          Wrap(
                            children: List.generate(detailState.place.people, (index) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedButton = index;
                                  });
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  child: AppButton(
                                    color: selectedButton == index ? Colors.white : AppColors.mainColor,
                                    backgroundColor: selectedButton == index ? AppColors.mainColor : Colors.grey.withOpacity(0.2),
                                    width: 50,
                                    height: 50,
                                    isIcon: false,
                                    text: "${index + 1}",
                                  ),
                                ),
                              );
                            }),
                          ),
                          const SizedBox(height: 20,),
                          AppTextLarge(text: "Description", color: Colors.black54.withOpacity(0.8), size: 24,),
                          const SizedBox(height: 5,),
                          AppTextNormal(text: detailState.place.description, color: AppColors.mainTextColor,),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 30,
                      left: 20,
                      right: 20,
                      child: Row(
                        children: [
                          AppButton(
                            color: AppColors.mainColor,
                            backgroundColor: Colors.white,
                            borderColor: AppColors.mainColor,
                            width: 60,
                            height: 60,
                            isIcon: true,
                            icon: Icons.favorite_border,
                          ),
                          const SizedBox(width: 10,),
                          ResponsiveButton(
                            isResponsive: true,
                          )
                        ],
                      )
                  ),
                ],
              ),
            ),
          );
    });
  }
}
