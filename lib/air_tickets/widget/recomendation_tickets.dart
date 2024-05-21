import 'package:aviasales_clone/air_tickets/air_tickets.dart';
import 'package:aviasales_clone/common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecomendationTickets extends StatelessWidget {
  const RecomendationTickets({super.key});

  static const colors = [
    AppColors.red,
    AppColors.blue,
    AppColors.white,
  ];

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 12.0),
      sliver: SliverToBoxAdapter(
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.grey1,
            borderRadius: BorderRadius.circular(16.0),
          ),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Прямые рейсы',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 220,
                child: BlocBuilder<AirTicketsBloc, AirTicketsState>(
                  builder: (context, state) {
                    return switch (state.status) {
                      AirTicketsStatus.initial =>
                        const Center(child: Text("Пока пусто")),
                      AirTicketsStatus.loading => const AppProgress(),
                      AirTicketsStatus.failure => const Text("Ошибка загрузки"),
                      AirTicketsStatus.success => ListView.builder(
                          itemBuilder: (context, index) {
                            final offer =
                                state.ticketsOffers.ticketsOffers[index];
                            return Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: AppColors.grey4),
                                ),
                              ),
                              margin: const EdgeInsets.only(bottom: 8.0),
                              padding:
                                  const EdgeInsets.fromLTRB(0.0, 8.0, 8.0, 8.0),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 12.0,
                                    backgroundColor: index > 2
                                        ? AppColors.grey3
                                        : colors[index],
                                  ),
                                  const SizedBox(width: 8.0),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width - 104,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              offer.title,
                                              style: const TextStyle(
                                                fontStyle: FontStyle.italic,
                                              ),
                                            ),
                                            Text(
                                              offer.price.value.toPrice(),
                                              style: const TextStyle(
                                                color: AppColors.blue,
                                                fontStyle: FontStyle.italic,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            children: offer.timeRange
                                                .map((e) => Text('$e '))
                                                .toList(),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          itemCount: 3,
                        ),
                    };
                  },
                ),
              ),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Показать все',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
