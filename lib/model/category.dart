class Category {
  final String name;
  final int numOfMinutes;
  final String image;

  Category(this.name, this.numOfMinutes, this.image);
}

List<Category> categories = categoriesData
    .map((item) => Category(item['name'], item['courses'], item['image']))
    .toList();

var categoriesData = [
  {"name": "React", 'courses': 17, 'image': "assets/images/react.jpg"},
  {"name": "UX Design", 'courses': 25, 'image': "assets/images/ux_design.png"},
  {
    "name": "Business Analytics",
    'courses': 17,
    'image': "assets/images/businessAnalytics.jpg"
  },
  {"name": "Python", 'courses': 17, 'image': "assets/images/python.png"},
  {"name": "AI", 'courses': 13, 'image': "assets/images/photography.png"},
  {
    "name": "Cloud Computing",
    'courses': 17,
    'image': "assets/images/cloudComputing.jpg"
  },
  {
    "name": "Computer Security",
    'courses': 17,
    'image': "assets/images/computerSecurity.jpg"
  },
];
