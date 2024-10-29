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
      backgroundColor: Colors.grey.shade900,
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
                      Flexible(
                        child: Text(
                          movie.title,
                          style: TextStyle(color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.normal),
                        ),
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
      body: ListView(
        children: [
          MovieDetailsThumbnail(movie.images[0]),
          MovieDetailsHeaderWithPoster(movie)
        ],
      )
      // body: Center(
      //   child: Container(
      //     child: ElevatedButton(onPressed: () {
      //       Navigator.pop(context);
      //     }, child: Text('Go back: ${this.movie.director}')),
      //   ),
      // ),
    );
  }
}

//thumbnail in the movie page, with a play icon
class MovieDetailsThumbnail extends StatelessWidget {
  // const MovieDetailsThumbnail({super.key});
  final String thumbnail;

  const MovieDetailsThumbnail(this.thumbnail);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 190,
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(thumbnail), fit: BoxFit.cover)
              ),
            ),
            Icon(Icons.play_circle_outlined, size: 100, color: Colors.white,)
          ],
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Color(0x00f5f5f5), Color(0xfff5f5f5)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter)
          ),
        )
      ],
    );
  }
}


//Header section in the movie page, with poster
class MovieDetailsHeaderWithPoster extends StatelessWidget {
  // const MovieDetailsHeaderWithPoster({super.key});

  final Movie movie;

  MovieDetailsHeaderWithPoster(this.movie);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          MoviePoster(poster: movie.images[0].toString())
        ],
      ),
    );
  }

}

class MoviePoster extends StatelessWidget {
  // const MoviePoster({super.key});

  final String poster;

  const MoviePoster({required this.poster});

  @override
  Widget build(BuildContext context) {
    // var borderRadius = BorderRadius.all(Radius.circular(10));
    return Card(
      child: ClipRect(
        child: Container(
          width: MediaQuery.of(context).size.width / 3,
          height: 200,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(poster), fit: BoxFit.cover), borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}


//end of movie app