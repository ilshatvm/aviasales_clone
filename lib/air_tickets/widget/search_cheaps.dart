import 'package:aviasales_clone/air_tickets/air_tickets.dart';
import 'package:aviasales_clone/common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                    title: state.departureDate?.toCheapFormat() ??
                        DateTime.now().toCheapFormat(),
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
