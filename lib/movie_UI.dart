import 'package:flutter/material.dart';

import 'movie.dart';

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
          MoviePoster(poster: movie.images[0].toString()),
          SizedBox(width: 16,),
          Expanded(child: MovieDetailsHeader(movie: movie)),
          // MovieDetailsCast(movie: movie)
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
          width: MediaQuery.of(context).size.width / 4,
          height: 150,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(poster), fit: BoxFit.cover), borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}

class MovieDetailsHeader extends StatelessWidget {
  // const MovieDetailsHeader({super.key});

  final Movie movie;

  MovieDetailsHeader({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('${movie.year} . ${movie.genre}'.toUpperCase(),
          style: TextStyle(
              fontWeight: FontWeight.w400,
              color: Colors.grey.shade700,
              fontSize: 12
          ),),
        Text(
          movie.title,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
        ),
        Text.rich(TextSpan(style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            children: [
              TextSpan(text: movie.plot),
              TextSpan(text: 'more...', style: TextStyle(color: Colors.blue))
            ]))
      ],
    );
  }
}

class MovieDetailsCast extends StatelessWidget {
  const MovieDetailsCast({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MovieField(field: "Cast", value: movie.actors),
          MovieField(field: "Directors", value: movie.director),
          MovieField(field: "Awards", value: movie.awards)
        ],
      ),
    );
  }
}

class MovieField extends StatelessWidget {
  const MovieField({super.key, required this.field, required this.value});

  final String field;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("$field : ", style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.w300),),
        Expanded(child: Text(value, style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.w300),))
      ],
    );
  }
}

class HorizontalLine extends StatelessWidget {
  const HorizontalLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:16.0, vertical: 12.0),
      child: Container(
        height: 0.5,
        color: Colors.grey,
      ),
    );
  }
}

class MovieExtraPosters extends StatelessWidget {
  const MovieExtraPosters ({super.key, required this.posters});

  final List posters;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "More Movie Posters".toUpperCase(),
            style: TextStyle(fontSize: 14, color: Colors.black38),
          ),
          Container(
            height: 200,
            padding: EdgeInsets.symmetric(vertical: 12),
            //listview.separated creates a scrollable list
            child: ListView.separated(
              scrollDirection: Axis.vertical,
              separatorBuilder: (context, index) => SizedBox(height: 8,), //what separates each item
              itemCount: posters.length, //how many items
              itemBuilder: (context, index) => ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Container(
                  width: MediaQuery.of(context).size.width / 4,
                  height: 160,
                  decoration: BoxDecoration(
                      image:
                      DecorationImage(image: NetworkImage(posters[index]),
                          fit: BoxFit.cover)),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
