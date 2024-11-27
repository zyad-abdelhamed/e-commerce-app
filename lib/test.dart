// import 'package:ee_commerce/core/global/localization/cubit/lan_cubit.dart';
// import 'package:ee_commerce/core/extentions/extention.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class Test extends StatelessWidget {
//   const Test({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => LanCubit.getinstance,
//       child: BlocBuilder<LanCubit, LanState>(
//         builder: (context, state) {
//           return Directionality(
//             textDirection:
//                 LanCubit.getinstance.isarabic() ? TextDirection.rtl : TextDirection.ltr,
//             child: Scaffold(
//               appBar: AppBar(
//                 title: Text('Test'),
//               ),
//               body: Stack(
//                 children: [
//                   Row(
//                     children: [
//                       Padding(
//                         padding:  EdgeInsets.only(right:  LanCubit.getinstance.isarabic() ? 20 : 0,left:LanCubit.getinstance.isarabic() ? 0 : 20 ),
//                         child: Text(
//                                            'home title'.lang,
//                                           ),
//                       ),
//                                          Text(
//                                           LanCubit.getinstance.localization['pro'] ?? '',
//                                         ),
//                     ],
//                   ),
//                   Center(
//                       child: Column(
//                         children: [
//                           ElevatedButton(
//                               onPressed: () {
//                                 LanCubit.getinstance.convertToArabic();
//                               },
//                               child: Text('converttoarabic')),
//                               ElevatedButton(
//                               onPressed: () {
//                                 LanCubit.getinstance.convertToEnglish();
//                               },
//                               child: Text('converttoenglish')),
//                         ],
//                       )),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
