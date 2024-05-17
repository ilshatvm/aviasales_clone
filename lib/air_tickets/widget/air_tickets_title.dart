import 'package:flutter/material.dart';

class AirTicketsTitle extends StatelessWidget {
  const AirTicketsTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverSafeArea(
      sliver: SliverToBoxAdapter(
        child: Container(
          height: 100.0,
          alignment: Alignment.center,
          child: const Text(
            'Поиск дешевых\nавиабилетов',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
