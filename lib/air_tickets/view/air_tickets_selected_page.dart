import 'package:aviasales_clone/air_tickets/air_tickets.dart';
import 'package:flutter/material.dart';

import 'package:aviasales_clone/common/common.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class AirTicketsSelectedPage extends StatelessWidget {
  const AirTicketsSelectedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AirTicketsSelectedView();
  }
}

class AirTicketsSelectedView extends StatelessWidget {
  const AirTicketsSelectedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverSafeArea(sliver: SelectedSearchBar()),
          const SearchCheaps(),
          const RecomendationTickets(),
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverToBoxAdapter(
              child: FilledButton(
                  onPressed: () {
                    // final bloc = context.read<AirTicketsBloc>();
                    // if (bloc.state.from.isEmpty) {
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //     const SnackBar(
                    //       content: Text('Заполните поле "Откуда"'),
                    //     ),
                    //   );
                    //   return;
                    // }
                    // if (bloc.state.to.isEmpty) {
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //     const SnackBar(content: Text('Заполните поле "Куда"')),
                    //   );
                    //   return;
                    // }
                    // bloc.add(AirTicketsEventLoadTickets());
                    // GoRouter.of(context).go('/tickets/selected/all');
                  },
                  child: const Text('Посмотреть все билеты')),
            ),
          ),
        ],
      ),
    );
  }
}

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
                            final formatter =
                                NumberFormat('###,###,### ₽', 'ru_RU');
                            final price = formatter.format(offer.price.value);
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
                                              price,
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

class SearchCheaps extends StatelessWidget {
  const SearchCheaps({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AirTicketsBloc>();
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 32.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            const SizedBox(width: 12.0),
            InkWell(
              onTap: () => showDatePicker(
                context: context,
                firstDate: DateTime.now(),
                lastDate: DateTime(2025),
              ),
              child:
                  const AppCheapWidget(icon: AppIcons.plus, title: 'обратно'),
            ),
            InkWell(
              onTap: () => _addedDepartureDate(context, bloc),
              child: BlocBuilder<AirTicketsBloc, AirTicketsState>(
                builder: (context, state) {
                  return AppCheapWidget(
                    title: DateFormat('dd MMMM, E')
                        .format(state.departureDate ?? DateTime.now()),
                  );
                },
              ),
            ),
            const AppCheapWidget(
              icon: AppIcons.person,
              title: '1,эконом',
            ),
            const AppCheapWidget(
              icon: AppIcons.filter,
              title: 'фильтры',
            ),
            const SizedBox(width: 12.0),
          ],
        ),
      ),
    );
  }

  void _addedDepartureDate(BuildContext context, AirTicketsBloc bloc) async {
    DateTime? date = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    );
    if (date != null) {
      bloc.add(AirTicketsEventAddedDeparture(date: date));
    }
  }
}

class AppCheapWidget extends StatelessWidget {
  const AppCheapWidget({
    super.key,
    required this.title,
    this.icon,
  });

  final String title;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4.0, 0.0, 4.0, 0.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          color: AppColors.grey3,
        ),
        padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon == null
                ? const SizedBox()
                : Row(
                    children: [
                      Icon(icon, size: 16.0),
                      const SizedBox(width: 8.0),
                    ],
                  ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 14.0,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SelectedSearchBar extends StatefulWidget {
  const SelectedSearchBar({
    super.key,
  });

  @override
  State<SelectedSearchBar> createState() => _SelectedSearchBarState();
}

class _SelectedSearchBarState extends State<SelectedSearchBar> {
  final TextEditingController _controllerFrom = TextEditingController();
  final TextEditingController _controllerTo = TextEditingController();

  @override
  void initState() {
    final bloc = context.read<AirTicketsBloc>();
    _controllerFrom.text = bloc.state.from!;
    _controllerTo.text = bloc.state.to!;
    super.initState();
  }

  @override
  void dispose() {
    _controllerFrom.dispose();
    _controllerTo.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AirTicketsBloc>();
    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(16.0, 47.0, 16.0, 12.0),
      sliver: SliverToBoxAdapter(
        child: Container(
          padding: const EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 0.0),
          decoration: BoxDecoration(
            color: AppColors.grey3,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 0.0, 16.0, 0.0),
                child: InkWell(
                  onTap: () => GoRouter.of(context).pop(),
                  child: const Icon(
                    AppIcons.left_arrow,
                    color: AppColors.white,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    TextFormField(
                      controller: _controllerFrom,
                      onChanged: (value) =>
                          bloc.add(AirTicketsEventChangeFromField(from: value)),
                      decoration: InputDecoration(
                        hintText: "Откуда - Москва",
                        border: InputBorder.none,
                        suffixIcon: InkWell(
                          onTap: () {
                            // TODO change bloc
                            final temp = _controllerTo.text;
                            _controllerTo.text = _controllerFrom.text;
                            _controllerFrom.text = temp;
                          },
                          child: const Icon(AppIcons.change),
                        ),
                      ),
                    ),
                    const Divider(
                      endIndent: 16.0,
                      height: 1.0,
                      color: AppColors.grey4,
                    ),
                    TextFormField(
                      controller: _controllerTo,
                      onChanged: (value) =>
                          bloc.add(AirTicketsEventChangeToField(to: value)),
                      decoration: InputDecoration(
                        hintText: "Куда - Турция",
                        border: InputBorder.none,
                        suffixIcon: InkWell(
                          onTap: () => _controllerTo.clear(),
                          child: const Icon(AppIcons.close),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
