import 'package:air_tickets_repository/air_tickets_repository.dart';
import 'package:aviasales_clone/common/common.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OfferCard extends StatelessWidget {
  const OfferCard({
    super.key,
    required this.imagePath,
    required this.offer,
  });

  final Offer offer;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat('###,###,###', 'ru_RU');
    return Container(
      // color: index.isOdd ? Colors.green : Colors.orange,
      width: 132.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 132.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Image(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            offer.title,
            style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8.0),
          Text(
            offer.town,
            style: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 4.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(AppIcons.air_ticket),
              Text(
                'от ${formatter.format(offer.price.value)} ₽',
                style: const TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
