import 'package:cherryish/screens/donor/widgets/bottomNavBar.dart';
import 'package:cherryish/screens/donor/widgets/bottomNavBar.dart';
import 'package:flutter/material.dart';
class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      bottomNavigationBar: BottomBar(context),
    );
  }
}

// import 'package:flutter/material.dart';

// /// Flutter code sample for [CustomScrollView].

// void main() => runApp(const HistoryPage());

// class HistoryPage extends StatelessWidget {
//   const HistoryPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp();
//   }
// }

// class HistoryPageState extends StatefulWidget {
//   const HistoryPageState({super.key});

//   @override
//   State<HistoryPageState> createState() => _DonorShopPageState();
// }

// class _DonorShopPageState extends State<HistoryPageState> {
//   List<String> items = List.generate(5, (index) => "Item $index");
//   Widget _buildItem(int index) {
//     return Container(
//       color: Colors.black,
//       child:  Image(height: 600,width: 500,image: AssetImage('assets/images/img1.jpg'),)
      
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('DONOR SHOP PAGE'),
//       ),
//       body: CustomScrollView(
//         slivers: [
//           SliverPadding(
//             padding: EdgeInsets.all(8.0),
//             sliver: SliverGrid(
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 mainAxisSpacing: 8.0,
//                 crossAxisSpacing: 8.0,
//                 childAspectRatio:1.0, // adjust this value for item aspect ratio
//               ),
//               delegate: SliverChildBuilderDelegate(
//                 (BuildContext context, int index) {
//                   return _buildItem(index);
//                 },
//                 childCount: items.length,
//               ),
//             ),
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           setState(() {
//             items.add("New Item");
//           });
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }
