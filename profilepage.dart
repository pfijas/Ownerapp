// import 'package:flutter/material.dart';
//
// class ProfilePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Profile'),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             SizedBox(height: 20),
//             CircleAvatar(
//               radius: 80,
//               backgroundImage: NetworkImage(
//                 'https://via.placeholder.com/150',
//               ),
//             ),
//             SizedBox(height: 20),
//             Text(
//               'John Doe',
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 10),
//             Text(
//               'Frontend Developer',
//               style: TextStyle(
//                 fontSize: 16,
//                 color: Colors.grey[600],
//               ),
//             ),
//             SizedBox(height: 30),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 20),
//               child: Card(
//                 elevation: 4,
//                 child: ListTile(
//                   leading: Icon(Icons.email),
//                   title: Text('johndoe@example.com'),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 20),
//               child: Card(
//                 elevation: 4,
//                 child: ListTile(
//                   leading: Icon(Icons.phone),
//                   title: Text('123-456-7890'),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 20),
//               child: Card(
//                 elevation: 4,
//                 child: ListTile(
//                   leading: Icon(Icons.location_on),
//                   title: Text('123 Main Street, City, Country'),
//                 ),
//               ),
//             ),
//             SizedBox(height: 30),
//             ElevatedButton(
//               onPressed: () {
//                 // Add your logout logic here
//               },
//               style: ElevatedButton.styleFrom(
//                 primary: Colors.blueGrey,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//               ),
//               child: Text('Logout'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
