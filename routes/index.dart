import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context) async {
  final req = context.request;
  final body = {
    'method': req.method.value,
    'uri': req.uri.toString(),
    'url': req.url.toString(),
    'headers': req.headers,
    'params': req.params,
    'queryParameters': req.uri.queryParameters,
    'queryParametersAll': req.uri.queryParametersAll,
    'hasScheme': req.uri.hasScheme,
    'hasAuthority': req.uri.hasAuthority,
    'hasPort': req.uri.hasPort,
    'hasQuery': req.uri.hasQuery,
    'hasFragment': req.uri.hasFragment,
    'pathSegments': req.uri.pathSegments,
    'fragment': req.uri.fragment,
    'connectionInfo': {
      'remoteAddress': req.connectionInfo.remoteAddress.toString(),
      'remotePort': req.connectionInfo.remotePort,
      'localPort': req.connectionInfo.localPort,
    },
    'body': await req.body(),
  };
  return Response.json(body: body);
}
