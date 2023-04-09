import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:saiyo_pets/constants/dimens.dart';
import 'package:saiyo_pets/presentation/common/widgets/msg_bar.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
    required this.controller,
    required this.onSearch,
    required this.onSearchCancel,
  });

  final TextEditingController controller;
  final void Function(String) onSearch;
  final VoidCallback onSearchCancel;

  @override
  Size get preferredSize => const Size.fromHeight(80.0);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).viewPadding.top + 8.0,
        bottom: 8.0,
        left: 16.0,
        right: 16.0,
      ),
      child: Row(
        children: [
          Expanded(
            child: _SearchBar(
              controller: controller,
              onSearch: onSearch,
              onSearchCancel: onSearchCancel,
            ),
          ),
          Dimens.w8,
          _SearchPreferencesButton(),
        ],
      ),
    );
  }
}

class _SearchBar extends StatefulWidget {
  const _SearchBar({
    super.key,
    required this.controller,
    required this.onSearch,
    required this.onSearchCancel,
  });

  final TextEditingController controller;
  final void Function(String) onSearch;
  final VoidCallback onSearchCancel;

  @override
  State<_SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<_SearchBar> {
  late String _searchText;

  @override
  void initState() {
    _searchText = '';
    widget.controller.addListener(() {
      setState(() {
        _searchText = widget.controller.text;
      });
      widget.onSearch(widget.controller.text);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      height: 80.0,
      decoration: BoxDecoration(
        borderRadius: Dimens.brc48,
        color: Theme.of(context).colorScheme.secondary,
      ),
      child: Row(
        children: [
          Dimens.w16,
          Icon(
            EvaIcons.searchOutline,
            color: colorScheme.onSecondary,
          ),
          Dimens.w8,
          Expanded(
            child: TextField(
              controller: widget.controller,
              // onChanged: (value) {
              //   setState(() {
              //     _searchText = value;
              //   });
              //   widget.onSearch(value);
              // },
              cursorColor: colorScheme.primary,
              style: TextStyle(
                color: colorScheme.onSecondary,
              ),
              decoration: InputDecoration(
                hintText: 'Find your lovely pet',
                border: InputBorder.none,
                hintStyle: TextStyle(
                  color: colorScheme.onSecondary,
                ),
              ),
            ),
          ),
          if (_searchText.isNotEmpty)
            IconButton(
              onPressed: () {
                widget.controller.clear();
                widget.onSearchCancel();
              },
              icon: const Icon(Icons.close_rounded),
              color: colorScheme.onSecondary,
            ),
          Dimens.w16,
        ],
      ),
    );
  }
}

class _SearchPreferencesButton extends StatelessWidget {
  const _SearchPreferencesButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return IconButton(
      onPressed: () {
        context.showMsgBar('Coming soon...');
      },
      icon: const Icon(
        EvaIcons.options2Outline,
      ),
      color: colorScheme.onSecondary,
    );
  }
}
