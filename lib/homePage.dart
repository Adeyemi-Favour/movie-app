import 'package:flutter/material.dart';

import 'movie.dart';

class homePage extends StatelessWidget {
  // const homePage({super.key});

  final List <Movie> movieList = Movie.getMovies();

  final List movies = [
    'Avatar',
    'Spongebob',
    'Tinkerbell',
    'Snow White',
    'Cinderella',
    'Beauty and the Beast',
    'Wish',
    'Coco',
    'Tarzan',
    'The Wolf of Wall Street'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text(
          'Movies',
          style: TextStyle(fontSize: 18),
        ),
        backgroundColor: Colors.grey.shade900,
      ),
      //allows to create rows in a list
      //must take in 2 parameters (BuildContext context, int index)
      //must return a widget, for this project we are returning a card which is a widget under listview
      body: ListView.builder(
          itemCount: movieList.length,
          itemBuilder: (BuildContext context, int index) {
            return movieCard(movieList[index], context);
            // return Card(
            //   elevation: 1,
            //   color: Colors.white,
            //   child: ListTile(
            //     leading: CircleAvatar(
            //       backgroundColor: Colors.grey.shade100,
            //       child: Container(
            //         width: 200,
            //         height: 200,
            //         decoration: BoxDecoration(
            //           image: DecorationImage(image: NetworkImage(movieList[index].images[0]),
            //           fit: BoxFit.cover),
            //           borderRadius: BorderRadius.circular(12),
            //         ),
            //         child: null,
            //       ),
            //     ),
            //     trailing: Text('...'),
            //     title: Text(
            //       movieList[index].title,
            //       style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            //     ),
            //     subtitle: Row(
            //       mainAxisSize: MainAxisSize.min,
            //       children: [
            //         // Text(
            //         //   'Language:',
            //         //   style: TextStyle(fontSize: 12),
            //         // ),
            //         // SizedBox(
            //         //   width: 5,
            //         // ),
            //         // CountryFlag.fromCountryCode(
            //         //   'us',
            //         //   width: 15,
            //         //   height: 15,
            //         // ),
            //         // SizedBox(
            //         //   width: 5,
            //         // ),
            //         // Text('English')
            //         Text("${movieList[0].title}")
            //       ],
            //     ),
            //     onTap: (){
            //       Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //               builder: (context) => movieListDetails(
            //                     movieName: movieList[index].title,
            //                 movie: movieList[index],
            //                   )));
            //     },
            //     // onTap: () => debugPrint('Movie name: ${movies.elementAt(index)}'),
            //   ),
            // );
          }),
    );
  }

  Widget movieCard (Movie movie, BuildContext context){
    return InkWell(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 120.0,
        child: Card(
          color: Colors.black45,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 54.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      movie.title,
                      // style: TextStyle(color: Colors.white),
                    ),
                    Text("Rating: ${movie.imdbRating} / 11")
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// new route or screen
class movieListDetails extends StatelessWidget {
  // const movieListDetails({super.key});

  final String movieName;
  final Movie movie;

  const movieListDetails({super.key, required this.movieName, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white
        ),
        title: Text(
          'Movies',
          style: TextStyle(fontSize: 18),
        ),
        backgroundColor: Colors.grey.shade900,
      ),
      body: Center(
        child: Container(
          child: ElevatedButton(onPressed: () {
            Navigator.pop(context);
          }, child: Text('Go back: ${this.movie.director}')),
        ),
      ),
    );
  }
}
