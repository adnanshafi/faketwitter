import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:faketwitter/intro_pages/intro_pages.dart';

class IndicatorItem extends StatefulWidget {
  const IndicatorItem({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  State<IndicatorItem> createState() => _IndicatorItemState();
}

class _IndicatorItemState extends State<IndicatorItem>
    with SingleTickerProviderStateMixin {
  static const Duration _animDuration = Duration(milliseconds: 200);
  final Color _selectedColor = Colors.red;
  final Color _unselectedColor = Colors.green;

  late bool _isSelected;

  @override
  void initState() {
    _isSelected = widget.index == 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PagesCubit, PagesState>(
      listener: (context, state) {
        if (state.currentPageIndex == widget.index && !_isSelected) {
          setState(() {
            _isSelected = true;
          });
        }
        if (_isSelected && state.currentPageIndex != widget.index) {
          setState(() {
            _isSelected = false;
          });
        }
      },
      listenWhen: (p, c) => p.currentPageIndex != c.currentPageIndex,
      child: AnimatedContainer(
        duration: _animDuration,
        height: _isSelected ? 16 : 8,
        width: _isSelected ? 16 : 8,
        margin: EdgeInsets.symmetric(horizontal: _isSelected ? 8 : 2),
        curve: Curves.easeIn,
        decoration: BoxDecoration(
            color: _isSelected ? _selectedColor : _unselectedColor,
            borderRadius: BorderRadius.circular(_isSelected ? 4 : 8)),
      ),
    );
  }
}
