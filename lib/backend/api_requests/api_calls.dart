import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class DeleteUserOrSingleVocabCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? mode = '',
    String? docId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Delete User or Single vocab',
      apiUrl: 'https://vokanote-backend-ppjc2w6bzq-an.a.run.app/delete',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '${token}',
      },
      params: {
        'mode': mode,
        'docId': docId,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateVocabCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? word = '',
    String? partOfSpeech = '',
  }) async {
    final ffApiRequestBody = '''
{
  "word": "${escapeStringForJson(word)}",
  "part_of_speech": "${escapeStringForJson(partOfSpeech)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create vocab',
      apiUrl:
          'https://vokanote-backend-ppjc2w6bzq-an.a.run.app/generateContent',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '${token}',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
