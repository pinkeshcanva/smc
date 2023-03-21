// import 'package:flutter/material.dart';
// import '../../utils/colors.dart';
// import '../../utils/screen_utils.dart';
//
// class ProfileScreen extends StatefulWidget {
//   const ProfileScreen({Key? key}) : super(key: key);
//
//   @override
//   _ProfileScreenState createState() => _ProfileScreenState();
// }
//
// class _ProfileScreenState extends State<ProfileScreen> {
//   TextEditingController lastScreeningController = TextEditingController();
//   TextEditingController lastBSEController = TextEditingController();
//   TextEditingController nameController = TextEditingController();
//   TextEditingController ageController = TextEditingController();
//
//   String nameErrorMsg = "";
//   String ageErrorMsg = "";
//
//   String lastScreening = '';
//   String lastBSE = '';
//   String email = '';
//   String name = '';
//   String age = '';
//   String lastScreeningErrorMsg = "";
//   String lastBSEErrorMsg = "";
//
//   bool cancerHistory = false;
//   bool edit = false;
//
//   setData() {
//
//   }
//
//   @override
//   void initState() {
//     logoutBloc.getLoadData(false);
//     setData();
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     lastScreeningController.clear();
//     lastBSEController.clear();
//     nameController.clear();
//     ageController.clear();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           SingleChildScrollView(
//             child: Container(
//               height: Screen.screenHeight + Screen.screenHeight * 0.07,
//               child: Stack(
//                 children: [
//                   logoWidget(
//                     nameController.text,
//                     '',
//                     () => setState(() => edit = true),
//                     () => logout(context),
//                   ),
//                   Padding(
//                     padding: paddingAll(20.0),
//                     child: Column(
//                       children: [
//                         verticalSpace(Screen.screenHeight * 0.35),
//                         FieldAndLabel(
//                           labelValue: txt_name,
//                           hint: txt_please_enter_name,
//                           inputType: TextInputType.text,
//                           controller: nameController,
//                           readOnly: !edit,
//                           validationMessage: nameErrorMsg,
//                           fillColor: white,
//                           rightIcon:
//                               icons(icon: Icons.person, color: iconTextColor),
//                           onChanged: (value) {
//                             setState(() {
//                               nameErrorMsg = nameValidationMsg(value);
//                             });
//                           },
//                         ),
//                         verticalSpace(23.0),
//                         FieldAndLabel(
//                           labelValue: txt_age,
//                           hint: txt_please_enter_age,
//                           inputType: TextInputType.number,
//                           controller: ageController,
//                           validationMessage: ageErrorMsg,
//                           readOnly: !edit,
//                           fillColor: white,
//                           onChanged: (value) {
//                             setState(() {
//                               ageErrorMsg = nameValidationMsg(value);
//                             });
//                           },
//                         ),
//                         verticalSpace(23.0),
//                         StreamBuilder(
//                           initialData: profileEditBloc
//                               .getBreastCancerError(cancerHistory),
//                           stream: profileEditBloc.breastCancerStream,
//                           builder: (BuildContext context,
//                               AsyncSnapshot<dynamic> snapshot) {
//                             if (snapshot.hasData) {
//                               cancerHistory = snapshot.data;
//                               return Column(
//                                 children: [
//                                   yesNoSelectionProfile(cancerHistory),
//                                   verticalSpace(23.0),
//                                   if (cancerHistory)
//                                     textFieldWithDatePicker(
//                                       context,
//                                       controller: lastScreeningController,
//                                       label: txt_last_screening,
//                                       text: lastScreening,
//                                       click: edit,
//                                       error: lastScreeningErrorMsg,
//                                     ),
//                                   if (cancerHistory) verticalSpace(23.0),
//                                   if (cancerHistory)
//                                     textFieldWithDatePicker(
//                                       context,
//                                       controller: lastBSEController,
//                                       label: txt_last_bse,
//                                       text: lastBSE,
//                                       click: edit,
//                                       error: lastBSEErrorMsg,
//                                     ),
//                                 ],
//                               );
//                             } else {
//                               return Container();
//                             }
//                           },
//                         ),
//                         verticalSpace(23.0),
//                         if (edit)
//                           filledButton(
//                             label: txt_submit,
//                             onTap: () async {
//                               bool valid = true;
//                               if (cancerHistory &&
//                                   (lastScreeningController.text == '' ||
//                                       lastBSEController.text == '')) {
//                                 valid = false;
//                                 showDialog(
//                                   context: context,
//                                   builder: (context) => Dialog(
//                                     shape: RoundedRectangleBorder(
//                                         borderRadius:
//                                             BorderRadius.circular(8.0)),
//                                     child: Padding(
//                                       padding: paddingAll(20.0),
//                                       child: labels(
//                                         text: txt_select_date,
//                                         size: 16.0,
//                                         fontWeight: FontWeight.w600,
//                                       ),
//                                     ),
//                                   ),
//                                 );
//                               }
//                               if (cancerHistory &&
//                                   lastScreeningController.text != '' &&
//                                   lastBSEController.text != '') {
//                                 int nsd =
//                                     stringToDate(lastScreeningController.text)
//                                         .day;
//                                 int nsm =
//                                     stringToDate(lastScreeningController.text)
//                                         .month;
//                                 int nsy =
//                                     stringToDate(lastScreeningController.text)
//                                             .year +
//                                         1;
//                                 int nbd =
//                                     stringToDate(lastBSEController.text).day;
//                                 int nbm =
//                                     stringToDate(lastBSEController.text).month +
//                                         1;
//                                 int nby =
//                                     stringToDate(lastBSEController.text).year;
//
//                                 NotificationService().setNotification(
//                                   5,
//                                   msg: "You have your SCREENING Tomorrow",
//                                   year: nsy,
//                                   month: nsm,
//                                   day: nsd,
//                                 );
//                                 NotificationService().setNotification(
//                                   7,
//                                   msg: "You have your BSE Tomorrow",
//                                   year: nby,
//                                   month: nbm,
//                                   day: nbd,
//                                 );
//                               }
//                               if (valid) {
//                                 await AppPreference.put(
//                                     db_name, nameController.text);
//                                 await AppPreference.put(
//                                     db_age, ageController.text);
//                                 await AppPreference.put(
//                                     db_lastScreen,
//                                     cancerHistory
//                                         ? lastScreeningController.text
//                                         : '');
//                                 await AppPreference.put(
//                                     db_lastBse,
//                                     cancerHistory
//                                         ? lastBSEController.text
//                                         : '');
//
//                                 String key =
//                                     await AppPreference.getString(db_key);
//                                 db.child(db_profiles).child(key).update({
//                                   'name': nameController.text,
//                                   'age': ageController.text,
//                                   'lastScreen': cancerHistory
//                                       ? lastScreeningController.text
//                                       : '',
//                                   'lastBse': cancerHistory
//                                       ? lastBSEController.text
//                                       : '',
//                                   'cancerHistory': cancerHistory,
//                                 });
//                                 setState(() {
//                                   edit = false;
//                                   setData();
//                                 });
//                                 showDialog(
//                                   context: context,
//                                   builder: (context) => Dialog(
//                                     shape: RoundedRectangleBorder(
//                                         borderRadius:
//                                             BorderRadius.circular(8.0)),
//                                     child: Padding(
//                                       padding: paddingAll(20.0),
//                                       child: labels(
//                                         text: txt_edit_successfully,
//                                         size: 16.0,
//                                         fontWeight: FontWeight.w600,
//                                       ),
//                                     ),
//                                   ),
//                                 );
//                               }
//                             },
//                             width: Screen.screenWidth * 0.8,
//                           ),
//                         verticalSpace(Screen.bottomHeight)
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           StreamBuilder(
//             stream: logoutBloc.loadDataStream,
//             builder: (context, snapshot) {
//               return snapshot.hasData && snapshot.data
//                   ? fullScreenCircularIndicator
//                   : Container();
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
