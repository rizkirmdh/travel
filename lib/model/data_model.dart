class DataModel{
  String name;
  String img;
  int price;
  int people;
  int stars;
  String description;
  String location;

  DataModel({
    required this.name,
    required this.img,
    required this.price,
    required this.people,
    required this.stars,
    required this.description,
    required this.location,
  });
}

var dataList = [
  DataModel(
      name: "British Columbia",
      img: "images/f9d4b5e088c7bc70b7bbd51cd89e71b6.jpeg",
      price: 1276,
      people: 5,
      stars: 4,
      description: "This 134 kilometers Highway 99 trail gives you a taste of the Canada mountains, from Horseshoe Bay in the north of Vancouver to Pemberton. ",
      location: "Canada, British Columbia"),
  DataModel(
      name: "Icefields",
      img: "images/1a2d25d3c5ea7912982e37b8005bbebe.jpeg",
      price: 2153,
      people: 5,
      stars: 5,
      description: "This stretches for a straight 234 kilometers from Banff to Jasper. The Icefields Parkway offers you the picturesque panorama of Alberta’s most talked about mountain vistas. ",
      location: "Icefields, Alberta"),

  DataModel(
      name: "Moraine Lake",
      img: "images/9a4079ae9e67ca51b9fdf4670a5795f4.jpeg",
      price: 3456,
      people: 5,
      stars: 3,
      description: "Moraine Lake is yet another astonishing geographical location that you cannot afford to miss out on if you’re traveling along the Icefields Parkway. ",
      location: "Moraine Lake, Alberta"),

  DataModel(
      name: "Ontario",
      img: "images/24fe838b325456a0ca7fc2249409de3f.jpeg",
      price: 3312,
      people: 5,
      stars: 4,
      description: "If you’re in Canada and if you’re a sucker for mountains, Killarney Provincial Park in Ontario is your best catch for Canada mountains near Toronto. ",
      location: "Killarney Provincial Park"),
];