// import 'package:flutter_photography/models/Collocation.dart';
// import 'package:flutter_photography/models/Post.dart';
// import 'package:flutter_photography/models/User.dart';

import 'package:test2/models/Collocation.dart';
import 'package:test2/models/Post.dart';
import 'package:test2/models/User.dart';

class Sample {
  static User mohammad = User(
    name: "Mohammad Rahmani",
    username: "@afgprogrammer",
    followers: 400,
    following: 190,
    profilePicture: "assets/users/mohammad.jpg",
    collocation: [
      Collocation(
        name: "Photography",
        tags: [
          "HD Photos",
          "Weather",
          "Photography"
        ],
        thumbnail: "assets/photos/one.jpg",
        posts: [
          Post(
            location: "Kabul, Afghanistan",
            dateAgo: "3 min ago",
            photos: [
              'assets/photos/one.jpg',
              'assets/photos/two.jpg',
              'assets/photos/three.jpg',
            ]
          ),
          Post(
            location: "Herat, Afghanistan",
            dateAgo: "2 week ago",
            photos: [
              'assets/photos/six.jpg',
              'assets/photos/eight.jpg',
              'assets/photos/two.jpg',
            ]
          )
        ]
      ),
      Collocation(
        name: "Photography",
        tags: [
          "HD Photos",
          "Weather",
          "Photography"
        ],
        thumbnail: "assets/photos/five.jpg",
        posts: [
          Post(
            location: "Kabul, Afghanistan",
            dateAgo: "3 min ago",
            photos: [
              'assets/photos/one.jpg',
              'assets/photos/two.jpg',
              'assets/photos/three.jpg',
            ]
          ),
          Post(
            location: "Herat, Afghanistan",
            dateAgo: "2 week ago",
            photos: [
              'assets/photos/six.jpg',
              'assets/photos/eight.jpg',
              'assets/photos/two.jpg',
            ]
          )
        ]
      ),
    ]
  );

  static User yasir = User(
    name: "Yasir Ahmad",
    username: "@yasirnoori.yn",
    followers: 400,
    following: 190,
    profilePicture: "assets/users/yasir.jpg",
    collocation: [
      Collocation(
        name: "Photography",
        tags: [
          "HD Photos",
          "Weather",
          "Photography"
        ],
        thumbnail: "assets/photos/two.jpg",
        posts: [
          Post(
            location: "Kabul, Afghanistan",
            dateAgo: "3 min ago",
            photos: [
              'assets/photos/five.jpg',
              'assets/photos/six.jpg',
              'assets/photos/seven.jpg',
            ]
          ),
          Post(
            location: "Herat, Afghanistan",
            dateAgo: "2 week ago",
            photos: [
              'assets/photos/six.jpg',
              'assets/photos/eight.jpg',
              'assets/photos/two.jpg',
            ]
          )
        ]
      ),
    ]
  );

  static Post postOne =  Post(
    user: mohammad,
    location: "Kabul, Afghanistan",
    dateAgo: "3 min ago",
    photos: [
      'assets/photos/one.jpg',
      'assets/photos/two.jpg',
      'assets/photos/three.jpg'
    ],
    relatedPhotos: [
      'assets/photos/four.jpg',
      'assets/photos/five.jpg',
      'assets/photos/six.jpg',
      'assets/photos/seven.jpg',
      'assets/photos/eight.jpg'
    ]
  );

  static Post postTwo =  Post(
     user: yasir,
    location: "Kabul, Afghanistan",
    dateAgo: "3 min ago",
    photos: [
      'assets/photos/four.jpg',
      'assets/photos/five.jpg',
      'assets/photos/six.jpg',
    ],
    relatedPhotos: [
      'assets/photos/one.jpg',
      'assets/photos/two.jpg',
      'assets/photos/three.jpg',
      'assets/photos/four.jpg',
      'assets/photos/five.jpg'
    ]
  );
}