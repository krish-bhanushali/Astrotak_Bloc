import 'package:astrotak/app/business/bloc/astrologerbloc_bloc.dart';
import 'package:astrotak/app/business/bloc/location_bloc.dart';
import 'package:astrotak/app/data/models/astrologer_model.dart';
import 'package:astrotak/app/ui/values/color.dart';
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

  bool _dropdownShown = false;
  bool _filterDropdown = false;

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

  void _toggleDropdown() {
    setState(() {
      _dropdownShown = !_dropdownShown;
    });
  }

  void _toggleFilter() {
    setState(() {
      _filterDropdown = !_filterDropdown;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
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
                      // searchController.closeSearch();
                      // print(searchController.searchClicked);

                      context.read<AstrologerblocBloc>().add(SearchEvent(''));
                      print('Search');
                    },
                    child: Image.asset(
                      'assets/search.png',
                      scale: 2.3,
                    ),
                  ),
                  SizedBox(width: 12),
                  GestureDetector(
                    onTap: () {
                      _toggleFilter();
                    },
                    child: Image.asset(
                      'assets/filter.png',
                      scale: 2.3,
                    ),
                  ),
                  OverlayContainer(
                    show: _filterDropdown,
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
                      child:
                          BlocBuilder<AstrologerblocBloc, AstrologerblocState>(
                        builder: (context, state) {
                          if (state is AstrologerBlocFilter) {
                            return FilterWidget(
                              hindi:
                                  langFilter.contains('hindi') ? true : false,
                              onTapHindi: () {
                                langFilterToggle('hindi');
                              },
                              english:
                                  langFilter.contains('english') ? true : false,
                              onTapEnglish: () {
                                langFilterToggle('english');
                              },
                              onTapastrology: () {
                                skillFilterToggle('astrology');
                              },
                              onTapvastu: () {
                                skillFilterToggle('vastu');
                              },
                              astrology: skillFilter.contains('astrology')
                                  ? true
                                  : false,
                              vastu:
                                  skillFilter.contains('vastu') ? true : false,
                            );
                          }
                          return FilterWidget(
                              hindi:
                                  langFilter.contains('hindi') ? true : false,
                              onTapHindi: () {
                                langFilterToggle('hindi');
                              },
                              english:
                                  langFilter.contains('english') ? true : false,
                              onTapEnglish: () {
                                langFilterToggle('english');
                              },
                              onTapastrology: () {
                                skillFilterToggle('astrology');
                              },
                              onTapvastu: () {
                                skillFilterToggle('vastu');
                              },
                              astrology: skillFilter.contains('astrology')
                                  ? true
                                  : false,
                              vastu:
                                  skillFilter.contains('vastu') ? true : false,
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
                    onTap: () {
                      print('Sort');

                      _toggleDropdown();
                    },
                    child: Image.asset(
                      'assets/sort.png',
                      scale: 2.3,
                    ),
                  ),
                  OverlayContainer(
                    show: _dropdownShown,
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
                      child:
                          BlocBuilder<AstrologerblocBloc, AstrologerblocState>(
                        builder: (context, state) {
                          if (state is AstrologerblocSorted) {
                            return SortingWidget(
                              isEhightoLow:
                                  state.sort == sortType.experienceHightoLow
                                      ? true
                                      : false,
                              isElowtoHigh:
                                  state.sort == sortType.experienceLowtoHigh
                                      ? true
                                      : false,
                              isPhightoLow:
                                  state.sort == sortType.priceHighToLow
                                      ? true
                                      : false,
                              isPlowtoHigh:
                                  state.sort == sortType.priceLowToHigh
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
          ),
          BlocBuilder<AstrologerblocBloc, AstrologerblocState>(
            builder: (context, state) {
              if (state is AstrologerblocSearchStarted) {
                return Container(
                  margin: EdgeInsets.only(top: 12),
                  height: 46,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(4),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 1,
                        offset: Offset(0, 0.4),
                        spreadRadius: 0.2,
                      )
                    ],
                  ),
                  child: TextField(
                    onChanged: (value) {
                      context
                          .read<AstrologerblocBloc>()
                          .add(SearchEvent(value));
                    },
                    controller: searchEditingController,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          searchEditingController.clear();
                          print('Close search');
                          context
                              .read<AstrologerblocBloc>()
                              .add(SearchCompeteEvent());
                        },
                        icon: Icon(
                          Icons.close,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      hintText: 'Search Astrologer',
                      hintStyle: TextStyle(fontSize: 14),
                      icon: Icon(
                        Icons.search_outlined,
                        color: AppColors.primaryColor,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                );
              }

              return Container();
            },
          ),
          Expanded(
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
          ),
        ],
      ),
    );
  }
}

class SortingWidget extends StatelessWidget {
  const SortingWidget({
    Key? key,
    this.isElowtoHigh = false,
    this.isEhightoLow = false,
    this.isPhightoLow = false,
    this.isPlowtoHigh = false,
  }) : super(key: key);

  final bool isElowtoHigh;
  final bool isEhightoLow;
  final bool isPhightoLow;
  final bool isPlowtoHigh;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text(
        'Sort By',
        style: TextStyle(
          color: AppColors.primaryColor,
        ),
      ),
      children: [
        SimpleDialogOption(
          child: ListTile(
            onTap: () {
              context
                  .read<AstrologerblocBloc>()
                  .add(SortEvent(sortType.experienceHightoLow));
            },
            leading: isEhightoLow
                ? Icon(
                    Icons.radio_button_checked,
                  )
                : Icon(Icons.radio_button_unchecked),
            title: Text('Experience -  High to Low'),
          ),
        ),
        SimpleDialogOption(
          onPressed: () {},
          child: ListTile(
            onTap: () {
              context
                  .read<AstrologerblocBloc>()
                  .add(SortEvent(sortType.experienceLowtoHigh));
            },
            title: Text(
              'Experience -  Low to High',
            ),
            leading: isElowtoHigh
                ? Icon(
                    Icons.radio_button_checked,
                  )
                : Icon(Icons.radio_button_unchecked),
          ),
        ),
        SimpleDialogOption(
          child: ListTile(
            onTap: () {
              context
                  .read<AstrologerblocBloc>()
                  .add(SortEvent(sortType.priceHighToLow));
            },
            title: Text('Price -  High to Low'),
            leading: isPhightoLow
                ? Icon(
                    Icons.radio_button_checked,
                  )
                : Icon(Icons.radio_button_unchecked),
          ),
        ),
        SimpleDialogOption(
          child: ListTile(
            onTap: () {
              context
                  .read<AstrologerblocBloc>()
                  .add(SortEvent(sortType.priceLowToHigh));
            },
            leading: isPlowtoHigh
                ? Icon(
                    Icons.radio_button_checked,
                  )
                : Icon(Icons.radio_button_unchecked),
            title: Text('Price -  Low to High'),
          ),
        ),
      ],
    );
  }
}

