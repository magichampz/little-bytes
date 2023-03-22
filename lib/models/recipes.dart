class Recipe {
  final int RecipeId;
  final int price;
  final String size;
  final double rating;
  final int humidity;
  final String temperature;
  final String category;
  final String RecipeName;
  final String imageURL;
  bool isFavorated;
  final String decription;
  bool isSelected;

  Recipe(
      {required this.RecipeId,
      required this.price,
      required this.category,
      required this.RecipeName,
      required this.size,
      required this.rating,
      required this.humidity,
      required this.temperature,
      required this.imageURL,
      required this.isFavorated,
      required this.decription,
      required this.isSelected});

  //List of Recipes data
  static List<Recipe> RecipeList = [
    Recipe(
        RecipeId: 0,
        price: 22,
        category: 'Mush',
        RecipeName: 'Mushy Oats',
        size: 'Small',
        rating: 4.5,
        humidity: 34,
        temperature: '23 - 34',
        imageURL: 'assets/images/Recipe-one.png',
        isFavorated: true,
        decription:
            'This Recipe is one of the best Recipe. It grows in most of the regions in the world and can survive'
            'even the harshest weather condition.',
        isSelected: false),
    Recipe(
        RecipeId: 1,
        price: 11,
        category: 'Outdoor',
        RecipeName: 'Philodendron',
        size: 'Medium',
        rating: 4.8,
        humidity: 56,
        temperature: '19 - 22',
        imageURL: 'assets/images/Recipe-two.png',
        isFavorated: false,
        decription:
            'This Recipe is one of the best Recipe. It grows in most of the regions in the world and can survive'
            'even the harshest weather condition.',
        isSelected: false),
    Recipe(
        RecipeId: 2,
        price: 18,
        category: 'Indoor',
        RecipeName: 'Beach Daisy',
        size: 'Large',
        rating: 4.7,
        humidity: 34,
        temperature: '22 - 25',
        imageURL: 'assets/images/Recipe-three.png',
        isFavorated: false,
        decription:
            'This Recipe is one of the best Recipe. It grows in most of the regions in the world and can survive'
            'even the harshest weather condition.',
        isSelected: false),
    Recipe(
        RecipeId: 3,
        price: 30,
        category: 'Outdoor',
        RecipeName: 'Big Bluestem',
        size: 'Small',
        rating: 4.5,
        humidity: 35,
        temperature: '23 - 28',
        imageURL: 'assets/images/Recipe-one.png',
        isFavorated: false,
        decription:
            'This Recipe is one of the best Recipe. It grows in most of the regions in the world and can survive'
            'even the harshest weather condition.',
        isSelected: false),
    Recipe(
        RecipeId: 4,
        price: 24,
        category: 'Recommended',
        RecipeName: 'Big Bluestem',
        size: 'Large',
        rating: 4.1,
        humidity: 66,
        temperature: '12 - 16',
        imageURL: 'assets/images/Recipe-four.png',
        isFavorated: true,
        decription:
            'This Recipe is one of the best Recipe. It grows in most of the regions in the world and can survive'
            'even the harshest weather condition.',
        isSelected: false),
    Recipe(
        RecipeId: 5,
        price: 24,
        category: 'Outdoor',
        RecipeName: 'Meadow Sage',
        size: 'Medium',
        rating: 4.4,
        humidity: 36,
        temperature: '15 - 18',
        imageURL: 'assets/images/Recipe-five.png',
        isFavorated: false,
        decription:
            'This Recipe is one of the best Recipe. It grows in most of the regions in the world and can survive'
            'even the harshest weather condition.',
        isSelected: false),
    Recipe(
        RecipeId: 6,
        price: 19,
        category: 'Garden',
        RecipeName: 'Plumbago',
        size: 'Small',
        rating: 4.2,
        humidity: 46,
        temperature: '23 - 26',
        imageURL: 'assets/images/Recipe-six.png',
        isFavorated: false,
        decription:
            'This Recipe is one of the best Recipe. It grows in most of the regions in the world and can survive'
            'even the harshest weather condition.',
        isSelected: false),
    Recipe(
        RecipeId: 7,
        price: 23,
        category: 'Garden',
        RecipeName: 'Tritonia',
        size: 'Medium',
        rating: 4.5,
        humidity: 34,
        temperature: '21 - 24',
        imageURL: 'assets/images/Recipe-seven.png',
        isFavorated: false,
        decription:
            'This Recipe is one of the best Recipe. It grows in most of the regions in the world and can survive'
            'even the harshest weather condition.',
        isSelected: false),
    Recipe(
        RecipeId: 8,
        price: 46,
        category: 'Recommended',
        RecipeName: 'Tritonia',
        size: 'Medium',
        rating: 4.7,
        humidity: 46,
        temperature: '21 - 25',
        imageURL: 'assets/images/Recipe-eight.png',
        isFavorated: false,
        decription:
            'This Recipe is one of the best Recipe. It grows in most of the regions in the world and can survive'
            'even the harshest weather condition.',
        isSelected: false),
  ];

  //Get the favorated items
  static List<Recipe> getFavoritedRecipes() {
    List<Recipe> _travelList = Recipe.RecipeList;
    return _travelList.where((element) => element.isFavorated == true).toList();
  }

  //Get the cart items
  static List<Recipe> addedToCartRecipes() {
    List<Recipe> _selectedRecipes = Recipe.RecipeList;
    return _selectedRecipes
        .where((element) => element.isSelected == true)
        .toList();
  }
}
