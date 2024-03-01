import 'palette_model.dart';

class PaletteRemoteResponse {
  const PaletteRemoteResponse({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.data,
  });

  factory PaletteRemoteResponse.fromMap(Map<String, dynamic> map) {
    return PaletteRemoteResponse(
      page: map['page'] as int,
      perPage: map['per_page'] as int,
      total: map['total'] as int,
      totalPages: map['total_pages'] as int,
      data: List<PaletteModel>.from(
        (map['data'] as List).map<PaletteModel>(
          (x) => PaletteModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  final int page;
  final int perPage;
  final int total;
  final int totalPages;
  final List<PaletteModel> data;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'page': page,
      'per_page': perPage,
      'total': total,
      'total_pages': totalPages,
      'data': data.map((x) => x.toMap()).toList(),
    };
  }
}
