class City {
  bool isSelected;
  final String city;
  final String country;
  final bool isDefault;

  City(
      {required this.isSelected,
      required this.city,
      required this.country,
      required this.isDefault});

  // List of Ctiy
  static List<City> citiesList = [
    City(
        isSelected: true, city: 'Ha Noi', country: 'Viet Nam', isDefault: true),
    City(
        isSelected: true, city: 'Ha Noi', country: 'Viet Nam', isDefault: true),
    City(
        isSelected: true, city: 'Ha Noi', country: 'Viet Nam', isDefault: true),
    City(
        isSelected: false,
        city: 'Ha Noi',
        country: 'Viet Nam',
        isDefault: true),
    City(
        isSelected: false,
        city: 'Ha Noi',
        country: 'Viet Nam',
        isDefault: true),
    City(
        isSelected: false,
        city: 'Ha Noi',
        country: 'Viet Nam',
        isDefault: true),
  ];

  // Get the selected cities
  static List<City> getSelectedCities() {
    List<City> selectedCitites = City.citiesList;
    return selectedCitites.where((city) => city.isSelected == true).toList();
  }
}
