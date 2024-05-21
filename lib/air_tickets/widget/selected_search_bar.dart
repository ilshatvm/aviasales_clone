import 'package:aviasales_clone/air_tickets/bloc/air_tickets_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../common/common.dart';

class SelectedSearchBar extends StatefulWidget {
  const SelectedSearchBar({super.key});

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
