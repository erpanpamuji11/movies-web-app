import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:movies_web_app/core/config/get_it_registry.dart';
import 'package:movies_web_app/core/screen_util/screen_util.dart';
import 'package:movies_web_app/core/screen_util/screen_util_extension.dart';
import 'package:movies_web_app/modules/stores/home/home_store.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class DashboardWidget extends StatefulWidget {
  const DashboardWidget({super.key});

  @override
  State<DashboardWidget> createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget> {
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    Provider.of<HomeStore>(context)..getMovieNowPlaying();
    Provider.of<HomeStore>(context)..getMoviePopular();
    Provider.of<HomeStore>(context)..getMovieUpcoming();
  }

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<HomeStore>(context);
    return Observer(
      builder: (context) => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Now Playing",
                    style: ScreenUtils().textStyleHeadline(context),
                  ),
                  TextButton(
                    onPressed: () => null,
                    child: Text(
                      "See More",
                      style: ScreenUtils().textStyleTitle(context).copyWith(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold
                    ),
                    ),
                  )
                ],
              ),
              const Gap(20),
              SizedBox(
                height: 200,
                child: ListView.separated(
                  itemCount: store.moviesNowPlaying.length,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) => const Gap(12),
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: 90,
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                                "https://image.tmdb.org/t/p/w500${store.moviesNowPlaying[index].posterPath}"),
                          ),
                          const Gap(12),
                          Text(
                            store.moviesNowPlaying[index].title,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              Gap(20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Popular",
                    style: ScreenUtils().textStyleHeadline(context),
                  ),
                  TextButton(
                    onPressed: () => null,
                    child: Text(
                      "See More",
                      style: ScreenUtils().textStyleTitle(context).copyWith(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold
                    ),
                    ),
                  )
                ],
              ),
              const Gap(20),
              SizedBox(
                height: 200,
                child: ListView.separated(
                  itemCount: store.moviesPopular.length,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) => const Gap(12),
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: 90,
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                                "https://image.tmdb.org/t/p/w500${store.moviesPopular[index].posterPath}"),
                          ),
                          const Gap(12),
                          Text(
                            store.moviesPopular[index].title,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              Gap(20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Up Coming",
                    style: ScreenUtils().textStyleHeadline(context),
                  ),
                  TextButton(
                    onPressed: () => null,
                    child: Text(
                      "See More",
                      style: ScreenUtils().textStyleTitle(context).copyWith(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold
                    ),
                    ),
                  )
                ],
              ),
              const Gap(20),
              SizedBox(
                height: 200,
                child: ListView.separated(
                  itemCount: store.moviesUpComing.length,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) => const Gap(12),
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: 90,
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                                "https://image.tmdb.org/t/p/w500${store.moviesUpComing[index].posterPath}"),
                          ),
                          const Gap(12),
                          Text(
                            store.moviesUpComing[index].title,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          )
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
