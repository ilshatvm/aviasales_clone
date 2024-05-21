import 'package:aviasales_clone/air_tickets/bloc/air_tickets_bloc.dart';
import 'package:aviasales_clone/common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class AirTicketsAppBar extends StatelessWidget {
  const AirTicketsAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: AppBar(
          leading: InkWell(
            onTap: () => GoRouter.of(context).pop(),
            child: const Icon(AppIcons.left_arrow, color: AppColors.blue),
          ),
          leadingWidth: 24.0,
          titleSpacing: 8.0,
          backgroundColor: AppColors.grey2,
          title: BlocBuilder<AirTicketsBloc, AirTicketsState>(
            builder: (context, state) {
              return switch (state.status) {
                _ => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${state.from}-${state.to}',
                          style: const TextStyle(fontSize: 16.0)),
                      Text(
                        '${DateFormat('dd MMM').format(state.departureDate ?? DateTime.now())}, 1 пассажир',
                        style: const TextStyle(
                          color: AppColors.grey6,
                          fontSize: 14.0,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
              };
            },
          ),
        ),
      ),
    );
  }
}
