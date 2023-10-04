import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/utils/app_colors.dart';
import 'package:ulearning_app/common/widgets/app_shadows.dart';
import 'package:ulearning_app/features/application/provider/notifier/application_nav_notifier.dart';
import 'package:ulearning_app/features/application/view/widgets/widgets.dart';

class Application extends ConsumerStatefulWidget {
  const Application({super.key});

  @override
  ConsumerState<Application> createState() => _ApplicationState();
}

class _ApplicationState extends ConsumerState<Application> {
  @override
  Widget build(BuildContext context) {
    ref.watch(applicationNavIndexProvider);
    int index = ref.watch(applicationNavIndexProvider);
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: appScreens(index: index),
          bottomNavigationBar: Container(
            width: 392.h,
            height: 55.h,
            decoration: appBoxShadowWithRadius(),
            child: BottomNavigationBar(
              currentIndex: index,
              onTap: (value) {
                ref
                    .read(applicationNavIndexProvider.notifier)
                    .changeIndex(value);
              },
              selectedItemColor: AppColors.primaryElement,
              elevation: 0,
              items: bottomTabs,
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              unselectedItemColor: AppColors.primaryFourElementText,
            ),
          ),
        ),
      ),
    );
  }
}
