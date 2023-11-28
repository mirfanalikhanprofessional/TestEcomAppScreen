
import 'package:http/http.dart' as http;


class NetworkUtility{

  Future<http.Response> httpGetRequestWithoutHeaderWithoutBody(Uri uriEndPoint) async {
    var response = await http.get(
        uriEndPoint
    );
    return response;
  }

}