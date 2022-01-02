import 'package:astrotak/app/business/bloc/astrologerbloc_bloc.dart';
import 'package:astrotak/app/ui/values/assets.dart';
import 'package:astrotak/app/ui/views/Navigation/fragments/Talk%20Screen/widgets/custom_filter_widget.dart';
import 'package:astrotak/app/ui/views/Navigation/fragments/Talk%20Screen/widgets/custom_search_field_widget.dart';
import 'package:astrotak/app/ui/views/Navigation/fragments/Talk%20Screen/widgets/custom_sorting_widget.dart';
import 'package:astrotak/app/ui/widgets/astrologer_tile.dart';
import 'package:astrotak/app/ui/widgets/custom_overlay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TalkScreen extends StatefulWidget {
  TalkScreen({Key? key}) : super(key: key);

  @override
  _TalkScreenState createState() => _TalkScreenState();
}

class _TalkScreenState extends State<TalkScreen> {
  final TextEditingController searchEditingController = TextEditingController();

  bool experienceHigh = false;

  bool dropdownShown = false;
  bool filterDropdown = false;

  List<String> langFilter = [];
  List<String> skillFilter = [];

  void langFilterToggle(String language) {
    if (langFilter.contains(language)) {
      langFilter.remove(language);
    } else {
      langFilter.add(language);
    }
    setState(() {});
  }

  void skillFilterToggle(String skill) {
    if (skillFilter.contains(skill)) {
      skillFilter.remove(skill);
    } else {
      skillFilter.add(skill);
    }
    setState(() {});
  }

  void toggleDropdown() {
    setState(() {
      dropdownShown = !dropdownShown;
    });
  }

  void toggleFilter() {
    setState(() {
      filterDropdown = !filterDropdown;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          AstroUtilityRow(
            onTapFilter: () {
              toggleFilter();
            },
            onTapSort: () {
              toggleDropdown();
            },
            showFilterOverlay: filterDropdown,
            showSortOverlay: dropdownShown,
            skillFilter: skillFilter,
            langFilter: langFilter,
            onTapHindi: () {
              langFilterToggle('hindi');
            },
            onTapEnglish: () {
              langFilterToggle('english');
            },
            onTapAstrologer: () {
              skillFilterToggle('astrology');
            },
            onTapVastu: () {
              skillFilterToggle('Falit Jyotish');
            },
          ),
          SearchTextField(searchEditingController: searchEditingController),
          AstrologerMainListWidget(),
        ],
      ),
    );
  }
}

class AstroUtilityRow extends StatelessWidget {
  final Function()? onTapFilter;
  final Function()? onTapSort;

  final Function()? onTapHindi;
  final Function()? onTapEnglish;
  final Function()? onTapVastu;
  final Function()? onTapAstrologer;
  final bool showFilterOverlay;
  final bool showSortOverlay;
  final List<String> langFilter;
  final List<String> skillFilter;

