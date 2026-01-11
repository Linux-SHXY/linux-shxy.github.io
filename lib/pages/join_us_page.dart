import 'package:flutter/material.dart';
import '../theme.dart';
import '../main.dart';

class JoinUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('加入我们'),
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
                    '加入我们',
                    style: AppTheme.heading2,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: AppTheme.spacingLarge),
                  Text(
                    'Linux爱好者协会欢迎你的加入！',
                    style: AppTheme.bodyText,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: AppTheme.spacingXLarge),
                  
                  // 协会优势
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(AppTheme.spacingLarge),
                    decoration: BoxDecoration(
                      color: AppTheme.cardColor,
                      borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
                      boxShadow: [AppTheme.defaultShadow],
                    ),
                    child: Column(
                      children: [
                        Text(
                          '协会优势',
                          style: AppTheme.heading3,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: AppTheme.spacingMedium),
                        Wrap(
                          alignment: WrapAlignment.center,
                          spacing: AppTheme.spacingMedium,
                          runSpacing: AppTheme.spacingMedium,
                          children: [
                            _buildAdvantageItem(
                              icon: Icons.code,
                              title: '技术提升',
                              description: '学习Linux系统、编程技术和开源项目',
                            ),
                            _buildAdvantageItem(
                              icon: Icons.group,
                              title: '团队合作',
                              description: '参与项目开发，培养团队协作能力',
                            ),
                            _buildAdvantageItem(
                              icon: Icons.lightbulb,
                              title: '创新思维',
                              description: '激发创新意识，解决实际问题',
                            ),
                            _buildAdvantageItem(
                              icon: Icons.network_cell,
                              title: '人脉拓展',
                              description: '结识志同道合的朋友和行业专家',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: AppTheme.spacingXLarge),
                  
                  // 加入条件
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(AppTheme.spacingLarge),
                    decoration: BoxDecoration(
                      color: AppTheme.cardColor,
                      borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
                      boxShadow: [AppTheme.defaultShadow],
                    ),
                    child: Column(
                      children: [
                        Text(
                          '加入条件',
                          style: AppTheme.heading3,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: AppTheme.spacingMedium),
                        Column(
                          children: [
                            _buildRequirementItem(
                              text: '对Linux系统和开源技术有兴趣',
                            ),
                            _buildRequirementItem(
                              text: '具有良好的学习态度和团队合作精神',
                            ),
                            _buildRequirementItem(
                              text: '能够按时参加协会活动和项目开发',
                            ),
                            _buildRequirementItem(
                              text: '有一定的编程基础者优先',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: AppTheme.spacingXLarge),
                  
                  // 加入方式
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(AppTheme.spacingLarge),
                    decoration: BoxDecoration(
                      color: AppTheme.cardColor,
                      borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
                      boxShadow: [AppTheme.defaultShadow],
                    ),
                    child: Column(
                      children: [
                        Text(
                          '加入方式',
                          style: AppTheme.heading3,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: AppTheme.spacingMedium),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildStepItem(
                              step: '1',
                              text: '填写加入申请表',
                            ),
                            _buildStepItem(
                              step: '2',
                              text: '参加面试或技术考核',
                            ),
                            _buildStepItem(
                              step: '3',
                              text: '通过考核后正式加入协会',
                            ),
                          ],
                        ),
                        SizedBox(height: AppTheme.spacingLarge),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              // 跳转到申请页面或显示申请表单
                              _showApplicationForm(context);
                            },
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
                            child: Text('立即申请加入'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: AppTheme.spacingXLarge),
                  
                  // 联系我们
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(AppTheme.spacingLarge),
                    decoration: BoxDecoration(
                      color: AppTheme.cardColor,
                      borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
                      boxShadow: [AppTheme.defaultShadow],
                    ),
                    child: Column(
                      children: [
                        Text(
                          '联系我们',
                          style: AppTheme.heading3,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: AppTheme.spacingMedium),
                        Column(
                          children: [
                            _buildContactItem(
                              icon: Icons.email,
                              text: 'linuxclub@example.com',
                            ),
                            _buildContactItem(
                              icon: Icons.phone,
                              text: '138-0000-0000',
                            ),
                            _buildContactItem(
                              icon: Icons.location_on,
                              text: '学校科技楼A座501室',
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
      ),
    );
  }
  
  Widget _buildAdvantageItem({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Container(
      width: 200,
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
                icon,
                color: AppTheme.primaryColor,
                size: 30,
              ),
            ),
          ),
          SizedBox(height: AppTheme.spacingSmall),
          Text(
            title,
            style: AppTheme.heading4,
          ),
          SizedBox(height: AppTheme.spacingSmall),
          Text(
            description,
            style: AppTheme.bodyTextSmall,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
  
  Widget _buildRequirementItem({
    required String text,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppTheme.spacingSmall),
      child: Row(
        children: [
          Icon(
            Icons.check_circle,
            color: AppTheme.primaryColor,
            size: 20,
          ),
          SizedBox(width: AppTheme.spacingSmall),
          Text(
            text,
            style: AppTheme.bodyText,
          ),
        ],
      ),
    );
  }
  
  Widget _buildStepItem({
    required String step,
    required String text,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppTheme.spacingSmall),
      child: Row(
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppTheme.primaryColor,
            ),
            child: Center(
              child: Text(
                step,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          SizedBox(width: AppTheme.spacingSmall),
          Text(
            text,
            style: AppTheme.bodyText,
          ),
        ],
      ),
    );
  }
  
  Widget _buildContactItem({
    required IconData icon,
    required String text,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppTheme.spacingSmall),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: AppTheme.primaryColor,
            size: 20,
          ),
          SizedBox(width: AppTheme.spacingSmall),
          Text(
            text,
            style: AppTheme.bodyText,
          ),
        ],
      ),
    );
  }
  
  void _showApplicationForm(BuildContext context) {
    // 这里可以实现显示申请表单的逻辑
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('加入申请表'),
        content: Text('申请表单功能正在开发中，请通过邮箱或电话联系我们！'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('确定'),
          ),
        ],
      ),
    );
  }
}