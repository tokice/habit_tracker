import 'package:flutter/material.dart';

class FavoriteButton extends StatefulWidget {
  final bool isFavorite;
  final ValueChanged<bool> onChanged;

  const FavoriteButton({
    Key? key,
    required this.isFavorite,
    required this.onChanged,
  }) : super(key: key);

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  late bool _isFavorite;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        _isFavorite ? Icons.favorite : Icons.favorite_border,
        color: _isFavorite ? Colors.red : Colors.white,
      ),
      onPressed: () {
        setState(() {
          _isFavorite = !_isFavorite;
        });
        widget.onChanged(_isFavorite);
      },
    );
  }
}