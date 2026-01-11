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
                        title: '协会招新活动圆满结束',
                        date: '2024-09-15',
                        content: 'Linux爱好者协会2024年秋季招新活动圆满结束，共招收新成员50名。新成员来自不同专业，对Linux系统和开源技术充满热情。',
                        imageUrl: 'https://example.com/news1.jpg',
                      ),
                      SizedBox(height: AppTheme.spacingLarge),
                      _buildNewsItem(
                        title: '技术分享会：Linux内核原理',
                        date: '2024-08-28',
                        content: '协会举办了Linux内核原理技术分享会，邀请了资深Linux工程师讲解内核架构和工作原理，参会成员受益匪浅。',
                        imageUrl: 'https://example.com/news2.jpg',
                      ),
                      SizedBox(height: AppTheme.spacingLarge),
                      _buildNewsItem(
                        title: '开源项目实践：社区网站开发',
                        date: '2024-08-10',
                        content: '协会启动了开源项目实践活动，组织成员开发社区网站，锻炼团队协作和项目开发能力。',
                        imageUrl: 'https://example.com/news3.jpg',
                      ),
                      SizedBox(height: AppTheme.spacingLarge),
                      _buildNewsItem(
                        title: '暑期技术培训营圆满完成',
                        date: '2024-07-25',
                        content: 'Linux爱好者协会暑期技术培训营圆满完成，培训内容包括Linux系统管理、Shell编程和Web开发等。',
                        imageUrl: 'https://example.com/news4.jpg',
                      ),
                      SizedBox(height: AppTheme.spacingLarge),
                      _buildNewsItem(
                        title: '参加全国大学生开源技术竞赛',
                        date: '2024-07-10',
                        content: '协会代表队参加全国大学生开源技术竞赛，获得团队三等奖，展现了协会成员的技术实力。',
                        imageUrl: 'https://example.com/news5.jpg',
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
        width: double.infinity,
        padding: EdgeInsets.all(AppTheme.spacingLarge),
        decoration: BoxDecoration(
          color: AppTheme.cardColor,
          borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
          boxShadow: [AppTheme.defaultShadow],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 新闻图片
            Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(AppTheme.borderRadiusSmall),
              ),
            ),
            SizedBox(height: AppTheme.spacingMedium),
            
            // 新闻标题
            Text(
              title,
              style: AppTheme.heading3,
            ),
            SizedBox(height: AppTheme.spacingSmall),
            
            // 新闻日期
            Text(
              date,
              style: AppTheme.bodyTextSmall.copyWith(
                color: AppTheme.textSecondaryColor,
              ),
            ),
            SizedBox(height: AppTheme.spacingMedium),
            
            // 新闻内容
            Text(
              content,
              style: AppTheme.bodyText,
            ),
            SizedBox(height: AppTheme.spacingMedium),
            
            // 阅读更多按钮
            ElevatedButton(
              onPressed: () {
                // 跳转到新闻详情页面
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primaryColor,
                padding: EdgeInsets.symmetric(
                  horizontal: AppTheme.spacingLarge,
                  vertical: AppTheme.spacingSmall,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
                ),
              ),
              child: Text('阅读更多'),
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