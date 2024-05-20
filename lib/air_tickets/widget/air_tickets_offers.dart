import 'package:air_tickets_repository/air_tickets_repository.dart';
import 'package:aviasales_clone/air_tickets/air_tickets.dart';
import 'package:aviasales_clone/common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AirTicketsOffers extends StatelessWidget {
  const AirTicketsOffers({super.key});

  static const List<String> images = [
    'assets/images/1.png',
    'assets/images/2.png',
    'assets/images/3.png',
  ];

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 25.0),
            child: SizedBox(
              child: Text(
                'Музыкально отлететь',
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          SizedBox(
            height: 220.0,
            child: BlocBuilder<AirTicketsBloc, AirTicketsState>(
              builder: (context, state) => switch (state.status) {
                AirTicketsStatus.success =>
                  OffersBuilder(images: images, offers: state.offers),
                AirTicketsStatus.initial =>
                  const Center(child: Text("Пока пусто")),
                AirTicketsStatus.loading => const AppProgress(),
                AirTicketsStatus.failure => const Center(child: Text("Ошибка")),
              },
            ),
          ),
        ],
      ),
    );
  }
}

class OffersBuilder extends StatelessWidget {
  const OffersBuilder({
    super.key,
    required this.images,
    required this.offers,
  });

  final List<String> images;
  final Offers offers;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 0.0, 67.0, 0.0),
        child: OfferCard(
          imagePath: images[index],
          offer: offers.offers[index],
        ),
      ),
      itemCount: 3,
    );
  }
}
