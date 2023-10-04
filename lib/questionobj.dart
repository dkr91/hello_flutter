class QuestionObject {
  String narration;
  String photo;
  String option_a;
  String option_b;
  String option_c;
  String option_d;
  String answer;

  QuestionObject(this.narration, this.photo, this.option_a, this.option_b, this.option_c, this.option_d, this.answer);
}

var questions = [
  QuestionObject("Not a member of Avenger ", "https://upload.wikimedia.org/wikipedia/id/0/0d/Avengers_Endgame_poster.jpg",
      'Ironman', 'Spiderman', 'Thor', 'Hulk Hogan', 'Hulk Hogan'),
  QuestionObject("Not a member of Teletubbies", "https://static.wikia.nocookie.net/telletubbies/images/c/cc/Teletubbies.jpg/revision/latest?cb=20120613192735",
      'Dipsy', 'Patrick', 'Laalaa', 'Poo', 'Patrick'),
  QuestionObject("Not a member of justice league", "https://upload.wikimedia.org/wikipedia/en/6/6b/Justice_League_%28film%29_poster.jpg",
      'batman', 'superman', 'flash', 'aquades', 'aquades'),
  QuestionObject("Not a member of DC Justice League Villain", "https://www.giantfreakinrobot.com/wp-content/uploads/2021/06/dc-supervillains-900x506.jpg",
      'Ironman', 'Joker', 'Pinguin', 'Rhino', 'Ironman'),
  QuestionObject("Which one is DC Justice League Villain", "https://www.giantfreakinrobot.com/wp-content/uploads/2021/06/dc-supervillains-900x506.jpg",
      'Two-face', 'Patrick', 'Laalaa', 'Poo', 'Two-face'),
  QuestionObject("Not a member of Marvel Villain", "https://helios-i.mashable.com/imagery/articles/02cPKJdMAxR8K6TzkG9GvBo/hero-image.fill.size_1248x702.v1683295428.jpg",
      'Ultron', 'Joker', 'Dr Doom', 'Thanos', 'Joker'),
  QuestionObject("Which one is Marvel Villain", "https://helios-i.mashable.com/imagery/articles/02cPKJdMAxR8K6TzkG9GvBo/hero-image.fill.size_1248x702.v1683295428.jpg",
      'Two-face', 'Kang The Conqueror', 'Laalaa', 'Poo', 'Kang The Conqueror'),
  QuestionObject("Not a hobbit trilogy", "https://www.google.com/url?sa=i&url=https%3A%2F%2Fcollider.com%2Fchanges-in-peter-jacksons-the-hobbit-trilogy-from-the-lotr-book%2F&psig=AOvVaw09g8OHDn1Kpxux3pUxbzzn&ust=1696477157887000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCMC8j4S824EDFQAAAAAdAAAAABAD",
      'An Unexpected Journey', 'The Desolation of Smaug', 'The Battle of Five Armies', 'The Chamber of Secrets', 'The Chamber of Secrets'),
  QuestionObject("Not a Lord of The Ring trilogy", "https://www.google.com/url?sa=i&url=https%3A%2F%2Fmovfreak.blogspot.com%2F2012%2F01%2Flord-of-rings-trilogy.html&psig=AOvVaw3KMfV0RXaArZMMFrfJM7St&ust=1696477175724000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCKjpvoy824EDFQAAAAAdAAAAABAD",
      'The Fellowship of the Ring', 'The Return of the King', 'The Two Towers', 'The Battle of Five Armies', 'The Battle of Five Armies'),
  QuestionObject("Which one is an elf in the hobbit trilogy", "https://www.nme.com/wp-content/uploads/2022/11/lee-pace-1-696x442.jpg",
      'Thranduil', 'Odin', 'Bilbo Baggins', 'Gandalf', 'Thranduil'),
];

