import 'package:flutter/material.dart';
import 'package:trybu/core/helpers/size_extension.dart';
import 'package:trybu/core/ui/styles/app_colors.dart';
import 'package:trybu/core/ui/styles/app_typography.dart';

class EventDetails extends StatefulWidget {
  const EventDetails(
      {Key? key,
      required this.image,
      required this.title,
      required this.description,
      required this.dataTime,
      required this.participants})
      : super(key: key);
  final String image;
  final String title;
  final String description;
  final String dataTime;
  final int participants;

  @override
  State<EventDetails> createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16,top: 36),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Image.asset(
                  widget.image,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                widget.title,
                style: AppTypography.bodyTextBold(context)!
                    .copyWith(fontSize: 25, fontWeight: FontWeight.w900),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(widget.description,
                  style:AppTypography.bodyTextNormal(context)!
                  .copyWith(fontSize: 14, fontWeight: FontWeight.w300),),
              ListTileDetail(
                  titleDetail: 'Horário',
                  icon: Icons.calendar_month,
                  subtitle: widget.dataTime),
              const Divider(
                thickness: 0.5,
              ),
              const ListTileDetail(
                  titleDetail: 'Evento on-Line',
                  icon: Icons.video_camera_back_outlined,
                  subtitle: 'Link Disponível para participantes'),
              const Divider(
                thickness: 0.5,
              ),
              const ListTileDetail(
                  titleDetail: 'Programa do Evento',
                  icon: Icons.list_alt_outlined,
                  subtitle: 'Detalhados conforme',
                 trailing: Icons.arrow_forward_ios_outlined,
                  ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text('Grátis', style:TextStyle(fontWeight: FontWeight.w700),),
                        Text('7 Lugares disponíveis')
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      'Confirme',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ListTileDetail extends StatelessWidget {
  const ListTileDetail(
      {Key? key,
      required this.titleDetail,
      required this.icon,
      required this.subtitle,
     this.trailing,
     })
      : super(key: key);
  final String titleDetail;
  final IconData icon;
  final String subtitle;
  final IconData? trailing;
  
  @override
  Widget build(BuildContext context) {
    return ListTile(

      contentPadding: const EdgeInsets.only(left: 0),
      leading: Icon(icon, color:Colors.black,),
      title: Text(
        titleDetail,
        style: AppTypography.bodyTextSemiBold(context)!
            .copyWith(fontWeight: FontWeight.w700, fontSize: 16),
      ),
      subtitle: Text(
        subtitle,style:AppTypography.bodyTextNormal(context)!
                      .copyWith(fontSize: 13, fontWeight: FontWeight.w300),
      ),
      trailing: Icon(trailing, size: 16, color: Colors.black,),
    );
  }
}
