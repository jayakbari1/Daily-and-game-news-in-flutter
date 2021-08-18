import 'package:flutter/material.dart';

class Search extends SearchDelegate {
  final List APIsnews;

  Search(this.APIsnews);

  @override
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? APIsnews
        : APIsnews.where((element) =>
                element['title'].toString().toLowerCase().startsWith(query))
            .toList();

    return ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context, index) {
          return Card(
            child: Container(
              height: 130,
              margin: EdgeInsets.symmetric(horizontal: 1, vertical: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 200,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      children: <Widget>[
                        Text(
                          suggestionList[index]['title'],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Image.network(
                          suggestionList[index]['imgUrl'],
                          height: 50,
                          width: 60,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:scadgame_news_app/utils/colors.dart';
//
// class SearchBar extends StatefulWidget {
//   const SearchBar({Key key}) : super(key: key);
//
//   @override
//   _SearchBarState createState() => _SearchBarState();
// }
//
// class _SearchBarState extends State<SearchBar> {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Expanded(
//           child: Container(
//             height: 50,
//             margin: EdgeInsets.all(10),
//             padding: EdgeInsets.only(left: 20),
//             decoration: BoxDecoration(
//               color: AppColors.white,
//               borderRadius: BorderRadius.circular(50),
//             ),
//             child: Center(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   SizedBox(
//                     width: 10,
//                   ),
//                   Expanded(
//                     child: TextField(
//                       decoration: InputDecoration(
//                         hintText: 'Search Keyword or Phrases',
//                         hintStyle: GoogleFonts.lato(),
//                         border: InputBorder.none,
//
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//         Container(
//           width: 45,
//           height: 45,
//           decoration: BoxDecoration(
//             color: AppColors.darkgrey,
//             shape: BoxShape.circle,
//           ),
//           child: Icon(
//             Icons.search,
//             color: AppColors.white,
//           ),
//         ),
//         SizedBox(
//           width: 10,
//         ),
//       ],
//     );
//   }
// }
