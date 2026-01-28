import 'package:flutter/material.dart';
import '../theme.dart';

class ResourcesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('资源下载'),
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
                              Text(
                                '资源下载',
                                style: AppTheme.heading2,
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: AppTheme.spacingLarge),
                              Text(
                                'Linux学习资源和工具下载',
                                style: AppTheme.bodyText,
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: AppTheme.spacingXLarge),
                              
                              // 资源分类标签
                              Container(
                                margin: EdgeInsets.only(bottom: AppTheme.spacingLarge),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      _buildCategoryButton('全部'),
                                      SizedBox(width: AppTheme.spacingSmall),
                                      _buildCategoryButton('系统镜像'),
                                      SizedBox(width: AppTheme.spacingSmall),
                                      _buildCategoryButton('学习文档'),
                                      SizedBox(width: AppTheme.spacingSmall),
                                      _buildCategoryButton('开发工具'),
                                      SizedBox(width: AppTheme.spacingSmall),
                                      _buildCategoryButton('实用软件'),
                                      SizedBox(width: AppTheme.spacingSmall),
                                      _buildCategoryButton('代码示例'),
                                    ],
                                  ),
                                ),
                              ),
                              
                              // 资源列表
                              Column(
                                children: [
                                  _buildResourceItem(
                                    title: 'Ubuntu 24.04 LTS 官方镜像',
                                    category: '系统镜像',
                                    size: '4.5 GB',
                                    downloads: '1500+',
                                    description: 'Ubuntu 24.04 LTS 长期支持版本官方镜像，适合学习和开发使用。',
                                    downloadUrl: 'https://ubuntu.com/download',
                                  ),
                                  SizedBox(height: AppTheme.spacingLarge),
                                  _buildResourceItem(
                                    title: 'Linux 命令行大全 (PDF)',
                                    category: '学习文档',
                                    size: '2.3 MB',
                                    downloads: '2800+',
                                    description: '全面的 Linux 命令行参考手册，适合初学者和进阶用户。',
                                    downloadUrl: 'https://example.com/linux-commands.pdf',
                                  ),
                                  SizedBox(height: AppTheme.spacingLarge),
                                  _buildResourceItem(
                                    title: 'VS Code Linux 版',
                                    category: '开发工具',
                                    size: '120 MB',
                                    downloads: '2100+',
                                    description: '强大的代码编辑器，支持多种编程语言和插件扩展。',
                                    downloadUrl: 'https://code.visualstudio.com/download',
                                  ),
                                  SizedBox(height: AppTheme.spacingLarge),
                                  _buildResourceItem(
                                    title: 'Docker 安装包',
                                    category: '实用软件',
                                    size: '80 MB',
                                    downloads: '1900+',
                                    description: '容器化技术平台，简化应用开发和部署流程。',
                                    downloadUrl: 'https://docs.docker.com/get-docker/',
                                  ),
                                  SizedBox(height: AppTheme.spacingLarge),
                                  _buildResourceItem(
                                    title: 'Shell 脚本示例集',
                                    category: '代码示例',
                                    size: '500 KB',
                                    downloads: '1200+',
                                    description: '常用 Shell 脚本示例，涵盖系统管理、自动化等方面。',
                                    downloadUrl: 'https://example.com/shell-scripts.zip',
                                  ),
                                ],
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
                    color: AppTheme.surfaceColor,
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
  
  Widget _buildCategoryButton(String category) {
    return ElevatedButton(
      onPressed: () {
        // 切换资源分类
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppTheme.primaryColor.withOpacity(0.2),
        foregroundColor: AppTheme.primaryColor,
        padding: EdgeInsets.symmetric(
          horizontal: AppTheme.spacingMedium,
          vertical: AppTheme.spacingSmall,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppTheme.borderRadiusSmall),
        ),
      ),
      child: Text(category),
    );
  }
  
  Widget _buildResourceItem({
    required String title,
    required String category,
    required String size,
    required String downloads,
    required String description,
    required String downloadUrl,
  }) {
    return FadeInAnimation(
      delay: 300,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppTheme.cardColor,
          borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
          boxShadow: [AppTheme.defaultShadow],
        ),
        child: Padding(
          padding: EdgeInsets.all(AppTheme.spacingMedium),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 资源标题和分类
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: AppTheme.heading4,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(width: AppTheme.spacingSmall),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppTheme.spacingSmall,
                      vertical: AppTheme.spacingSmall,
                    ),
                    decoration: BoxDecoration(
                      color: AppTheme.primaryColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(AppTheme.borderRadiusSmall),
                    ),
                    child: Text(
                      category,
                      style: AppTheme.bodyTextSmall.copyWith(
                        color: AppTheme.primaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppTheme.spacingSmall),
              // 资源描述
              Text(
                description,
                style: AppTheme.bodyText,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: AppTheme.spacingMedium),
              // 资源信息和下载按钮
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // 资源信息
                  Row(
                    children: [
                      // 文件大小
                      Row(
                        children: [
                          Icon(
                            Icons.folder_open_outlined,
                            size: 16,
                            color: AppTheme.textSecondaryColor,
                          ),
                          SizedBox(width: AppTheme.spacingSmall),
                          Text(
                            size,
                            style: AppTheme.bodyTextSmall.copyWith(
                              color: AppTheme.textSecondaryColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: AppTheme.spacingMedium),
                      // 下载次数
                      Row(
                        children: [
                          Icon(
                            Icons.download_outlined,
                            size: 16,
                            color: AppTheme.textSecondaryColor,
                          ),
                          SizedBox(width: AppTheme.spacingSmall),
                          Text(
                            downloads,
                            style: AppTheme.bodyTextSmall.copyWith(
                              color: AppTheme.textSecondaryColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  // 下载按钮
                  ElevatedButton.icon(
                    onPressed: () {
                      // 执行下载操作
                    },
                    icon: Icon(Icons.download),
                    label: Text('下载'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.primaryColor,
                      padding: EdgeInsets.symmetric(
                        horizontal: AppTheme.spacingLarge,
                        vertical: AppTheme.spacingMedium,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
                      ),
                    ),
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
