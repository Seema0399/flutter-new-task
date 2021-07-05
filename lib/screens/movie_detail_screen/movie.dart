import 'package:flutter/material.dart';

class Movie {
  String title;
  String description;

  int year;

  Movie(
      {@required this.title, @required this.description, @required this.year});
}

List<Movie> movieList = [
  Movie(
      title: 'Nanban',
      description:
          'Nanban is a 2012 Indian Tamil -language coming-of-age comedy-drama film directed by Shankar.',
      year: 2012),
  Movie(
      title: 'Eetti',
      description:
          'Eetti  is a sports action film written and directed by Ravi Arasu and produced by S. Michael Rayappan.',
      year: 2015),
  Movie(
      title: 'ImaikaNodikal',
      description:
          'Imaikkaa Nodigal psychological action thriller film which has Nayanthara, Atharvaa, Anurag Kashyap, and Raashi Khanna in leading roles.',
      year: 2018),
  Movie(
      title: 'Comali',
      description:
          'Comali is a comedy film produced by Vels Film International and written and directed by Pradeep Ranganathan in his directorial debut.',
      year: 2019),
  Movie(
      title: 'Adangamaru',
      description:
          'Adanga Maru is a action thriller film written and directed by Karthik Thangavel in his directorial debut.',
      year: 2018),
  Movie(
      title: 'Bigil',
      description:
          'Bigil is a Indiansports action film written and directed by Atlee and produced by Kalpathi S. Aghoram under the banner AGS Entertainment.',
      year: 2019),
  Movie(
      title: 'Mersal',
      description:
          'Mersal is a Malayalam action drama, starring Vijay and Samantha. The film is about an Indian doctor who returns home from Europe to solve a health threat that is looming over the country.',
      year: 2017),
  Movie(
      title: 'Sarkar',
      description:
          'Sarkar is an Tamil political, action movie directed by AR Murugadoss. The movie has Vijay and Keerthi Suresh in the lead roles.',
      year: 2018),
];
