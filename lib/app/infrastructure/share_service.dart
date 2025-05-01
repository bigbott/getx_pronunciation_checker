import 'package:share_plus/share_plus.dart';

abstract interface class IShareService {
  Future<bool> share(String msg);
}

final class ShareService implements IShareService {
  @override
  Future<bool> share(String msg) async {
    var params = ShareParams(text: msg);
    final result = await SharePlus.instance.share(params);
    return result.status == ShareResultStatus.success;
  }
}
