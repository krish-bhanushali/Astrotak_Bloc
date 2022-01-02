import 'package:astrotak/app/business/bloc/astrologerbloc_bloc.dart';
import 'package:astrotak/app/ui/values/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    Key? key,
    required this.searchEditingController,
  }) : super(key: key);

  final TextEditingController searchEditingController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AstrologerblocBloc, AstrologerblocState>(
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
                context.read<AstrologerblocBloc>().add(SearchEvent(value));
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
    );
  }
}
