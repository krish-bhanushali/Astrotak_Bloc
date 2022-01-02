import 'package:astrotak/app/data/models/astrologer_model.dart';
import 'package:astrotak/app/ui/values/color.dart';
import 'package:flutter/material.dart';

class AstrologerTile extends StatelessWidget {
  const AstrologerTile({
    required this.astrologer,
  });

  final Astrologer astrologer;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      height: 220,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 80,
            width: 120,
            child: Image.network(
              astrologer.images!.medium.imageUrl ?? '',
              fit: BoxFit.scaleDown,
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        '${astrologer.firstName} ${astrologer.lastName}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      '${astrologer.experience.toString().trim()} years',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.person_outline,
                      color: AppColors.primaryColor,
                      size: 20,
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        astrologer.aboutMe,
                        overflow: TextOverflow.clip,
                        maxLines: 3,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.language_rounded,
                      color: AppColors.primaryColor,
                      size: 20,
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        // 'English, Hindi',
                        astrologer.languages
                            .map((e) => e.name)
                            .toList()
                            .join(','),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.money,
                      color: AppColors.primaryColor,
                      size: 20,
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        '₹${astrologer.minimumCallDurationCharges.toString()}/ Min',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 48,
                  width: 176,
                  margin: EdgeInsets.only(left: 30),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 0.6,
                        blurRadius: 3,
                        offset: Offset(1, 1),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.call_outlined,
                        color: Colors.white,
                        size: 24,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Talk on Call',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
