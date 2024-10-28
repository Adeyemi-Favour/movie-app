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
            return Stack(children: [
              movieCard(movieList[index], context),
              Positioned(
                top: 10.0,
                  child: movieImage(movieList[index].images[0])),
            ]);
          }),
    );
  }

  Widget movieCard (Movie movie, BuildContext context){
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(left: 60),
        width: MediaQuery.of(context).size.width,
        height: 120.0,
        child: Card(
          color: Colors.black45,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 54.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        movie.title,
                        style: TextStyle(color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.normal),
                      ),
                      Text("Rating: ${movie.imdbRating} / 10",
                        style: TextStyle(color: Colors.grey,
                          fontSize: 13,
                          fontWeight: FontWeight.normal),)
                    ],
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Released: ${movie.released}",
                        style: mainTextStyle(),
                      ),
                      Text(movie.runtime, style: mainTextStyle()),
                      Text(movie.rated, style:mainTextStyle())
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  movieListDetails(movieName: movie.title, movie: movie))),
    );
  }
}

TextStyle mainTextStyle() => TextStyle(
      color: Colors.grey,
      fontSize: 13,
      fontWeight: FontWeight.normal
);

Widget movieImage (String imageUrl){
  return Container(
    width: 100,
    height: 100,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      image: DecorationImage(image: NetworkImage(imageUrl ?? 'https://www.its.ac.id/tmesin/fasilitas/laboratorium-2/no-image/'),
      fit: BoxFit.cover)
    ),
  );
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
