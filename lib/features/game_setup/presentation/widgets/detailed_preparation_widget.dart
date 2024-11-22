import 'package:cacao_boardgame_helper/core/theme/app_colors.dart';
import 'package:cacao_boardgame_helper/features/game_setup/domain/entities/preparation_entity.dart';
import 'package:cacao_boardgame_helper/shared/widgets/container_full_style_widget.dart';
import 'package:cacao_boardgame_helper/shared/widgets/header_widget.dart';
import 'package:flutter/material.dart';

class DetailedPreparationWidget extends StatelessWidget {
  const DetailedPreparationWidget({super.key, required this.preparation});

  final List<PreparationEntity> preparation;

  @override
  Widget build(BuildContext context) {
    return ContainerFullStyleWidget(
      child: Column(
        children: [
          HeaderWidget(text: 'Preparation'),
          Expanded(
            child: ListView.builder(
              itemCount: preparation.length,
              itemBuilder: (context, index) {
                return PreparationCard(preparation: preparation[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class PreparationCard extends StatefulWidget {
  const PreparationCard({super.key, required this.preparation});

  final PreparationEntity preparation;

  @override
  State<PreparationCard> createState() => _PreparationCardState();
}

class _PreparationCardState extends State<PreparationCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.preparation.isCompleted
          ? AppColors.greenNormal
          : AppColors.greenDark,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          title: Text(
            widget.preparation.description,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                decoration: widget.preparation.isCompleted
                    ? TextDecoration.lineThrough
                    : null,
                color: (widget.preparation.color != null &&
                        !widget.preparation.isCompleted)
                    ? AppColors.findColorByName(widget.preparation.color!)
                    : AppColors.brown),
          ),
          leading: widget.preparation.imagePath != null
              ? Image.asset(
                  widget.preparation.imagePath!,
                )
              : null,
          onTap: () {
            setState(() {
              widget.preparation.isCompleted = !widget.preparation.isCompleted;
            });
          },
        ),
      ),
    );
  }
}
