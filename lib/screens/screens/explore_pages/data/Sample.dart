// import 'package:flutter_photography/models/Collocation.dart';
// import 'package:flutter_photography/models/Post.dart';
// import 'package:flutter_photography/models/User.dart';

import 'package:test2/models/Collocation.dart';
import 'package:test2/models/Post.dart';
import 'package:test2/models/User.dart';

class Sample {
  static User vedant = User(
    name: "Vedant Jadhav",
    username: "@venomxx",
    followers: 400,
    following: 190,
    profilePicture: "assets/users/vedant.jpg",
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
            location: "Mumbai, India",
            dateAgo: "3 min ago",
            photos: [
              'assets/photos/one.jpg',
              'assets/photos/two.jpg',
              'assets/photos/three.jpg',
            ]
          ),
          Post(
            location: "Delhi, India",
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
            location: "Paris, France",
            dateAgo: "3 min ago",
            photos: [
              'assets/photos/one.jpg',
              'assets/photos/two.jpg',
              'assets/photos/three.jpg',
            ]
          ),
          Post(
            location: "LA, USA",
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

  static User virat = User(
    name: "Virat Kohli",
    username: "@iamviratkohli",
    followers: 400,
    following: 190,
    profilePicture: "assets/users/virat.jpg",
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
            location: "Banglore, India",
            dateAgo: "3 min ago",
            photos: [
              'assets/photos/five.jpg',
              'assets/photos/six.jpg',
              'assets/photos/seven.jpg',
            ]
          ),
          Post(
            location: "Lords, London, UK",
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
    user: vedant,
    location: "Mumbai, India",
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
     user: virat,
    location: "Delhi, India",
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