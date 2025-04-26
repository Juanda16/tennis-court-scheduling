import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tennis_court_scheduling/core/i18n/generated/translations.g.dart';
import 'package:tennis_court_scheduling/core/style/style.dart';
import 'package:tennis_court_scheduling/scheduling/presentation/provider/favorites_provider.dart';
import 'package:tennis_court_scheduling/scheduling/presentation/ui/views/new_schedule/widgets/carousel_slider.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavoritesProvider>(context);
    final favoriteCourtModels = favoritesProvider.favorites.toList();

    return Scaffold(
      appBar: AppBar(
          title: Text(translate.favorite_page.favorite),
          backgroundColor: AppColors.primary,
          leading: const SizedBox()),
      body: favoriteCourtModels.isEmpty
          ? const Center(
              child: Text('No favorite courts yet.'),
            )
          : ListView.builder(
              itemCount: favoriteCourtModels.length,
              itemBuilder: (context, index) {
                final court = favoriteCourtModels[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        court.name ?? '',
                        style: context.textTheme.titleLarge,
                      ),
                      FieldCarousel(
                        court: court,
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
