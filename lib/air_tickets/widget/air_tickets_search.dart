import 'package:aviasales_clone/air_tickets/air_tickets.dart';
import 'package:aviasales_clone/common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AirTicketsSearch extends StatefulWidget {
  const AirTicketsSearch({super.key});

  @override
  State<AirTicketsSearch> createState() => _AirTicketsSearchState();
}

class _AirTicketsSearchState extends State<AirTicketsSearch> {
  final _focusNode = FocusNode();

  late TextEditingController _controllerFrom;
  late TextEditingController _controllerTo;

  @override
  void initState() {
    super.initState();
    _controllerFrom = TextEditingController();
    _controllerTo = TextEditingController();
    _controllerFrom.text = context.read<AirTicketsBloc>().state.from ?? '';
    _controllerTo.text = context.read<AirTicketsBloc>().state.to ?? '';
    _focusNode.addListener(
      () {
        if (_focusNode.hasFocus) {
          _focusNode.unfocus();
          _showSearchBottomSheet();
        }
      },
    );
  }

  Future<void> _showSearchBottomSheet() async {
    final size = MediaQuery.of(context).size;
    return showModalBottomSheet<void>(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
      useRootNavigator: true,
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      enableDrag: true,
      elevation: 0,
      constraints: BoxConstraints(maxHeight: size.height * .95),
      backgroundColor: AppColors.grey2,
      showDragHandle: true,
      builder: (BuildContext context) {
        return SearchBottomSheet(
          controllerFrom: _controllerFrom,
          controllerTo: _controllerTo,
        );
      },
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controllerFrom.dispose();
    _controllerTo.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(16.0),
      sliver: SliverToBoxAdapter(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: AppColors.grey3,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.grey4,
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    if (_controllerFrom.text.isNotEmpty &&
                        _controllerTo.text.isNotEmpty) {
                      GoRouter.of(context).go('/tickets/selected');
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(12.0, 0.0, 16.0, 0.0),
                    child: Icon(
                      AppIcons.search,
                      color: AppColors.black,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      TextFormField(
                        onChanged: (value) => context.read<AirTicketsBloc>()
                          ..add(AirTicketsEventChangeFromField(from: value)),
                        controller: _controllerFrom,
                        decoration: const InputDecoration(
                          hintText: "Откуда - Москва",
                          border: InputBorder.none,
                        ),
                      ),
                      const Divider(
                        endIndent: 16.0,
                        height: 1.0,
                        color: AppColors.grey5,
                      ),
                      TextFormField(
                        focusNode: _focusNode,
                        keyboardType: TextInputType.none,
                        controller: _controllerTo,
                        decoration: const InputDecoration(
                          hintText: "Куда - Турция",
                          contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          border: InputBorder.none,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
