class FileModel {
  final String name;
  final double size;
  final String extension;
  final String? filePath;

  FileModel(
      {required this.name,
      required this.size,
      required this.extension,
      this.filePath});

  static FileModel empty() => FileModel(
        name: '',
        size: 0.0,
        extension: '',
      );

  Map<String, dynamic> toJson() => {
        'fileName': name,
        'size': size,
        'extension': extension,
        'filePath': filePath
      };

  factory FileModel.fromJson(Map<String, dynamic> data) {
    if (data.isEmpty) {
      return FileModel.empty();
    }
    return FileModel(
        name: data['fileName'],
        size: data['size'].toDouble(),
        extension: data['extension'],
        filePath: data['filePath']);
  }

  FileModel copyWith({
    String? name,
    double? size,
    String? extension,
    String? filePath,
  }) {
    return FileModel(
      name: name ?? this.name,
      size: size ?? this.size,
      extension: extension ?? this.extension,
      filePath: filePath ?? this.filePath,
    );
  }
}
