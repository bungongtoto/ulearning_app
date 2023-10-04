import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/routes/routes.dart';
import 'package:ulearning_app/common/utils/app_styles.dart';
import 'package:ulearning_app/global.dart';

Future<void> main() async {
  await Global.init();
  runApp(const ProviderScope(child: MyApp()));
}

final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(392.72727272727275, 783.2727272727273),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        ScreenUtil.init(context);
        return MaterialApp(
          navigatorKey: navKey,
          title: 'Flutter Demo',
          theme: AppTheme.appThemeData,
          initialRoute: "/",
          onGenerateRoute: AppPages.generateRouteSettings,
        );
      },
    );
  }
}

final appCount = StateProvider<int>((ref) {
  return 1;
});

// class MyHomePage extends ConsumerWidget {
//   const MyHomePage({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     int count = ref.watch(appCount);
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: const Text('Riverpod App'),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               count.toString(),
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           FloatingActionButton(
//             heroTag: 'one',
//             onPressed: () {
//               Navigator.of(context).push(MaterialPageRoute(
//                   builder: (BuildContext context) => const SecondPage()));
//             },
//             tooltip: 'Increment',
//             child: const Icon(Icons.arrow_right_rounded),
//           ),
//           FloatingActionButton(
//             heroTag: 'two',
//             onPressed: () {
//               ref.read(appCount.notifier).state++;
//             },
//             tooltip: 'Increment',
//             child: const Icon(Icons.add),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class SecondPage extends ConsumerWidget {
//   const SecondPage({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     int count = ref.watch(appCount);
//     return Scaffold(
//       appBar: AppBar(),
//       body: Center(
//         child: Text(
//           '$count',
//           style: const TextStyle(fontSize: 30),
//         ),
//       ),
//     );
//   }
// }