class FilterWidget extends StatelessWidget {
  const FilterWidget({
    Key? key,
    this.hindi = false,
    this.english = false,
    this.vastu = false,
    this.astrology = false,
    this.onTapHindi,
    this.onTapEnglish,
    this.onTapvastu,
    this.onTapastrology,
    this.applyFilters,
  }) : super(key: key);

  final bool hindi;
  final bool english;
  final bool vastu;
  final bool astrology;
  final Function()? onTapHindi;
  final Function()? onTapEnglish;
  final Function()? onTapvastu;
  final Function()? onTapastrology;

  final Function()? applyFilters;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text(
        'Filter',
        style: TextStyle(
          color: AppColors.primaryColor,
        ),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Text('Language'),
        ),
        Container(
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                child: CustomFilterTile(
                  onTap: onTapEnglish,
                  text: 'English',
                  icon: english
                      ? Icon(
                          Icons.radio_button_checked,
                        )
                      : Icon(
                          Icons.radio_button_unchecked,
                        ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                child: CustomFilterTile(
                  onTap: onTapHindi,
                  text: 'Hindi',
                  icon: hindi
                      ? Icon(
                          Icons.radio_button_checked,
                        )
                      : Icon(
                          Icons.radio_button_unchecked,
                        ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Text('Skills'),
        ),
        Container(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                child: CustomFilterTile(
                    onTap: onTapvastu,
                    text: 'Vastu',
                    icon: vastu
                        ? Icon(
                            Icons.radio_button_checked,
                          )
                        : Icon(
                            Icons.radio_button_unchecked,
                          )),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                child: CustomFilterTile(
                    onTap: onTapastrology,
                    text: 'Astrology',
                    icon: astrology
                        ? Icon(
                            Icons.radio_button_checked,
                          )
                        : Icon(
                            Icons.radio_button_unchecked,
                          )),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: applyFilters,
          child: Container(
            child: Center(
              child: Text(
                'Apply Filters',
                style: TextStyle(fontSize: 18, color: AppColors.primaryColor),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomFilterTile extends StatelessWidget {
  const CustomFilterTile({
    Key? key,
    required this.icon,
    required this.text,
    this.onTap,
  }) : super(key: key);

  final Icon icon;
  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          icon,
          SizedBox(
            width: 20.0,
          ),
          Center(
            child: Text(text),
          )
        ],
      ),
    );
  }
}
