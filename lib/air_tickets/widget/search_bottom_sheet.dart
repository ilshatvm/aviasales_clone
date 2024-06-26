import 'package:aviasales_clone/air_tickets/air_tickets.dart';
import 'package:aviasales_clone/common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SearchBottomSheet extends StatelessWidget {
  const SearchBottomSheet({
    super.key,
    required this.controllerFrom,
    required this.controllerTo,
  });

  final TextEditingController controllerFrom;
  final TextEditingController controllerTo;

  static const popularDirection = [
    PopularDirectionItem(
        name: 'Стамбул', imagePath: 'assets/images/stambul.png'),
    PopularDirectionItem(name: 'Сочи', imagePath: 'assets/images/sochi.png'),
    PopularDirectionItem(name: 'Пхукет', imagePath: 'assets/images/phuket.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: AppColors.grey3,
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(12.0, 0.0, 16.0, 0.0),
                      child: Icon(
                        AppIcons.airplane,
                        color: AppColors.grey6,
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        controller: controllerFrom,
                        decoration: const InputDecoration(
                          hintText: "Откуда - Москва",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
                const Divider(
                  indent: 16.0,
                  endIndent: 16.0,
                  height: 1.0,
                  color: AppColors.grey5,
                ),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(12.0, 0.0, 16.0, 0.0),
                      child: Icon(
                        AppIcons.search,
                        color: AppColors.white,
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: controllerTo,
                        decoration: InputDecoration(
                          suffixIcon: InkWell(
                            onTap: () => controllerTo.clear(),
                            child: const Icon(AppIcons.close),
                          ),
                          hintText: "Куда - Турция",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 8.0),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    GoRouter.of(context).pop();
                    GoRouter.of(context).go('/tickets/stub');
                  },
                  child: const DirectionWidget(
                    color: AppColors.green,
                    icon: AppIcons.route,
                    title: 'Сложный маршрут',
                  ),
                ),
                InkWell(
                  onTap: () => controllerTo.text = 'Куда угодно',
                  child: const DirectionWidget(
                    color: AppColors.blue,
                    icon: AppIcons.globe,
                    title: 'Куда угодно',
                  ),
                ),
                InkWell(
                  onTap: () {
                    GoRouter.of(context).pop();
                    GoRouter.of(context).go('/tickets/stub');
                  },
                  child: const DirectionWidget(
                    color: AppColors.blueDark,
                    icon: AppIcons.calendar,
                    title: 'Выходные',
                  ),
                ),
                InkWell(
                  onTap: () {
                    GoRouter.of(context).pop();
                    GoRouter.of(context).go('/tickets/stub');
                  },
                  child: const DirectionWidget(
                    color: AppColors.red,
                    icon: AppIcons.fire,
                    title: 'Горячие билеты',
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(16.0),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: AppColors.grey3,
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Column(
              children: popularDirection
                  .map(
                    (e) => InkWell(
                      onTap: () {
                        context
                            .read<AirTicketsBloc>()
                            .add(AirTicketsEventChangeToField(to: e.name));
                        context
                            .read<AirTicketsBloc>()
                            .add(AirTicketsEventLoadTicketsOffers());
                        controllerTo.text = e.name;
                        GoRouter.of(context).pop();
                        GoRouter.of(context).go('/tickets/selected');
                      },
                      child: PopularDirectionItem(
                        name: e.name,
                        imagePath: e.imagePath,
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
