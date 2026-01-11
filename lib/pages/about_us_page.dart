import 'package:flutter/material.dart';
import '../theme.dart';
import '../main.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('关于我们'),
        backgroundColor: AppTheme.surfaceColor,
      ),
      body: ResponsiveSecondaryLayout(
        child: SingleChildScrollView(
          child: Container(
            color: AppTheme.backgroundColor,
            padding: EdgeInsets.all(AppTheme.spacingLarge),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 团队标志动画
                TweenAnimationBuilder(
                  duration: Duration(seconds: 1),
                  tween: Tween<double>(begin: 0.0, end: 1.0),
                  builder: (context, double value, child) {
                    return Opacity(
                      opacity: value,
                      child: Transform.scale(
                        scale: value,
                        child: child,
                      ),
                    );
                  },
                  child: Image.asset(
                    'assets/img/logo.jpg',
                    width: 150,
                    height: 150,
                  ),
                ),
                SizedBox(height: AppTheme.spacingXLarge),
                
                // 标题
                FadeInAnimation(
                  delay: 300,
                  child: Text(
                    'Linux爱好者协会',
                    style: AppTheme.heading2,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: AppTheme.spacingMedium),
                
                // 副标题
                FadeInAnimation(
                  delay: 600,
                  child: Text(
                    '我们是一个由开源技术爱好者组成的学生社团',
                    style: AppTheme.heading4,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: AppTheme.spacingLarge),
                
                // 简介
                FadeInAnimation(
                  delay: 900,
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 800),
                    child: Column(
                      children: [
                        Text(
                          'Linux爱好者协会成立于2010年，是一个由热爱开源技术、Linux系统和编程的学生组成的社团。我们致力于推广开源文化，分享技术知识，培养实践能力。',
                          style: AppTheme.bodyText,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: AppTheme.spacingLarge),

                        // 协会宗旨
                        Text(
                          '协会宗旨',
                          style: AppTheme.heading3,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: AppTheme.spacingMedium),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.code,
                              color: AppTheme.primaryColor,
                              size: 20,
                            ),
                            SizedBox(width: AppTheme.spacingSmall),
                            Text(
                              '推广开源技术，分享编程知识',
                              style: AppTheme.bodyText,
                            ),
                          ],
                        ),
                        SizedBox(height: AppTheme.spacingMedium),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.group,
                              color: AppTheme.primaryColor,
                              size: 20,
                            ),
                            SizedBox(width: AppTheme.spacingSmall),
                            Text(
                              '促进成员交流，培养团队合作精神',
                              style: AppTheme.bodyText,
                            ),
                          ],
                        ),
                        SizedBox(height: AppTheme.spacingMedium),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.lightbulb,
                              color: AppTheme.primaryColor,
                              size: 20,
                            ),
                            SizedBox(width: AppTheme.spacingSmall),
                            Text(
                              '激发创新思维，提升实践能力',
                              style: AppTheme.bodyText,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: AppTheme.spacingXLarge),

                // 团队成员
                FadeInAnimation(
                  delay: 1200,
                  child: Container(
                    padding: EdgeInsets.all(AppTheme.spacingLarge),
                    decoration: BoxDecoration(
                      color: AppTheme.cardColor,
                      borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
                      boxShadow: [AppTheme.defaultShadow],
                    ),
                    child: Column(
                      children: [
                        Text(
                          '核心团队',
                          style: AppTheme.heading3,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: AppTheme.spacingLarge),

                        // 团队成员网格
                        GridView.count(
                          crossAxisCount: 2,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          mainAxisSpacing: AppTheme.spacingLarge,
                          crossAxisSpacing: AppTheme.spacingLarge,
                          children: [
                            _buildTeamMember(
                              name: '张三',
                              role: '会长',
                              description: 'Linux系统专家，热爱开源文化',
                            ),
                            _buildTeamMember(
                              name: '李四',
                              role: '副会长',
                              description: '后端开发工程师，精通Python和C++',
                            ),
                            _buildTeamMember(
                              name: '王五',
                              role: '技术部长',
                              description: '前端开发工程师，擅长React和Flutter',
                            ),
                            _buildTeamMember(
                              name: '赵六',
                              role: '宣传部长',
                              description: 'UI/UX设计师，关注用户体验',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
  Widget _buildTeamMember({
    required String name,
    required String role,
    required String description,
  }) {
    return FadeInAnimation(
      delay: 1500,
      child: Container(
        padding: EdgeInsets.all(AppTheme.spacingMedium),
        decoration: BoxDecoration(
          color: AppTheme.backgroundColor,
          borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
          border: Border.all(
            color: AppTheme.primaryColor.withOpacity(0.3),
            width: 1,
          ),
        ),
        child: Column(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppTheme.primaryColor.withOpacity(0.2),
              ),
              child: Center(
                child: Icon(
                  Icons.person,
                  color: AppTheme.primaryColor,
                  size: 30,
                ),
              ),
            ),
            SizedBox(height: AppTheme.spacingSmall),
            Text(
              name,
              style: AppTheme.heading4,
            ),
            SizedBox(height: AppTheme.spacingSmall),
            Text(
              role,
              style: AppTheme.bodyText.copyWith(
                color: AppTheme.primaryColor,
              ),
            ),
            SizedBox(height: AppTheme.spacingSmall),
            Text(
              description,
              style: AppTheme.bodyTextSmall,
              textAlign: TextAlign.center,
            ),
          ],
        ),
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