// import 'package:flutter/material.dart';
// import 'package:raksha/common/widgets/buttons.dart';
// import 'package:raksha/common/widgets/icon_and_images.dart';
// import 'package:raksha/common/widgets/padding_margin.dart';
// import 'package:raksha/common/widgets/text_and_styles.dart';
// import 'package:raksha/screens/profile_screen/profile_screen_bloc.dart';
// import 'package:raksha/screens/registration_screen/registration_screen_widget.dart';
// import 'package:raksha/utils/icons.dart';
// import 'package:raksha/utils/strings.dart';
//
// import '../../utils/colors.dart';
// import '../../utils/images.dart';
// import '../../utils/screen_utils.dart';
//
// Widget logoWidget(
//   String name,
//   String from,
//   Function onTap,
//   Function onTapLogout,
// ) =>
//     Container(
//       height: Screen.screenHeight * 0.5,
//       child: Stack(
//         fit: StackFit.expand,
//         children: [
//           Images.instance.assetImage(
//             name: loginBackGround,
//             fit: BoxFit.cover,
//           ),
//           Padding(
//             padding: paddingOnly(top: Screen.screenHeight * 0.08),
//             child: Column(
//               children: [
//                 CircleAvatar(
//                   radius: 35.0,
//                   backgroundImage: Images.instance.assetImageProvider(
//                     name: round_logo,
//                   ),
//                 ),
//                 nameWidget(name),
//                 fromWidget(from),
//               ],
//             ),
//           ),
//           Align(
//             alignment: Alignment.topLeft,
//             child: Padding(
//               padding: paddingOnly(
//                 top: Screen.screenHeight * 0.1,
//                 left: 15.0,
//               ),
//               child: GestureDetector(
//                 onTap: onTap,
//                 child: Images.instance.assetImage(
//                   name: ic_edit,
//                   width: 30.0,
//                   height: 30.0,
//                   color: white,
//                   fit: BoxFit.fill,
//                 ),
//               ),
//             ),
//           ),
//           Align(
//             alignment: Alignment.topRight,
//             child: Padding(
//               padding: paddingOnly(
//                 top: Screen.screenHeight * 0.1,
//                 right: 15.0,
//               ),
//               child: GestureDetector(
//                 onTap: onTapLogout,
//                 child: Images.instance.assetImage(
//                   name: ic_logout,
//                   width: 30.0,
//                   height: 30.0,
//                   color: white,
//                   fit: BoxFit.fill,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//
// Widget nameWidget(String name) => labels(
//       text: name,
//       color: darkTextColor,
//       fontWeight: FontWeight.w700,
//       textAlign: TextAlign.start,
//       size: 26.0,
//     );
//
// Widget fromWidget(String from) => labels(
//       text: from,
//       color: fromTextColor,
//       fontWeight: FontWeight.w600,
//       textAlign: TextAlign.start,
//       size: 14.0,
//     );
//
//
// Widget yesNoSelectionProfile(bool yesNo) {
//   return Row(
//     mainAxisAlignment: MainAxisAlignment.spaceAround,
//     children: [
//       yesNo ? fillBtn(txt_yes, true) : borderBtn(txt_yes, true),
//       !yesNo ? fillBtn(txt_no, false) : borderBtn(txt_no, false),
//     ],
//   );
// }
//
// Widget fillBtn(String label, bool ans) => filledButton(
//   label: label,
//   onTap: () {
//     profileEditBloc.getBreastCancerError(ans);
//   },
//   width: Screen.screenWidth * 0.35,
// );
//
// Widget borderBtn(String label, bool ans) => borderButton(
//   label: label,
//   onTap: () {
//     profileEditBloc.getBreastCancerError(ans);
//   },
//   width: Screen.screenWidth * 0.35,
// );
