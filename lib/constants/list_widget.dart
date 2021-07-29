// import 'package:flutter/material.dart';
//
// class ReusableWidget extends StatelessWidget {
//   final String? widgetText;
//   final String? widgetImage;
//
//   ReusableWidget({@required this.widgetText, @required this.widgetImage});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(
//         top: 18.0,
//         left: 16.0,
//         right: 16.0,
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // TextFormField(
//           //   controller: myController,
//           // ),
//           // TextFormField(),
//           // ElevatedButton(
//           //   onPressed: () {},
//           //   child: Text('Submit'),
//           // ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text('$widgetText',
//                   style: TextStyle(color: Colors.white, fontSize: 20)),
//               GestureDetector(onTap: () {}, child: Icon(Icons.more_vert)),
//             ],
//           ),
//           SizedBox(height: 20),
//           Container(
//             color: Colors.blue,
//             height: 180.0,
//             child: ListView.builder(
//                 shrinkWrap: true,
//                 scrollDirection: Axis.horizontal,
//                 itemCount: 5,
//                 itemBuilder: (BuildContext context, int index) {
//                   return Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Container(
//                       padding: EdgeInsets.all(8.0),
//                       decoration: BoxDecoration(
//                         image: DecorationImage(
//                             image: AssetImage('images/$widgetImage'),
//                             fit: BoxFit.fill),
//                         borderRadius: BorderRadius.circular(8),
//                         //color: Colors.red,
//                       ),
//                       width: 150,
//                     ),
//                   );
//                 }),
//           ),
//         ],
//       ),
//     );
//   }
// }
