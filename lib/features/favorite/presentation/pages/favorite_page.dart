import 'package:flutter/material.dart';
import 'package:marketi/features/favorite/presentation/widgets/favorite_bloc_builder.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Favorite"),
      ),
      body: const FavoriteBlocBuilder(),
    );
  }
}
