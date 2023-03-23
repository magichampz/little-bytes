class Plant {
  final int plantId;
  final int time;
  final String age;
  final double rating;
  final int humidity;
  final String summary;
  final String category;
  final String plantName;
  final String imageURL;
  bool isFavorated;
  final String decription;
  bool isSelected;

  Plant(
      {required this.plantId,
      required this.time,
      required this.category,
      required this.plantName,
      required this.age,
      required this.rating,
      required this.humidity,
      required this.summary,
      required this.imageURL,
      required this.isFavorated,
      required this.decription,
      required this.isSelected});

  //List of Plants data
  static List<Plant> plantList = [
    Plant(
        plantId: 0,
        time: 10,
        category: 'Puree',
        plantName: 'Carrot Puree',
        age: '4-6 Months',
        rating: 4.5,
        humidity: 34,
        summary: 'A delicious variation for your little one',
        imageURL: 'assets/images/recipes/carrot_puree.jpg',
        isFavorated: true,
        decription:
            '1. Slice the carrots into half-moon shapes, 5 mm/¼ in thick. Steam or boil the carrots in a saucepan over a medium heat for 10–12 minutes until completely tender.\n\n'
            '2. Purée the carrots with 3–4 tablespoons of boiled water in a food processor, or using a hand blender, until completely smooth.',
        isSelected: false),
    Plant(
        plantId: 1,
        time: 10,
        category: 'Puree',
        plantName: 'Broccoli Puree',
        age: '4-6 Months',
        rating: 4.8,
        humidity: 56,
        summary: 'It\'s Broc-O\'Clock!',
        imageURL: 'assets/images/recipes/broccoli_puree.jpg',
        isFavorated: false,
        decription:
            '1. Steam or boil the broccoli in a saucepan over a medium heat for 8 minutes until very tender.\n\n'
            '2. Adding 2–3 tablespoons boiled water, purée the broccoli in a food processor, or using a hand blender, until smooth.',
        isSelected: false),
    Plant(
        plantId: 2,
        time: 18,
        category: 'Indoor',
        plantName: 'Beach Daisy',
        age: 'Large',
        rating: 4.7,
        humidity: 34,
        summary: '22 - 25',
        imageURL: 'assets/images/plant-three.png',
        isFavorated: false,
        decription:
            'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
            'even the harshest weather condition.',
        isSelected: false),
    Plant(
        plantId: 3,
        time: 30,
        category: 'Outdoor',
        plantName: 'Big Bluestem',
        age: 'Small',
        rating: 4.5,
        humidity: 35,
        summary: '23 - 28',
        imageURL: 'assets/images/plant-one.png',
        isFavorated: false,
        decription:
            'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
            'even the harshest weather condition.',
        isSelected: false),
    Plant(
        plantId: 4,
        time: 24,
        category: 'Recommended',
        plantName: 'Big Bluestem',
        age: 'Large',
        rating: 4.1,
        humidity: 66,
        summary: '12 - 16',
        imageURL: 'assets/images/plant-four.png',
        isFavorated: true,
        decription:
            'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
            'even the harshest weather condition.',
        isSelected: false),
    Plant(
        plantId: 5,
        time: 24,
        category: 'Outdoor',
        plantName: 'Meadow Sage',
        age: 'Medium',
        rating: 4.4,
        humidity: 36,
        summary: '15 - 18',
        imageURL: 'assets/images/plant-five.png',
        isFavorated: false,
        decription:
            'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
            'even the harshest weather condition.',
        isSelected: false),
    Plant(
        plantId: 6,
        time: 19,
        category: 'Garden',
        plantName: 'Plumbago',
        age: 'Small',
        rating: 4.2,
        humidity: 46,
        summary: '23 - 26',
        imageURL: 'assets/images/plant-six.png',
        isFavorated: false,
        decription:
            'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
            'even the harshest weather condition.',
        isSelected: false),
    Plant(
        plantId: 7,
        time: 23,
        category: 'Garden',
        plantName: 'Tritonia',
        age: 'Medium',
        rating: 4.5,
        humidity: 34,
        summary: '21 - 24',
        imageURL: 'assets/images/plant-seven.png',
        isFavorated: false,
        decription:
            'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
            'even the harshest weather condition.',
        isSelected: false),
    Plant(
        plantId: 8,
        time: 46,
        category: 'Recommended',
        plantName: 'Tritonia',
        age: 'Medium',
        rating: 4.7,
        humidity: 46,
        summary: '21 - 25',
        imageURL: 'assets/images/plant-eight.png',
        isFavorated: false,
        decription:
            'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
            'even the harshest weather condition.',
        isSelected: false),
  ];

  //Get the favorated items
  static List<Plant> getFavoritedPlants() {
    List<Plant> _travelList = Plant.plantList;
    return _travelList.where((element) => element.isFavorated == true).toList();
  }

  //Get the cart items
  static List<Plant> addedToCartPlants() {
    List<Plant> _selectedPlants = Plant.plantList;
    return _selectedPlants
        .where((element) => element.isSelected == true)
        .toList();
  }
}
