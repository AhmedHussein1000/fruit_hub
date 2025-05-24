import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/core/di/service_locator.dart';
import 'package:fruit_hub/core/helpers/assets.dart';
import 'package:fruit_hub/core/themes/app_colors.dart';
import 'package:fruit_hub/core/themes/styles.dart';
import 'package:fruit_hub/core/widgets/custom_circle_progress_indicator.dart';
import 'package:fruit_hub/core/widgets/custom_leading_button.dart';
import 'package:fruit_hub/core/widgets/fruit_products_grid_view.dart';
import 'package:fruit_hub/features/search/presentation/controllers/bloc/search_bloc.dart';
import 'package:fruit_hub/generated/l10n.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late final TextEditingController _searchController;
  @override
  void initState() {
    _searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchBloc(getIt()),
      child: Scaffold(
        appBar: AppBar(
          leading: const CustomLeadingBackButton(),
          title: Text(S.of(context).search),
        ),
        body: BlocBuilder<SearchBloc, SearchState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  TextField(
                    cursorColor: AppColors.darkGreenPrimaryColor,
                    controller: _searchController,
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: S.of(context).searchFor,
                      prefixIcon: SizedBox(
                        height: 20,
                        width: 20,
                        child: Center(
                          child: SvgPicture.asset(
                            Assets.imagesSearch,
                          ),
                        ),
                      ),
                      border: _customOutlineInputBorder(),
                      enabledBorder: _customOutlineInputBorder(),
                      focusedBorder: _customOutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          context
                              .read<SearchBloc>()
                              .add(const ClearSearchTextChangedEvent());
                        },
                      ),
                    ),
                    onChanged: (value) {
                      context.read<SearchBloc>().add(SearchTextChangedEvent(
                          query: value, localization: S.of(context)));
                    },
                  ),
                  SizedBox(height: 16.h),
                  Expanded(
                    child: _buildSearchResults(state, context),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  OutlineInputBorder _customOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: Colors.grey,
      ),
    );
  }

  Widget _buildSearchResults(SearchState state, BuildContext context) {
    if (state is SearchSuccess) {
      if (state.products.isEmpty) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Assets.imagesNoResultsSearch,
              height: 200,
              width: 200,
            ),
            const SizedBox(height: 16),
            Center(
              child: Text(S.of(context).no_results_found,
                  style: Styles.font16SemiBold),
            ),
          ],
        );
      }
      return CustomScrollView(
        slivers: [
          FruitProductsGridView(
            products: state.products,
          ),
        ],
      );
    } else if (state is SearchFailure) {
      return Center(
        child: Text(
          state.message,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      );
    } else if (state is SearchLoading) {
      return const CustomCircleProgressIndicator();
    }
    return const SizedBox();
  }
}
