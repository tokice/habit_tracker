import 'package:flutter/material.dart';
import '../models/place.dart';
import '../widgets/place_card_widget.dart';

class HomeScreen extends StatefulWidget {  // Изменили на StatefulWidget
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Перенесли mockPlace в состояние
  final List<Place> mockPlace = [
    Place(
      name: 'Эрмитаж',
      description: 'Один из крупнейших художественных музеев мира',
      id: '1',
      type: 'музей',
      images: ['https://www.spbmuzei.ru/wp-content/uploads/2021/02/ermitag1.jpg'],
    ),
    Place(
      name: 'Макдак',
      description: 'Один из крупнейших художественных музеев мира',
      id: '2',
      type: 'музей',
      images: ['https://www.spbmuzei.ru/wp-content/uploads/2021/02/ermitag1.jpg'],
    ),
    Place(
      name: 'Эрмитаж',
      description: 'Один из крупнейших художественных музеев мира',
      id: '1',
      type: 'музей',
      images: ['https://www.spbmuzei.ru/wp-content/uploads/2021/02/ermitag1.jpg'],
    ),
    Place(
      name: 'Эрмитаж',
      description: 'Один из крупнейших художественных музеев мира',
      id: '1',
      type: 'музей',
      images: ['https://www.spbmuzei.ru/wp-content/uploads/2021/02/ermitag1.jpg'],
    ),
    Place(
      name: 'Эрмитаж',
      description: 'Один из крупнейших художественных музеев мира',
      id: '1',
      type: 'музей',
      images: ['https://www.spbmuzei.ru/wp-content/uploads/2021/02/ermitag1.jpg'],
    ),
    Place(
      name: 'Эрмитаж',
      description: 'Один из крупнейших художественных музеев мира',
      id: '1',
      type: 'музей',
      images: ['https://www.spbmuzei.ru/wp-content/uploads/2021/02/ermitag1.jpg'],
    ),
    Place(
      name: 'Эрмитаж',
      description: 'Один из крупнейших художественных музеев мира',
      id: '1',
      type: 'музей',
      images: ['https://www.spbmuzei.ru/wp-content/uploads/2021/02/ermitag1.jpg'],
    ),
    Place(
      name: 'Эрмитаж',
      description: 'Один из крупнейших художественных музеев мира',
      id: '1',
      type: 'музей',
      images: ['https://www.spbmuzei.ru/wp-content/uploads/2021/02/ermitag1.jpg'],
    ),
    Place(
      name: 'Эрмитаж',
      description: 'Один из крупнейших художественных музеев мира',
      id: '1',
      type: 'музей',
      images: ['https://www.spbmuzei.ru/wp-content/uploads/2021/02/ermitag1.jpg'],
    ),
  ];

  // Метод для сохранения в базу данных
  Future<void> _saveFavoriteStatus(String placeId, bool isFavorite) async {
    // Здесь реализация сохранения
    // Например: await SharedPreferences.getInstance().then((prefs) => prefs.setBool('fav_$placeId', isFavorite));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Surf Places'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: ListView.separated(
            itemCount: mockPlace.length,
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemBuilder: (context, index) {
              final place = mockPlace[index];
              return PlaceCardWidget(
                place: place,
                onCardTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('CARD!!')),
                  );
                },
                onLikeTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('LIKE!!')),
                  );
                },
                onFavoriteChanged: (isFavorite) {
                  setState(() {
                    place.isFavorite = isFavorite;
                  });
                  _saveFavoriteStatus(place.id, isFavorite);
                },
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.place_outlined), label: 'Места'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: 'Избранное'),
          BottomNavigationBarItem(icon: Icon(Icons.settings_outlined), label: 'Настройки'),
        ],
        onTap: (_) {},
      ),
    );
  }
}