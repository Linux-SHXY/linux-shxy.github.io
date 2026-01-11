import 'package:flutter/material.dart';
import '../theme.dart';

class AnnouncementPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('揭示板'),
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
                    child: Column(
                      children: [
                        Container(
                          constraints: BoxConstraints(maxWidth: 800),
                          child: Column(
                            children: [
                              // 标题淡入动画
                              FadeInAnimation(
                                delay: 300,
                                child: Text(
                                  '最新公告',
                                  style: AppTheme.heading2,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(height: AppTheme.spacingXLarge),
                               
                              // 第一个公告卡片
                              FadeInAnimation(
                                delay: 600,
                                child: InteractiveAnnouncementCard(
                                  title: '绥院Linux爱好者团队全新升级',
                                  date: '2024-05-03',
                                  content: '为方便大家交流学习，绥院Linux爱好者团队全面升级，启用多平台交流群（QQ、微信，云湖，telegram等），以及Google Groups邮件列表，建立 GitHub 仓库统一上传文件，并启用了官方网站，欢迎大家加入！',
                                  sections: [
                                    AnnouncementSection(
                                      title: '简介',
                                      content: '新的绥院Linux爱好者团队以 QQ 群和官网为主体，多种交流平台共存的大型交流互助社区。用户可以选择最方便的平台交流，官方动态统一通过官网发布；文件统一使用 GitHub 团队仓库或 123 云盘分享。',
                                    ),
                                    AnnouncementSection(
                                      title: '信息的发布',
                                      content: '官方信息将在官网首发，并以链接形式转发到各交流群。官网博客仓库位置：linux-shxy.github.io/blog.html/。添加动态时，只需按本格式在上一条动态上方继续添加即可。',
                                    ),
                                    AnnouncementSection(
                                      title: '文件的分享',
                                      content: '官方文件将统一上传至 GitHub 团队仓库或 123 云盘，文件链接将在官网发布。GitHub 团队仓库位置：github.com/linux-shxy/file-store。',
                                    ),
                                    AnnouncementSection(
                                      title: '各平台联系方式',
                                      content: 'QQ交流群：1052859099\n微信群：微信群二维码在QQ群公告中\n云湖：https://yunhu.org/groups/123456\nTelegram：https://t.me/linux_shxy\nGoogle Groups：https://groups.google.com/g/linux-shxy\nGitHub：https://github.com/linux-shxy\n官网：https://linux-shxy.github.io',
                                    ),
                                    AnnouncementSection(
                                      title: '如何加入',
                                      content: '1. 选择你方便的交流平台加入\n2. 遵守各平台的规则\n3. 积极参与交流和分享\n4. 共同维护团队的和谐氛围',
                                    ),
                                    AnnouncementSection(
                                      title: '致谢',
                                      content: '感谢所有为团队发展做出贡献的成员，感谢大家的支持和参与！',
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: AppTheme.spacingLarge),
                               
                              // 第二个公告卡片
                              FadeInAnimation(
                                delay: 900,
                                child: InteractiveAnnouncementCard(
                                  title: '技术沙龙活动通知',
                                  date: '2024-10-18',
                                  content: '本次技术沙龙将邀请资深开源开发者分享Linux系统管理经验，欢迎大家参加！',
                                  details: [
                                    '时间：2024年10月22日 19:00-21:00',
                                    '地点：绥化学院 实验楼B座508',
                                  ],
                                ),
                              ),
                              SizedBox(height: AppTheme.spacingLarge),
                               
                              // 第三个公告卡片
                              FadeInAnimation(
                                delay: 1200,
                                child: InteractiveAnnouncementCard(
                                  title: 'Linux系统安装指南',
                                  date: '2024-04-15',
                                  content: '为了帮助新手快速上手Linux系统，我们整理了一份详细的安装指南，包含常见发行版的安装步骤和注意事项。',
                                  details: [
                                    '支持的发行版：Ubuntu、Fedora、Debian、Arch Linux',
                                    '安装介质：U盘（推荐）或光盘',
                                    '系统要求：至少2GB内存，20GB硬盘空间',
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // 右侧空白区域
              if (constraints.maxWidth > 768)
                Expanded(
                  child: Container(
                    color: const Color(0xFF0a0a0a),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class AnnouncementSection {
  final String title;
  final String content;

  AnnouncementSection({
    required this.title,
    required this.content,
  });
}

// 交互式公告卡片组件
class InteractiveAnnouncementCard extends StatefulWidget {
  final String title;
  final String date;
  final String content;
  final List<String>? details;
  final List<AnnouncementSection>? sections;

  const InteractiveAnnouncementCard({
    Key? key,
    required this.title,
    required this.date,
    required this.content,
    this.details,
    this.sections,
  }) : super(key: key);

  @override
  _InteractiveAnnouncementCardState createState() => _InteractiveAnnouncementCardState();
}

class _InteractiveAnnouncementCardState extends State<InteractiveAnnouncementCard> {
  bool _isExpanded = false;
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () => setState(() => _isExpanded = !_isExpanded),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          padding: EdgeInsets.all(AppTheme.spacingLarge),
          decoration: BoxDecoration(
            color: AppTheme.cardColor,
            borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
            boxShadow: _isHovered ? [
              BoxShadow(
                color: AppTheme.primaryColor.withOpacity(0.3),
                offset: Offset(0, 10),
                blurRadius: 20,
              ),
            ] : [AppTheme.defaultShadow],
            border: Border.all(
              color: _isHovered ? AppTheme.primaryColor : Colors.transparent,
              width: 2,
            ),
          ),
          transform: Matrix4.identity()..scale(_isHovered ? 1.02 : 1.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      widget.title,
                      style: AppTheme.heading3,
                    ),
                  ),
                  SizedBox(width: AppTheme.spacingMedium),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: AppTheme.spacingMedium, vertical: AppTheme.spacingSmall),
                    decoration: BoxDecoration(
                      color: AppTheme.surfaceColor,
                      borderRadius: BorderRadius.circular(AppTheme.borderRadiusSmall),
                    ),
                    child: Text(
                      widget.date,
                      style: AppTheme.bodyTextSmall,
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppTheme.spacingMedium),
              Text(
                widget.content,
                style: AppTheme.bodyText,
                textAlign: TextAlign.justify,
              ),

              // 可折叠的详情部分
              if ((widget.details != null && widget.details!.isNotEmpty) ||
                  (widget.sections != null && widget.sections!.isNotEmpty))
                Column(
                  children: [
                    SizedBox(height: AppTheme.spacingMedium),
                    GestureDetector(
                      onTap: () => setState(() => _isExpanded = !_isExpanded),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            _isExpanded ? '收起详情' : '查看详情',
                            style: AppTheme.bodyText.copyWith(
                              color: AppTheme.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: AppTheme.spacingSmall),
                          AnimatedRotation(
                            turns: _isExpanded ? 0.5 : 0,
                            duration: Duration(milliseconds: 300),
                            child: Icon(
                              Icons.arrow_drop_down,
                              color: AppTheme.primaryColor,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // 展开动画
                    AnimatedCrossFade(
                      duration: Duration(milliseconds: 300),
                      firstChild: Container(),
                      secondChild: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: AppTheme.spacingMedium),
                          if (widget.details != null && widget.details!.isNotEmpty)
                            ...widget.details!.map((detail) => Padding(
                                  padding: EdgeInsets.only(bottom: AppTheme.spacingSmall),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(right: AppTheme.spacingSmall, top: 6),
                                        width: 4,
                                        height: 4,
                                        decoration: BoxDecoration(
                                          color: AppTheme.primaryColor,
                                          borderRadius: BorderRadius.circular(2),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          detail,
                                          style: AppTheme.bodyText,
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                          if (widget.sections != null && widget.sections!.isNotEmpty)
                            ...widget.sections!.map((section) => Padding(
                                  padding: EdgeInsets.only(bottom: AppTheme.spacingLarge),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        section.title,
                                        style: AppTheme.heading3.copyWith(fontSize: AppTheme.fontSizeLarge),
                                      ),
                                      SizedBox(height: AppTheme.spacingSmall),
                                      Text(
                                        section.content,
                                        style: AppTheme.bodyText,
                                        textAlign: TextAlign.justify,
                                      ),
                                    ],
                                  ),
                                )),
                        ],
                      ),
                      crossFadeState: _isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                    ),
                  ],
                ),
            ],
          ),
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

// 旋转动画组件
class AnimatedRotation extends StatefulWidget {
  final Widget child;
  final double turns;
  final Duration duration;

  const AnimatedRotation({
    Key? key,
    required this.child,
    required this.turns,
    required this.duration,
  }) : super(key: key);

  @override
  _AnimatedRotationState createState() => _AnimatedRotationState();
}

class _AnimatedRotationState extends State<AnimatedRotation> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: AlwaysStoppedAnimation(widget.turns),
      builder: (context, child) {
        return Transform.rotate(
          angle: widget.turns * 2 * 3.14159,
          child: child,
        );
      },
      child: widget.child,
    );
  }
}
