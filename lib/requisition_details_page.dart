// import 'package:flutter/material.dart';
//
// class RequisitionDetailsPage extends StatefulWidget {
//   const RequisitionDetailsPage({super.key});
//
//   @override
//   State<RequisitionDetailsPage> createState() =>
//       _RequisitionDetailsPageState();
// }
//
// class _RequisitionDetailsPageState extends State<RequisitionDetailsPage> {
//   String skill = '.Net';
//   String department = 'IT & Automation';
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF2F2F2),
//       body: SafeArea(
//         child: Column(
//           children: [
//             _header(),
//             Expanded(
//               child: SingleChildScrollView(
//                 padding: const EdgeInsets.all(16),
//                 child: Column(
//                   children: [
//                     _dropdown("Position Title", "Consulting - .Net"),
//                     _dropdown("Position Criticality", "Critical"),
//                     _rowFields(
//                       _dropdown("Main Skill Set", skill),
//                       _dropdown("Department Name", department),
//                     ),
//                     _dropdown("Position Location", "Head Office"),
//                     _rowFields(
//                       _textField("Number Of Position"),
//                       _textField("Additional Skillset"),
//                     ),
//                     _rowFields(
//                       _textField("Band"),
//                       _textField("To Be Filled (Days)"),
//                     ),
//                     _rowFields(
//                       _textField("Salary (Lakh/Yr)"),
//                       _textField("Experience (Years)"),
//                     ),
//                     const SizedBox(height: 16),
//                     _approvalHistory(),
//                     const SizedBox(height: 16),
//                     _remarkBox(),
//                     const SizedBox(height: 80),
//                   ],
//                 ),
//               ),
//             ),
//             _bottomButtons()
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _header() {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: const BoxDecoration(
//         color: Color(0xFF4B1D5A),
//         borderRadius: BorderRadius.only(
//           bottomLeft: Radius.circular(20),
//           bottomRight: Radius.circular(20),
//         ),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: const [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text("Mr. Your Name",
//                   style: TextStyle(color: Colors.white)),
//               Text("yourname@gmail.com",
//                   style: TextStyle(color: Colors.white70)),
//             ],
//           ),
//           SizedBox(height: 12),
//           Wrap(
//             spacing: 8,
//             children: [
//               _ChipText("REQ/12-2025/001"),
//               _ChipText("Consulting Manager"),
//               _ChipText("IT & Automation"),
//             ],
//           ),
//           SizedBox(height: 8),
//           Text("Requisition Date : 12 Jan 2025",
//               style: TextStyle(color: Colors.white70)),
//         ],
//       ),
//     );
//   }
//
//   Widget _dropdown(String label, String value) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(label),
//         const SizedBox(height: 6),
//         Container(
//           padding: const EdgeInsets.symmetric(horizontal: 12),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: DropdownButtonHideUnderline(
//             child: DropdownButton<String>(
//               value: value,
//               items: [value]
//                   .map((e) =>
//                   DropdownMenuItem(value: e, child: Text(e)))
//                   .toList(),
//               onChanged: (_) {},
//             ),
//           ),
//         ),
//         const SizedBox(height: 12),
//       ],
//     );
//   }
//
//   Widget _textField(String label) {
//     return Expanded(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(label),
//           const SizedBox(height: 6),
//           TextField(
//             decoration: InputDecoration(
//               filled: true,
//               fillColor: Colors.white,
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10),
//                 borderSide: BorderSide.none,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _rowFields(Widget a, Widget b) {
//     return Row(
//       children: [
//         a,
//         const SizedBox(width: 12),
//         b,
//       ],
//     );
//   }
//
//   Widget _approvalHistory() {
//     return Container(
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: const [
//           Text("Approval History",
//               style: TextStyle(fontWeight: FontWeight.bold)),
//           SizedBox(height: 8),
//           Text("Mr. Ajay S S : Approved (13 Jan 2025)",
//               style: TextStyle(color: Colors.green)),
//           Text("Mr. Amit S P : Pending",
//               style: TextStyle(color: Colors.orange)),
//         ],
//       ),
//     );
//   }
//
//   Widget _remarkBox() {
//     return Container(
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text("Correction Remark"),
//           const SizedBox(height: 8),
//           TextField(
//             maxLines: 3,
//             decoration: InputDecoration(
//               hintText: "Enter Remark",
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10),
//               ),
//             ),
//           ),
//           const SizedBox(height: 12),
//           Center(
//             child: ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: const Color(0xFF4B1D5A),
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(20)),
//               ),
//               onPressed: () {},
//               child: const Text("Submit"),
//             ),
//           )
//         ],
//       ),
//     );
//   }
//
//   Widget _bottomButtons() {
//     return Container(
//       padding: const EdgeInsets.all(12),
//       child: Row(
//         children: [
//           Expanded(
//             child: ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: const Color(0xFF4B1D5A),
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(25)),
//               ),
//               onPressed: () {},
//               child: const Text("Send Back For Correction"),
//             ),
//           ),
//           const SizedBox(width: 12),
//           Expanded(
//             child: OutlinedButton(
//               style: OutlinedButton.styleFrom(
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(25)),
//               ),
//               onPressed: () {},
//               child: const Text("Approve"),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class _ChipText extends StatelessWidget {
//   final String text;
//   const _ChipText(this.text);
//
//   @override
//   Widget build(BuildContext context) {
//     return Chip(
//       label: Text(text),
//       backgroundColor: Colors.white,
//     );
//   }
// }
