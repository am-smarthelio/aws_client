// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import 'package:shared_aws_api/shared.dart' as _s;
import 'package:shared_aws_api/shared.dart'
    show
        Uint8ListConverter,
        Uint8ListListConverter,
        rfc822FromJson,
        rfc822ToJson,
        iso8601FromJson,
        iso8601ToJson,
        unixTimestampFromJson,
        unixTimestampToJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

part 'personalize-events-2018-03-22.g.dart';

/// <p/>
class PersonalizeEvents {
  final _s.RestJsonProtocol _protocol;
  PersonalizeEvents({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: 'personalize-events',
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Records user interaction event data.
  ///
  /// May throw [InvalidInputException].
  ///
  /// Parameter [eventList] :
  /// A list of event data from the session.
  ///
  /// Parameter [sessionId] :
  /// The session ID associated with the user's visit.
  ///
  /// Parameter [trackingId] :
  /// The tracking ID for the event. The ID is generated by a call to the <a
  /// href="https://docs.aws.amazon.com/personalize/latest/dg/API_CreateEventTracker.html">CreateEventTracker</a>
  /// API.
  ///
  /// Parameter [userId] :
  /// The user associated with the event.
  Future<void> putEvents({
    @_s.required List<Event> eventList,
    @_s.required String sessionId,
    @_s.required String trackingId,
    String userId,
  }) async {
    ArgumentError.checkNotNull(eventList, 'eventList');
    ArgumentError.checkNotNull(sessionId, 'sessionId');
    _s.validateStringLength(
      'sessionId',
      sessionId,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(trackingId, 'trackingId');
    _s.validateStringLength(
      'trackingId',
      trackingId,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringLength(
      'userId',
      userId,
      1,
      256,
    );
    var query = '';
    final $payload = <String, dynamic>{
      'eventList': eventList,
      'sessionId': sessionId,
      'trackingId': trackingId,
      'userId': userId,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/events$query',
      exceptionFnMap: _exceptionFns,
    );
  }
}

/// Represents user interaction event information sent using the
/// <code>PutEvents</code> API.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Event {
  /// The type of event. This property corresponds to the <code>EVENT_TYPE</code>
  /// field of the Interactions schema.
  @_s.JsonKey(name: 'eventType')
  final String eventType;

  /// A string map of event-specific data that you might choose to record. For
  /// example, if a user rates a movie on your site, you might send the movie ID
  /// and rating, and the number of movie ratings made by the user.
  ///
  /// Each item in the map consists of a key-value pair. For example,
  ///
  /// <code>{"itemId": "movie1"}</code>
  ///
  /// <code>{"itemId": "movie2", "eventValue": "4.5"}</code>
  ///
  /// <code>{"itemId": "movie3", "eventValue": "3", "numberOfRatings":
  /// "12"}</code>
  ///
  /// The keys use camel case names that match the fields in the Interactions
  /// schema. The <code>itemId</code> and <code>eventValue</code> keys correspond
  /// to the <code>ITEM_ID</code> and <code>EVENT_VALUE</code> fields. In the
  /// above example, the <code>eventType</code> might be 'MovieRating' with
  /// <code>eventValue</code> being the rating. The <code>numberOfRatings</code>
  /// would match the 'NUMBER_OF_RATINGS' field defined in the Interactions
  /// schema.
  @_s.JsonKey(name: 'properties')
  final String properties;

  /// The timestamp on the client side when the event occurred.
  @_s.JsonKey(
      name: 'sentAt',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime sentAt;

  /// An ID associated with the event. If an event ID is not provided, Amazon
  /// Personalize generates a unique ID for the event. An event ID is not used as
  /// an input to the model. Amazon Personalize uses the event ID to distinquish
  /// unique events. Any subsequent events after the first with the same event ID
  /// are not used in model training.
  @_s.JsonKey(name: 'eventId')
  final String eventId;

  Event({
    @_s.required this.eventType,
    @_s.required this.properties,
    @_s.required this.sentAt,
    this.eventId,
  });
  Map<String, dynamic> toJson() => _$EventToJson(this);
}

class InvalidInputException extends _s.GenericAwsException {
  InvalidInputException({String type, String message})
      : super(type: type, code: 'InvalidInputException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'InvalidInputException': (type, message) =>
      InvalidInputException(type: type, message: message),
};