import 'package:flutter/material.dart';
import 'package:trybu/core/helpers/size_extension.dart';
import 'package:trybu/core/ui/styles/app_colors.dart';
import 'package:trybu/core/ui/styles/app_icons.dart';
import 'package:trybu/core/ui/styles/app_typography.dart';
import 'package:trybu/pages/events_details/event_details.dart';
import 'package:trybu/repositories/event_repositories.dart';

class EventListTile extends StatefulWidget {
  const EventListTile({Key? key}) : super(key: key);

  @override
  State<EventListTile> createState() => _EventListTileState();
}

class _EventListTileState extends State<EventListTile> {
  final eventRepositories = EventRepositories();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.screenWidth,
      height: 290.0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: eventRepositories.eventList.length,
          itemBuilder: (_, index) {
            final data = eventRepositories.eventList;
            return GestureDetector(
              onTap: (() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => EventDetails(
                            image: data[index].image,
                            title: data[index].name,
                            description: data[index].descriptions,
                            dataTime: data[index].dataTime,
                            participants: data[index].numberParticipants)));
              }),
              child: EventTile(
                image: data[index].image,
                descriptions: data[index].descriptions,
                title: data[index].name,
                participants: data[index].numberParticipants,
                dataTime: data[index].dataTime,
              ),
            );
          }),
    );
  }
}

class EventTile extends StatelessWidget {
  const EventTile(
      {Key? key,
      required this.image,
      required this.title,
      required this.descriptions,
      required this.participants,
      required this.dataTime})
      : super(key: key);
  final String image;
  final String title;
  final int participants;
  final String dataTime;
  final String descriptions;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(right: 15, top: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            image,
            fit: BoxFit.cover,
            width: 200,
          ),
          Container(
            padding: const EdgeInsets.only(left: 8, top: 8, bottom: 4),
            margin: const EdgeInsets.only(top: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  dataTime,
                  style: AppTypography.bodyTextSemiBold(context)!.copyWith(
                    fontSize: 14,
                    color: const Color.fromARGB(255, 82, 75, 17),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  title,
                  style: AppTypography.bodyTextBold(context)!
                      .copyWith(fontSize: 16, fontWeight: FontWeight.w900),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  descriptions,
                  style: AppTypography.bodyTextNormal(context)!
                      .copyWith(fontSize: 13, fontWeight: FontWeight.w300),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      AppIcons.user,
                      width: 16,
                      height: 16,
                      color: AppColors.black54,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      '${participants.toString()} vão participar',
                      style: AppTypography.bodyTextNormal(context)!
                          .copyWith(fontSize: 13, fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      'Juntar-se',
                      style: TextStyle(
                          color: AppColors.brownColor,
                          fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      size: 18,
                      color: AppColors.brownColor,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CardEvent extends StatelessWidget {
  CardEvent(
      {Key? key,
      required this.image,
      required this.description,
      required this.title,
      required this.icons})
      : super(key: key);
  final String image;
  final String description;
  final String title;
  List<IconData> icons = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Image.asset(
            image,
            fit: BoxFit.cover,
            width: 230,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(title,
              style:
                  AppTypography.bodyTextBold(context)!.copyWith(fontSize: 14)),
          const SizedBox(height: 7),
          Text(
            description,
          ),
        ],
      ),
    );
  }
}
