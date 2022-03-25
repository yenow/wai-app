import 'package:flutter/material.dart';
import 'package:wai/common/widgets/blank.dart';
import 'package:wai/common/widgets/focus_out_container.dart';
import 'package:wai/common/widgets/wai_appbar.dart';
import 'package:wai/constants/wai_colors.dart';
import 'package:wai/controller/search/search_controller.dart';
import 'package:wai/ui/search_screen/components/search_form.dart';
import 'package:wai/ui/search_screen/components/search_tab_bar.dart';
import 'package:wai/ui/search_screen/components/search_tab_bar_view.dart';

class SearchActionButton extends StatelessWidget {
  const SearchActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: IconButton(
        icon: const Icon(Icons.search_outlined, size: 25, color: WaiColors.white),
        onPressed: SearchController.to.search,
      ),
    );
  }
}
