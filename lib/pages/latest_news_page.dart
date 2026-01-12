import 'package:flutter/material.dart';
import '../theme.dart';
import '../main.dart';

class LatestNewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('最新动态'),
        backgroundColor: AppTheme.surfaceColor,
      ),
      body: ResponsiveSecondaryLayout(
        child: SingleChildScrollView(
          child: Container(
            color: AppTheme.backgroundColor,
            padding: EdgeInsets.all(AppTheme.spacingLarge),
            child: Container(
              constraints: BoxConstraints(maxWidth: 800),
              child: Column(
                children: [
                  Text(
                    '最新动态',
                    style: AppTheme.heading2,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: AppTheme.spacingLarge),
                  Text(
                    'Linux爱好者协会的最新活动和新闻',
                    style: AppTheme.bodyText,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: AppTheme.spacingXLarge),
                  
                  // 新闻列表
                  Column(
                    children: [
                      _buildNewsItem(
                        title: '开发中...',
                        date: 'None',
                        content: '',
                        imageUrl: '',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  
  Widget _buildNewsItem({
    required String title,
    required String date,
    required String content,
    required String imageUrl,
  }) {
    return FadeInAnimation(
      delay: 300,
      child: Container(
        child: Text('None'),
      )
    );
  }
}

// 淡入动画组件
class FadeInAnimation extends StatefulWidget {
  final Widget child;
  final int delay;

  const FadeInAnimation({
    Key? key,
    required this.child,
    this.delay = 0,
  }) : super(key: key);

  @override
  _FadeInAnimationState createState() => _FadeInAnimationState();
}

class _FadeInAnimationState extends State<FadeInAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );

    // 延迟启动动画
    Future.delayed(Duration(milliseconds: widget.delay), () {
      if (mounted) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Opacity(
          opacity: _animation.value,
          child: Transform.translate(
            offset: Offset(0, (1 - _animation.value) * 20),
            child: child,
          ),
        );
      },
      child: widget.child,
    );
  }
}