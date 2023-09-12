import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/cubit/app_cubit_states.dart';
import 'package:travel/cubit/app_cubits.dart';
import 'package:travel/misc/colors.dart';
import 'package:travel/widgets/app_text_large.dart';
import 'package:travel/widgets/app_text_normal.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {

  var smallIcons = {
    "assets/icons/balloning.png" : "Balloning",
    "assets/icons/hiking.png" : "Hiking",
    "assets/icons/snorkling.png" : "Snorkling",
    "assets/icons/kayaking.png" : "Kayaking"
  };

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);

    return Scaffold(
      body: BlocBuilder<AppCubits, CubitState>(
        builder: (context, state){
          if (state is LoadedState){
            var info = state.places;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //appbar
                Container(
                  padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.menu,
                        size: 35,
                        color: Colors.black87,
                      ),
                      Expanded(child: Container()),
                      const Icon(
                        Icons.person,
                        size: 35,
                        color: Colors.black87,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                //Discover
                Container(
                  padding: const EdgeInsets.only(left: 20),
                  child: AppTextLarge(text: "Discover"),
                ),
                const SizedBox(height: 30),
                //tabbar
                Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TabBar(
                      labelPadding: const EdgeInsets.only(left: 20, right: 20),
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      controller: _tabController,
                      isScrollable: true,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicator: CircleTabBarDecoration(
                        color: AppColors.mainColor,
                        radius: 4,
                      ),
                      tabs: const [
                        Tab(text: "Places"),
                        Tab(text: "Inspirations"),
                        Tab(text: "Emotions")
                      ],
                    ),
                  ),
                ),
                //tabbarview
                Container(
                  padding: const EdgeInsets.only(left: 20),
                  height: 300,
                  width: double.maxFinite,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      ListView.builder(
                        itemCount: info.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: (){
                              BlocProvider.of<AppCubits>(context).detailPage(info[index]);
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 15, top: 10),
                              width: 200,
                              height: 300,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  image: DecorationImage(
                                    image: NetworkImage("http://mark.bslmeiyu.com/uploads/" + info[index].img),
                                    fit: BoxFit.cover,
                                  )),
                            ),
                          );
                        },
                      ),
                      Text("There"),
                      Text("Bye")
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                //Explore
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppTextLarge(text: "Explore more", size: 22,),
                      InkWell(child: AppTextNormal(text: "See all", color: AppColors.textColor1,)),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                //explore list
                Container(
                    height: 120,
                    width: double.maxFinite,
                    margin: const EdgeInsets.only(left: 20),
                    child: ListView.builder(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, index) {
                        return Container(
                          margin: const EdgeInsets.only(right: 30),
                          child: Column(
                            children: [
                              Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                    image: DecorationImage(
                                      image: AssetImage(smallIcons.keys.elementAt(index)),
                                      fit: BoxFit.cover,
                                    )),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                child: AppTextNormal(text: smallIcons.values.elementAt(index), color: AppColors.textColor2,),
                              )
                            ],
                          ),
                        );
                      },
                    )
                ),
              ],
            );
          } else {
            return Container();
          }
        },
      )
    );
  }
}

class CircleTabBarDecoration extends Decoration {
  final Color color;
  final double radius;

  const CircleTabBarDecoration({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color, radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  final double radius;

  const _CirclePainter(this.color, this.radius);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Paint paint = Paint()..color = color;
    paint.isAntiAlias = true;

    final Offset circleOffset = offset +
        Offset(configuration.size!.width / 2 - radius + 5,
            configuration.size!.height - radius - 5);

    canvas.drawCircle(circleOffset, radius, paint);
  }
}
