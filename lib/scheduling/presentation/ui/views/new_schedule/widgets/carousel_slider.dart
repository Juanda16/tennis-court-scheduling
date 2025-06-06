import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tennis_court_scheduling/core/style/style.dart';
import 'package:tennis_court_scheduling/scheduling/domain/entities/court_model.dart';
import 'package:tennis_court_scheduling/scheduling/presentation/provider/favorites_provider.dart';

class FieldCarousel extends StatefulWidget {
  final CourtModel court;

  const FieldCarousel({super.key, required this.court});

  @override
  State<FieldCarousel> createState() => _FieldCarouselState();
}

class _FieldCarouselState extends State<FieldCarousel> {
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();
  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavoritesProvider>(context);
    final isFavorite = favoritesProvider.isFavorite(widget.court);

    return Stack(
      children: [
        CarouselSlider(
          items: widget.court.images?.map((image) {
            return Image.asset(image.url ?? '', fit: BoxFit.cover);
          }).toList(),
          carouselController: _controller,
          options: CarouselOptions(
            height: 300,
            viewportFraction: 1,
            autoPlay: false,
            enlargeCenterPage: false,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.court.images!.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () {
                  _controller.animateToPage(entry.key);
                },
                child: Container(
                  width: 15,
                  height: 15,
                  margin: const EdgeInsets.symmetric(horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == entry.key
                        ? AppColors.primary
                        : Colors.grey.shade400,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        //go back and favorite button
        Positioned(
          top: 20,
          left: 0,
          child: Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(15),
            ),
            margin: const EdgeInsets.only(top: 50, left: 30),
            child: Center(
              //back icon
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: AppColors.white,
                  size: 20,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ),
        Positioned(
          top: 20,
          right: 0,
          child: Container(
            height: 35,
            width: 35,
            margin: const EdgeInsets.only(top: 42, right: 30),
            child: Center(
              //favorite icon
              child: IconButton(
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: AppColors.white,
                  size: 30,
                ),
                onPressed: () {
                  favoritesProvider.toggleFavorite(widget.court);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
