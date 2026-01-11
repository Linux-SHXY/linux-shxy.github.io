import 'package:flutter/material.dart';
import '../theme.dart';

class BlogPage extends StatelessWidget {
  final String title;
  final String content;

  BlogPage({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: AppTheme.surfaceColor,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Row(
            children: [
              // 左侧内容区域
              Container(
                width: constraints.maxWidth > 768 ? constraints.maxWidth * 0.5 : constraints.maxWidth,
                decoration: const BoxDecoration(
                  color: Color(0xFF111111),
                ),
                child: SingleChildScrollView(
                  child: Container(
                    color: AppTheme.backgroundColor,
                    padding: EdgeInsets.all(AppTheme.spacingLarge),
                    child: FadeInAnimation(
                      delay: 300,
                      child: Container(
                        constraints: BoxConstraints(maxWidth: 800),
                        margin: EdgeInsets.symmetric(horizontal: AppTheme.spacingMedium),
                        padding: EdgeInsets.all(AppTheme.spacingXLarge),
                        decoration: BoxDecoration(
                          color: AppTheme.cardColor,
                          borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
                          boxShadow: [AppTheme.defaultShadow],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // 标题
                            FadeInAnimation(
                              delay: 600,
                              child: Text(
                                title,
                                style: AppTheme.heading2,
                              ),
                            ),
                            SizedBox(height: AppTheme.spacingXLarge),
                            
                            // 文章内容，带打字机效果
                            FadeInAnimation(
                              delay: 900,
                              child: TypewriterText(
                                text: content,
                                style: AppTheme.bodyText.copyWith(height: 1.8),
                                duration: Duration(milliseconds: content.length * 10),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // 右侧空白区域
              if (constraints.maxWidth > 768)
                Expanded(
                  child: Container(
                    color: AppTheme.surfaceColor,
                  ),
                ),
            ],
          );
        },
      ),
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

// 打字机文本动画组件
class TypewriterText extends StatefulWidget {
  final String text;
  final TextStyle style;
  final Duration duration;

  const TypewriterText({
    Key? key,
    required this.text,
    required this.style,
    required this.duration,
  }) : super(key: key);

  @override
  _TypewriterTextState createState() => _TypewriterTextState();
}

class _TypewriterTextState extends State<TypewriterText> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _typewriterAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    _typewriterAnimation = StepTween(
      begin: 0,
      end: widget.text.length,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _typewriterAnimation,
      builder: (context, child) {
        final text = widget.text.substring(0, _typewriterAnimation.value);
        return Text(text, style: widget.style);
      },
    );
  }
}
