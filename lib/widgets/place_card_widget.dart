import 'package:flutter/material.dart';
import '../models/place.dart';
import '../screens/isfavorite.dart';

enum PlaceCardType { place, favorite }

class PlaceCardWidget extends StatelessWidget {
  final Place place;
  final VoidCallback onCardTap;
  final VoidCallback onLikeTap;
  final ValueChanged<bool> onFavoriteChanged;
  final PlaceCardType cardType;

  const PlaceCardWidget({
    required this.place,
    required this.onCardTap,
    required this.onLikeTap,
    required this.onFavoriteChanged,
    this.cardType = PlaceCardType.place,
    super.key,
  });

  static const _cardHeight = 188.0;
  static const _imageHeight = 96.0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _cardHeight,
      child: Material(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: _imageHeight,
                      child: Image.network(
                        place.images.first,
                        fit: BoxFit.cover,
                        errorBuilder: (_, _, __) => Container(color: Colors.grey.shade300),
                      ),
                    ),
                    Positioned(
                      left: 16,
                      top: 16,
                      right: 12,
                      child: Text(
                        place.type.toLowerCase(),
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        place.name,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        place.description,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.grey,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned.fill(
              child: Material(
                type: MaterialType.transparency,
                child: InkWell(onTap: onCardTap),
              ),
            ),
            Positioned(
              top: 8,
              right: 16,
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: onLikeTap,
                child: FavoriteButton(
                  isFavorite: place.isFavorite,
                  onChanged: onFavoriteChanged, //callback
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}








































