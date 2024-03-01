import '../../core/remote/remote_client.dart';
import '../model/palette_remote_response.dart';
import 'palette_remote_endpoints.dart';

abstract class PaletteRemoteService {
  Future<PaletteRemoteResponse> getPalettes();
}

class PaletteRemoteServiceImpl implements PaletteRemoteService {
  final RemoteClient client = RemoteClient.instace;

  @override
  Future<PaletteRemoteResponse> getPalettes() async {
    final response = await client.get(
      PaletteRemoteEnpoints.palettes,
      queryParameters: {
        'page': 1,
        'per_page': 12,
      },
    );
    return PaletteRemoteResponse.fromMap(response.data);
  }
}
