import 'package:faketwitter/onboard/cubit/onboard_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:faketwitter/intro_pages/intro_pages.dart';
import 'package:faketwitter/onboard/onboard.dart';

class IntroPages extends StatefulWidget {
  const IntroPages({
    Key? key,
    this.widthProportion = 0.8,
    this.heightProportion = 0.8,
  }) : super(key: key);
  final double widthProportion;
  final double heightProportion;
  @override
  State<IntroPages> createState() => _IntroPagesState();
}

class _IntroPagesState extends State<IntroPages> {
  final PageController _pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return BlocProvider<PagesCubit>(
      create: (context) => PagesCubit(4),
      child: BlocListener<PagesCubit, PagesState>(
        listenWhen: (p, c) => p.currentPageIndex != c.currentPageIndex,
        listener: (context, state) {},
        child: Scaffold(
          body: Column(
            children: [
              Row(
                children: [
                  Builder(builder: (ctx) {
                    return TextButton(
                        onPressed: () {
                          ctx.read<OnboardCubit>().loadCreateAccountPage();
                        },
                        child: Text('create account'));
                  }),
                  Builder(builder: (ctx) {
                    return TextButton(
                        onPressed: () {
                          ctx.read<OnboardCubit>().loadLoginPage();
                        },
                        child: Text('login'));
                  }),
                ],
              ),
              Spacer(),
              Row(
                children: [
                  IndicatorItem(index: 0),
                  IndicatorItem(index: 1),
                  IndicatorItem(index: 2),
                  IndicatorItem(index: 3),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
