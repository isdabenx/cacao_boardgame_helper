class PreparationEntity {
  final String description;
  final String? imagePath;
  bool isCompleted;
  final String? color;

  PreparationEntity({
    required this.description,
    this.imagePath,
    this.isCompleted = false,
    this.color,
  });

  PreparationEntity copyWith({
    String? description,
    String? imagePath,
    bool? isCompleted,
    String? color,
  }) {
    return PreparationEntity(
      description: description ?? this.description,
      imagePath: imagePath ?? this.imagePath,
      isCompleted: isCompleted ?? this.isCompleted,
      color: color ?? this.color,
    );
  }
}
