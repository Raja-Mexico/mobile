// import 'package:flutter/material.dart';
// import 'package:raja_mexico_app/utils/constants/_constants.dart';

// // TODO: Create custom dialog
// class CustomDialog extends StatefulWidget {
//   final Widget child;

//   const CustomDialog({
//     super.key,
//     required this.child,
//   });

//   @override
//   State<CustomDialog> createState() => _CustomDialogState();
// }

// class _CustomDialogState extends State<CustomDialog> {
//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       insetPadding: EdgeInsets.only(
//           bottom: MediaQuery.of(context).viewInsets.bottom * 0.5),
//       elevation: 0,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(16),
//       ),
//       backgroundColor: AppColor.white,
//       child: Container(
//         width: MediaQuery.of(context).size.width * 0.8,
//         height: MediaQuery.of(context).size.height * 0.3,
//         padding: const EdgeInsets.all(16),
//         child: widget.child,
//       ),
//     );
//   }
// }