  const AstroUtilityRow(
      {Key? key,
      required this.onTapFilter,
      required this.onTapSort,
      required this.showFilterOverlay,
      required this.showSortOverlay,
      required this.langFilter,
      required this.skillFilter,
      this.onTapHindi,
      this.onTapEnglish,
      this.onTapVastu,
      this.onTapAstrologer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Talk to an Astrolger',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () async {
                context.read<AstrologerblocBloc>().add(SearchEvent(''));
              },
              child: Image.asset(
                AppAssets.ASTRO_SEARCH_ASSET,
                scale: 2.3,
              ),
            ),
            SizedBox(width: 12),
            GestureDetector(
              onTap: onTapFilter,
              child: Image.asset(
                AppAssets.ASTRO_FILTER_ASSET,
                scale: 2.3,
              ),
            ),
            OverlayContainer(
              show: showFilterOverlay,
              // Let's position this overlay to the right of the button.
              position: OverlayContainerPosition(
                // Left position.
                -320,
                // Bottom position.
                -10,
              ),
              // The content inside the overlay.
              child: Container(
                width: 350.0,
                child: BlocBuilder<AstrologerblocBloc, AstrologerblocState>(
                  builder: (context, state) {
                    if (state is AstrologerBlocFilter) {
                      return FilterWidget(
                          hindi: langFilter.contains('hindi') ? true : false,
                          onTapHindi: onTapHindi,
                          english:
                              langFilter.contains('english') ? true : false,
                          onTapEnglish: onTapEnglish,
                          onTapastrology: onTapAstrologer,
                          onTapvastu: onTapVastu,
                          astrology:
                              skillFilter.contains('astrology') ? true : false,
                          vastu: skillFilter.contains('Falit Jyotish')
                              ? true
                              : false,
                          applyFilters: () {
                            context
                                .read<AstrologerblocBloc>()
                                .add(FilterEvent(langFilter, skillFilter));
                          });
                    }
                    return FilterWidget(
                        hindi: langFilter.contains('hindi') ? true : false,
                        onTapHindi: onTapHindi,
                        english: langFilter.contains('english') ? true : false,
                        onTapEnglish: onTapEnglish,
                        onTapastrology: onTapAstrologer,
                        onTapvastu: onTapVastu,
                        astrology:
                            skillFilter.contains('astrology') ? true : false,
                        vastu: skillFilter.contains('Falit Jyotish')
                            ? true
                            : false,
                        applyFilters: () {
                          context
                              .read<AstrologerblocBloc>()
                              .add(FilterEvent(langFilter, skillFilter));
                        });
                  },
                ),
              ),
            ),
            SizedBox(width: 12),
            GestureDetector(
              onTap: onTapSort,
              child: Image.asset(
                'assets/sort.png',
                scale: 2.3,
              ),
            ),
            OverlayContainer(
              show: showSortOverlay,
              // Let's position this overlay to the right of the button.
              position: OverlayContainerPosition(
                // Left position.
                -320,
                // Bottom position.
                -10,
              ),
              // The content inside the overlay.
              child: Container(
                width: 350.0,
                child: BlocBuilder<AstrologerblocBloc, AstrologerblocState>(
                  builder: (context, state) {
                    if (state is AstrologerblocSorted) {
                      return SortingWidget(
                        isEhightoLow: state.sort == sortType.experienceHightoLow
                            ? true
                            : false,
                        isElowtoHigh: state.sort == sortType.experienceLowtoHigh
                            ? true
                            : false,
                        isPhightoLow: state.sort == sortType.priceHighToLow
                            ? true
                            : false,
                        isPlowtoHigh: state.sort == sortType.priceLowToHigh
                            ? true
                            : false,
                      );
                    }
                    return SortingWidget();
                  },
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class AstrologerMainListWidget extends StatelessWidget {
  const AstrologerMainListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<AstrologerblocBloc, AstrologerblocState>(
          builder: (context, state) {
        if (state is AstrologerblocEmpty) {
          context.read<AstrologerblocBloc>().add(FetchEvent());
        }
        if (state is AstrologerblocError) {
          return Center(
            child: Text('failed to fetch quote'),
          );
        }
        if (state is AstrologerblocLoaded) {
          return ListView.separated(
            itemCount: state.astroglogers.length,
            itemBuilder: (context, index) {
              return AstrologerTile(
                astrologer: state.astroglogers[index],
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Divider();
            },
          );
        }
        if (state is AstrologerblocSearchStarted) {
          print(state.searchResults.length);
          return ListView.separated(
            itemCount: state.searchResults.length,
            itemBuilder: (context, index) {
              return AstrologerTile(
                astrologer: state.searchResults[index],
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Divider();
            },
          );
        }
        if (state is AstrologerblocSorted) {
          print(state.sortedLogers.length);
          return ListView.separated(
            itemCount: state.sortedLogers.length,
            itemBuilder: (context, index) {
              return AstrologerTile(
                astrologer: state.sortedLogers[index],
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Divider();
            },
          );
        }
        if (state is AstrologerBlocFilter) {
          print(state.filteredLogers.length);
          return ListView.separated(
            itemCount: state.filteredLogers.length,
            itemBuilder: (context, index) {
              return AstrologerTile(
                astrologer: state.filteredLogers[index],
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Divider();
            },
          );
        }

        return Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }
}
