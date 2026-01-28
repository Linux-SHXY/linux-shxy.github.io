import 'package:flutter/material.dart';
import 'pages/about_us_page.dart';
import 'pages/join_us_page.dart';
import 'pages/announcement_page.dart';
import 'pages/latest_news_page.dart';
import 'pages/resources_page.dart';
import 'pages/blog_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '绥院Linux爱好者团队',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF111111),
        primarySwatch: Colors.purple,
        colorScheme: ColorScheme.dark(
          primary: const Color(0xFF5b20e6),
          secondary: const Color(0xFF6f6f6f),
          background: const Color(0xFF111111),
          surface: const Color(0xFF222222),
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onBackground: Colors.white,
          onSurface: Colors.white,
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
          headlineLarge: TextStyle(color: Colors.white),
          headlineMedium: TextStyle(color: Colors.white),
          headlineSmall: TextStyle(color: Colors.white),
        ),
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            TargetPlatform.linux: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
            TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
          },
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/about_us': (context) => AboutUsPage(),
        '/join_us': (context) => JoinUsPage(),
        '/announcement': (context) => AnnouncementPage(),
        '/latest_news': (context) => LatestNewsPage(),
        '/resources': (context) => ResourcesPage(),
        '/blog': (context) => BlogPage(
              title: 'Linux社2024年招新活动圆满结束',
              content: '本次招新活动共有120余名同学报名，经过面试选拔，最终有50名同学加入了Linux社。新成员将在接下来的培训中学习Linux系统基础、编程技术和开源项目开发等内容。',
            ),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/img/logo.jpg',
                width: 200,
                height: 200,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 20),
              const Text(
                'Suihua University Linux Enthusiast Team',
                style: TextStyle(
                  fontFamily: 'Monospace',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  '新的绥院Linux爱好者团队以 QQ 群和官网为主体，多种交流平台共存的大型交流互助社区。用户可以选择最方便的平台交流，官方动态统一通过官网发布；文件统一使用 GitHub 团队仓库或 123 云盘分享。GitHub 仓库：https://github.com/Linux-SHXY官网：https://linux.shxy.tuneful.org.cn',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, height: 1.5),
                ),
              ),
              const SizedBox(height: 40),
              // 导航按键区域
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  alignment: WrapAlignment.center,
                  children: [
                    _buildNavButton(context, '关于我们', () {
                      Navigator.pushNamed(context, '/about_us');
                    }),
                    _buildNavButton(context, '加入我们', () {
                      Navigator.pushNamed(context, '/join_us');
                    }),
                    _buildNavButton(context, '揭示板', () {
                      Navigator.pushNamed(context, '/announcement');
                    }),
                    _buildNavButton(context, '最新动态', () {
                      Navigator.pushNamed(context, '/latest_news');
                    }),
                    _buildNavButton(context, '资源下载', () {
                      Navigator.pushNamed(context, '/resources');
                    }),
                    _buildNavButton(context, '博客', () {
                      Navigator.pushNamed(context, '/blog');
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavButton(BuildContext context, String title, VoidCallback onTap) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF5b20e6),
        foregroundColor: Colors.white,  // 显式设置文字颜色为白色
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 4,
        shadowColor: const Color(0xFF5b20e6).withOpacity(0.3),
      ),
      child: Text(title),
    );
  }
}

class ResponsiveSecondaryLayout extends StatelessWidget {
  final Widget child;
  
  const ResponsiveSecondaryLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // 根据屏幕宽度计算内容区域宽度，最大80%，最小90%屏幕宽度
        double contentWidth = constraints.maxWidth * 0.9;
        if (constraints.maxWidth > 1200) {
          contentWidth = constraints.maxWidth * 0.8;
        } else if (constraints.maxWidth > 768) {
          contentWidth = constraints.maxWidth * 0.85;
        }
        
        return Center(
          child: Container(
            width: contentWidth,
            decoration: const BoxDecoration(
              color: Color(0xFF111111),
            ),
            child: child,
          ),
        );
      },
    );
  }
}

class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('绥院Linux爱好者团队'),
      backgroundColor: const Color(0xFF111111),
    );
  }

  Widget _buildNavItem(BuildContext context, String title, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: InkWell(
        onTap: onTap,
        splashColor: Colors.purple.withOpacity(0.3),
        borderRadius: BorderRadius.circular(5),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}












