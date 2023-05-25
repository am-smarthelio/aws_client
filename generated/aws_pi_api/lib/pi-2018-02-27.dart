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
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        nonNullableTimeStampFromJson,
        timeStampFromJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

/// Amazon RDS Performance Insights enables you to monitor and explore different
/// dimensions of database load based on data captured from a running DB
/// instance. The guide provides detailed information about Performance Insights
/// data types, parameters and errors.
class PI {
  final _s.JsonProtocol _protocol;
  PI({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'pi',
            signingName: 'pi',
          ),
          region: region,
          credentials: credentials,
          credentialsProvider: credentialsProvider,
          endpointUrl: endpointUrl,
        );

  /// Closes the internal HTTP client if none was provided at creation.
  /// If a client was passed as a constructor argument, this becomes a noop.
  ///
  /// It's important to close all clients when it's done being used; failing to
  /// do so can cause the Dart process to hang.
  void close() {
    _protocol.close();
  }

  /// For a specific time period, retrieve the top <code>N</code> dimension keys
  /// for a metric.
  /// <note>
  /// Each response element returns a maximum of 500 bytes. For larger elements,
  /// such as SQL statements, only the first 500 bytes are returned.
  /// </note>
  ///
  /// May throw [InvalidArgumentException].
  /// May throw [InternalServiceError].
  /// May throw [NotAuthorizedException].
  ///
  /// Parameter [endTime] :
  /// The date and time specifying the end of the requested time series data.
  /// The value specified is <i>exclusive</i>, which means that data points less
  /// than (but not equal to) <code>EndTime</code> are returned.
  ///
  /// The value for <code>EndTime</code> must be later than the value for
  /// <code>StartTime</code>.
  ///
  /// Parameter [groupBy] :
  /// A specification for how to aggregate the data points from a query result.
  /// You must specify a valid dimension group. Performance Insights returns all
  /// dimensions within this group, unless you provide the names of specific
  /// dimensions within this group. You can also request that Performance
  /// Insights return a limited number of values for a dimension.
  ///
  /// Parameter [identifier] :
  /// An immutable, Amazon Web Services Region-unique identifier for a data
  /// source. Performance Insights gathers metrics from this data source.
  ///
  /// To use an Amazon RDS instance as a data source, you specify its
  /// <code>DbiResourceId</code> value. For example, specify
  /// <code>db-FAIHNTYBKTGAUSUZQYPDS2GW4A</code>.
  ///
  /// Parameter [metric] :
  /// The name of a Performance Insights metric to be measured.
  ///
  /// Valid values for <code>Metric</code> are:
  ///
  /// <ul>
  /// <li>
  /// <code>db.load.avg</code> - A scaled representation of the number of active
  /// sessions for the database engine.
  /// </li>
  /// <li>
  /// <code>db.sampledload.avg</code> - The raw number of active sessions for
  /// the database engine.
  /// </li>
  /// </ul>
  /// If the number of active sessions is less than an internal Performance
  /// Insights threshold, <code>db.load.avg</code> and
  /// <code>db.sampledload.avg</code> are the same value. If the number of
  /// active sessions is greater than the internal threshold, Performance
  /// Insights samples the active sessions, with <code>db.load.avg</code>
  /// showing the scaled values, <code>db.sampledload.avg</code> showing the raw
  /// values, and <code>db.sampledload.avg</code> less than
  /// <code>db.load.avg</code>. For most use cases, you can query
  /// <code>db.load.avg</code> only.
  ///
  /// Parameter [serviceType] :
  /// The Amazon Web Services service for which Performance Insights will return
  /// metrics. Valid values are as follows:
  ///
  /// <ul>
  /// <li>
  /// <code>RDS</code>
  /// </li>
  /// <li>
  /// <code>DOCDB</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [startTime] :
  /// The date and time specifying the beginning of the requested time series
  /// data. You must specify a <code>StartTime</code> within the past 7 days.
  /// The value specified is <i>inclusive</i>, which means that data points
  /// equal to or greater than <code>StartTime</code> are returned.
  ///
  /// The value for <code>StartTime</code> must be earlier than the value for
  /// <code>EndTime</code>.
  ///
  /// Parameter [additionalMetrics] :
  /// Additional metrics for the top <code>N</code> dimension keys. If the
  /// specified dimension group in the <code>GroupBy</code> parameter is
  /// <code>db.sql_tokenized</code>, you can specify per-SQL metrics to get the
  /// values for the top <code>N</code> SQL digests. The response syntax is as
  /// follows: <code>"AdditionalMetrics" : { "<i>string</i>" : "<i>string</i>"
  /// }</code>.
  ///
  /// Parameter [filter] :
  /// One or more filters to apply in the request. Restrictions:
  ///
  /// <ul>
  /// <li>
  /// Any number of filters by the same dimension, as specified in the
  /// <code>GroupBy</code> or <code>Partition</code> parameters.
  /// </li>
  /// <li>
  /// A single filter for any other dimension in this dimension group.
  /// </li>
  /// </ul>
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return in the response. If more items exist
  /// than the specified <code>MaxRecords</code> value, a pagination token is
  /// included in the response so that the remaining results can be retrieved.
  ///
  /// Parameter [nextToken] :
  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// token, up to the value specified by <code>MaxRecords</code>.
  ///
  /// Parameter [partitionBy] :
  /// For each dimension specified in <code>GroupBy</code>, specify a secondary
  /// dimension to further subdivide the partition keys in the response.
  ///
  /// Parameter [periodInSeconds] :
  /// The granularity, in seconds, of the data points returned from Performance
  /// Insights. A period can be as short as one second, or as long as one day
  /// (86400 seconds). Valid values are:
  ///
  /// <ul>
  /// <li>
  /// <code>1</code> (one second)
  /// </li>
  /// <li>
  /// <code>60</code> (one minute)
  /// </li>
  /// <li>
  /// <code>300</code> (five minutes)
  /// </li>
  /// <li>
  /// <code>3600</code> (one hour)
  /// </li>
  /// <li>
  /// <code>86400</code> (twenty-four hours)
  /// </li>
  /// </ul>
  /// If you don't specify <code>PeriodInSeconds</code>, then Performance
  /// Insights chooses a value for you, with a goal of returning roughly 100-200
  /// data points in the response.
  Future<DescribeDimensionKeysResponse> describeDimensionKeys({
    required DateTime endTime,
    required DimensionGroup groupBy,
    required String identifier,
    required String metric,
    required ServiceType serviceType,
    required DateTime startTime,
    List<String>? additionalMetrics,
    Map<String, String>? filter,
    int? maxResults,
    String? nextToken,
    DimensionGroup? partitionBy,
    int? periodInSeconds,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      25,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PerformanceInsightsv20180227.DescribeDimensionKeys'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EndTime': unixTimestampToJson(endTime),
        'GroupBy': groupBy,
        'Identifier': identifier,
        'Metric': metric,
        'ServiceType': serviceType.toValue(),
        'StartTime': unixTimestampToJson(startTime),
        if (additionalMetrics != null) 'AdditionalMetrics': additionalMetrics,
        if (filter != null) 'Filter': filter,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (partitionBy != null) 'PartitionBy': partitionBy,
        if (periodInSeconds != null) 'PeriodInSeconds': periodInSeconds,
      },
    );

    return DescribeDimensionKeysResponse.fromJson(jsonResponse.body);
  }

  /// Get the attributes of the specified dimension group for a DB instance or
  /// data source. For example, if you specify a SQL ID,
  /// <code>GetDimensionKeyDetails</code> retrieves the full text of the
  /// dimension <code>db.sql.statement</code> associated with this ID. This
  /// operation is useful because <code>GetResourceMetrics</code> and
  /// <code>DescribeDimensionKeys</code> don't support retrieval of large SQL
  /// statement text.
  ///
  /// May throw [InvalidArgumentException].
  /// May throw [InternalServiceError].
  /// May throw [NotAuthorizedException].
  ///
  /// Parameter [group] :
  /// The name of the dimension group. Performance Insights searches the
  /// specified group for the dimension group ID. The following group name
  /// values are valid:
  ///
  /// <ul>
  /// <li>
  /// <code>db.query</code> (Amazon DocumentDB only)
  /// </li>
  /// <li>
  /// <code>db.sql</code> (Amazon RDS and Aurora only)
  /// </li>
  /// </ul>
  ///
  /// Parameter [groupIdentifier] :
  /// The ID of the dimension group from which to retrieve dimension details.
  /// For dimension group <code>db.sql</code>, the group ID is
  /// <code>db.sql.id</code>. The following group ID values are valid:
  ///
  /// <ul>
  /// <li>
  /// <code>db.sql.id</code> for dimension group <code>db.sql</code> (Aurora and
  /// RDS only)
  /// </li>
  /// <li>
  /// <code>db.query.id</code> for dimension group <code>db.query</code>
  /// (DocumentDB only)
  /// </li>
  /// </ul>
  ///
  /// Parameter [identifier] :
  /// The ID for a data source from which to gather dimension data. This ID must
  /// be immutable and unique within an Amazon Web Services Region. When a DB
  /// instance is the data source, specify its <code>DbiResourceId</code> value.
  /// For example, specify <code>db-ABCDEFGHIJKLMNOPQRSTU1VW2X</code>.
  ///
  /// Parameter [serviceType] :
  /// The Amazon Web Services service for which Performance Insights returns
  /// data. The only valid value is <code>RDS</code>.
  ///
  /// Parameter [requestedDimensions] :
  /// A list of dimensions to retrieve the detail data for within the given
  /// dimension group. If you don't specify this parameter, Performance Insights
  /// returns all dimension data within the specified dimension group. Specify
  /// dimension names for the following dimension groups:
  ///
  /// <ul>
  /// <li>
  /// <code>db.sql</code> - Specify either the full dimension name
  /// <code>db.sql.statement</code> or the short dimension name
  /// <code>statement</code> (Aurora and RDS only).
  /// </li>
  /// <li>
  /// <code>db.query</code> - Specify either the full dimension name
  /// <code>db.query.statement</code> or the short dimension name
  /// <code>statement</code> (DocumentDB only).
  /// </li>
  /// </ul>
  Future<GetDimensionKeyDetailsResponse> getDimensionKeyDetails({
    required String group,
    required String groupIdentifier,
    required String identifier,
    required ServiceType serviceType,
    List<String>? requestedDimensions,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PerformanceInsightsv20180227.GetDimensionKeyDetails'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Group': group,
        'GroupIdentifier': groupIdentifier,
        'Identifier': identifier,
        'ServiceType': serviceType.toValue(),
        if (requestedDimensions != null)
          'RequestedDimensions': requestedDimensions,
      },
    );

    return GetDimensionKeyDetailsResponse.fromJson(jsonResponse.body);
  }

  /// Retrieve the metadata for different features. For example, the metadata
  /// might indicate that a feature is turned on or off on a specific DB
  /// instance.
  ///
  /// May throw [InvalidArgumentException].
  /// May throw [InternalServiceError].
  /// May throw [NotAuthorizedException].
  ///
  /// Parameter [identifier] :
  /// An immutable identifier for a data source that is unique for an Amazon Web
  /// Services Region. Performance Insights gathers metrics from this data
  /// source. To use a DB instance as a data source, specify its
  /// <code>DbiResourceId</code> value. For example, specify
  /// <code>db-ABCDEFGHIJKLMNOPQRSTU1VW2X</code>.
  ///
  /// Parameter [serviceType] :
  /// The Amazon Web Services service for which Performance Insights returns
  /// metrics.
  Future<GetResourceMetadataResponse> getResourceMetadata({
    required String identifier,
    required ServiceType serviceType,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PerformanceInsightsv20180227.GetResourceMetadata'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Identifier': identifier,
        'ServiceType': serviceType.toValue(),
      },
    );

    return GetResourceMetadataResponse.fromJson(jsonResponse.body);
  }

  /// Retrieve Performance Insights metrics for a set of data sources over a
  /// time period. You can provide specific dimension groups and dimensions, and
  /// provide aggregation and filtering criteria for each group.
  /// <note>
  /// Each response element returns a maximum of 500 bytes. For larger elements,
  /// such as SQL statements, only the first 500 bytes are returned.
  /// </note>
  ///
  /// May throw [InvalidArgumentException].
  /// May throw [InternalServiceError].
  /// May throw [NotAuthorizedException].
  ///
  /// Parameter [endTime] :
  /// The date and time specifying the end of the requested time series query
  /// range. The value specified is <i>exclusive</i>. Thus, the command returns
  /// data points less than (but not equal to) <code>EndTime</code>.
  ///
  /// The value for <code>EndTime</code> must be later than the value for
  /// <code>StartTime</code>.
  ///
  /// Parameter [identifier] :
  /// An immutable identifier for a data source that is unique for an Amazon Web
  /// Services Region. Performance Insights gathers metrics from this data
  /// source. In the console, the identifier is shown as <i>ResourceID</i>. When
  /// you call <code>DescribeDBInstances</code>, the identifier is returned as
  /// <code>DbiResourceId</code>.
  ///
  /// To use a DB instance as a data source, specify its
  /// <code>DbiResourceId</code> value. For example, specify
  /// <code>db-ABCDEFGHIJKLMNOPQRSTU1VW2X</code>.
  ///
  /// Parameter [metricQueries] :
  /// An array of one or more queries to perform. Each query must specify a
  /// Performance Insights metric, and can optionally specify aggregation and
  /// filtering criteria.
  ///
  /// Parameter [serviceType] :
  /// The Amazon Web Services service for which Performance Insights returns
  /// metrics. Valid values are as follows:
  ///
  /// <ul>
  /// <li>
  /// <code>RDS</code>
  /// </li>
  /// <li>
  /// <code>DOCDB</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [startTime] :
  /// The date and time specifying the beginning of the requested time series
  /// query range. You can't specify a <code>StartTime</code> that is earlier
  /// than 7 days ago. By default, Performance Insights has 7 days of retention,
  /// but you can extend this range up to 2 years. The value specified is
  /// <i>inclusive</i>. Thus, the command returns data points equal to or
  /// greater than <code>StartTime</code>.
  ///
  /// The value for <code>StartTime</code> must be earlier than the value for
  /// <code>EndTime</code>.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return in the response. If more items exist
  /// than the specified <code>MaxRecords</code> value, a pagination token is
  /// included in the response so that the remaining results can be retrieved.
  ///
  /// Parameter [nextToken] :
  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// token, up to the value specified by <code>MaxRecords</code>.
  ///
  /// Parameter [periodAlignment] :
  /// The returned timestamp which is the start or end time of the time periods.
  /// The default value is <code>END_TIME</code>.
  ///
  /// Parameter [periodInSeconds] :
  /// The granularity, in seconds, of the data points returned from Performance
  /// Insights. A period can be as short as one second, or as long as one day
  /// (86400 seconds). Valid values are:
  ///
  /// <ul>
  /// <li>
  /// <code>1</code> (one second)
  /// </li>
  /// <li>
  /// <code>60</code> (one minute)
  /// </li>
  /// <li>
  /// <code>300</code> (five minutes)
  /// </li>
  /// <li>
  /// <code>3600</code> (one hour)
  /// </li>
  /// <li>
  /// <code>86400</code> (twenty-four hours)
  /// </li>
  /// </ul>
  /// If you don't specify <code>PeriodInSeconds</code>, then Performance
  /// Insights will choose a value for you, with a goal of returning roughly
  /// 100-200 data points in the response.
  Future<GetResourceMetricsResponse> getResourceMetrics({
    required DateTime endTime,
    required String identifier,
    required List<MetricQuery> metricQueries,
    required ServiceType serviceType,
    required DateTime startTime,
    int? maxResults,
    String? nextToken,
    PeriodAlignment? periodAlignment,
    int? periodInSeconds,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      25,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'PerformanceInsightsv20180227.GetResourceMetrics'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EndTime': unixTimestampToJson(endTime),
        'Identifier': identifier,
        'MetricQueries': metricQueries,
        'ServiceType': serviceType.toValue(),
        'StartTime': unixTimestampToJson(startTime),
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (periodAlignment != null)
          'PeriodAlignment': periodAlignment.toValue(),
        if (periodInSeconds != null) 'PeriodInSeconds': periodInSeconds,
      },
    );

    return GetResourceMetricsResponse.fromJson(jsonResponse.body);
  }

  /// Retrieve the dimensions that can be queried for each specified metric type
  /// on a specified DB instance.
  ///
  /// May throw [InvalidArgumentException].
  /// May throw [InternalServiceError].
  /// May throw [NotAuthorizedException].
  ///
  /// Parameter [identifier] :
  /// An immutable identifier for a data source that is unique within an Amazon
  /// Web Services Region. Performance Insights gathers metrics from this data
  /// source. To use an Amazon RDS DB instance as a data source, specify its
  /// <code>DbiResourceId</code> value. For example, specify
  /// <code>db-ABCDEFGHIJKLMNOPQRSTU1VWZ</code>.
  ///
  /// Parameter [metrics] :
  /// The types of metrics for which to retrieve dimensions. Valid values
  /// include <code>db.load</code>.
  ///
  /// Parameter [serviceType] :
  /// The Amazon Web Services service for which Performance Insights returns
  /// metrics.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return in the response. If more items exist
  /// than the specified <code>MaxRecords</code> value, a pagination token is
  /// included in the response so that the remaining results can be retrieved.
  ///
  /// Parameter [nextToken] :
  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// token, up to the value specified by <code>MaxRecords</code>.
  Future<ListAvailableResourceDimensionsResponse>
      listAvailableResourceDimensions({
    required String identifier,
    required List<String> metrics,
    required ServiceType serviceType,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      25,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'PerformanceInsightsv20180227.ListAvailableResourceDimensions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Identifier': identifier,
        'Metrics': metrics,
        'ServiceType': serviceType.toValue(),
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListAvailableResourceDimensionsResponse.fromJson(jsonResponse.body);
  }

  /// Retrieve metrics of the specified types that can be queried for a
  /// specified DB instance.
  ///
  /// May throw [InvalidArgumentException].
  /// May throw [InternalServiceError].
  /// May throw [NotAuthorizedException].
  ///
  /// Parameter [identifier] :
  /// An immutable identifier for a data source that is unique within an Amazon
  /// Web Services Region. Performance Insights gathers metrics from this data
  /// source. To use an Amazon RDS DB instance as a data source, specify its
  /// <code>DbiResourceId</code> value. For example, specify
  /// <code>db-ABCDEFGHIJKLMNOPQRSTU1VWZ</code>.
  ///
  /// Parameter [metricTypes] :
  /// The types of metrics to return in the response. Valid values in the array
  /// include the following:
  ///
  /// <ul>
  /// <li>
  /// <code>os</code> (OS counter metrics) - All engines
  /// </li>
  /// <li>
  /// <code>db</code> (DB load metrics) - All engines except for Amazon
  /// DocumentDB
  /// </li>
  /// <li>
  /// <code>db.sql.stats</code> (per-SQL metrics) - All engines except for
  /// Amazon DocumentDB
  /// </li>
  /// <li>
  /// <code>db.sql_tokenized.stats</code> (per-SQL digest metrics) - All engines
  /// except for Amazon DocumentDB
  /// </li>
  /// </ul>
  ///
  /// Parameter [serviceType] :
  /// The Amazon Web Services service for which Performance Insights returns
  /// metrics.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to return. If the <code>MaxRecords</code>
  /// value is less than the number of existing items, the response includes a
  /// pagination token.
  ///
  /// Parameter [nextToken] :
  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the
  /// token, up to the value specified by <code>MaxRecords</code>.
  Future<ListAvailableResourceMetricsResponse> listAvailableResourceMetrics({
    required String identifier,
    required List<String> metricTypes,
    required ServiceType serviceType,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      25,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'PerformanceInsightsv20180227.ListAvailableResourceMetrics'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Identifier': identifier,
        'MetricTypes': metricTypes,
        'ServiceType': serviceType.toValue(),
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListAvailableResourceMetricsResponse.fromJson(jsonResponse.body);
  }
}

/// A timestamp, and a single numerical value, which together represent a
/// measurement at a particular point in time.
class DataPoint {
  /// The time, in epoch format, associated with a particular <code>Value</code>.
  final DateTime timestamp;

  /// The actual value associated with a particular <code>Timestamp</code>.
  final double value;

  DataPoint({
    required this.timestamp,
    required this.value,
  });

  factory DataPoint.fromJson(Map<String, dynamic> json) {
    return DataPoint(
      timestamp: nonNullableTimeStampFromJson(json['Timestamp'] as Object),
      value: json['Value'] as double,
    );
  }
}

class DescribeDimensionKeysResponse {
  /// The end time for the returned dimension keys, after alignment to a granular
  /// boundary (as specified by <code>PeriodInSeconds</code>).
  /// <code>AlignedEndTime</code> will be greater than or equal to the value of
  /// the user-specified <code>Endtime</code>.
  final DateTime? alignedEndTime;

  /// The start time for the returned dimension keys, after alignment to a
  /// granular boundary (as specified by <code>PeriodInSeconds</code>).
  /// <code>AlignedStartTime</code> will be less than or equal to the value of the
  /// user-specified <code>StartTime</code>.
  final DateTime? alignedStartTime;

  /// The dimension keys that were requested.
  final List<DimensionKeyDescription>? keys;

  /// A pagination token that indicates the response didn’t return all available
  /// records because <code>MaxRecords</code> was specified in the previous
  /// request. To get the remaining records, specify <code>NextToken</code> in a
  /// separate request with this value.
  final String? nextToken;

  /// If <code>PartitionBy</code> was present in the request,
  /// <code>PartitionKeys</code> contains the breakdown of dimension keys by the
  /// specified partitions.
  final List<ResponsePartitionKey>? partitionKeys;

  DescribeDimensionKeysResponse({
    this.alignedEndTime,
    this.alignedStartTime,
    this.keys,
    this.nextToken,
    this.partitionKeys,
  });

  factory DescribeDimensionKeysResponse.fromJson(Map<String, dynamic> json) {
    return DescribeDimensionKeysResponse(
      alignedEndTime: timeStampFromJson(json['AlignedEndTime']),
      alignedStartTime: timeStampFromJson(json['AlignedStartTime']),
      keys: (json['Keys'] as List?)
          ?.whereNotNull()
          .map((e) =>
              DimensionKeyDescription.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
      partitionKeys: (json['PartitionKeys'] as List?)
          ?.whereNotNull()
          .map((e) => ResponsePartitionKey.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

enum DetailStatus {
  available,
  processing,
  unavailable,
}

extension DetailStatusValueExtension on DetailStatus {
  String toValue() {
    switch (this) {
      case DetailStatus.available:
        return 'AVAILABLE';
      case DetailStatus.processing:
        return 'PROCESSING';
      case DetailStatus.unavailable:
        return 'UNAVAILABLE';
    }
  }
}

extension DetailStatusFromString on String {
  DetailStatus toDetailStatus() {
    switch (this) {
      case 'AVAILABLE':
        return DetailStatus.available;
      case 'PROCESSING':
        return DetailStatus.processing;
      case 'UNAVAILABLE':
        return DetailStatus.unavailable;
    }
    throw Exception('$this is not known in enum DetailStatus');
  }
}

/// The information about a dimension.
class DimensionDetail {
  /// The identifier of a dimension.
  final String? identifier;

  DimensionDetail({
    this.identifier,
  });

  factory DimensionDetail.fromJson(Map<String, dynamic> json) {
    return DimensionDetail(
      identifier: json['Identifier'] as String?,
    );
  }
}

/// A logical grouping of Performance Insights metrics for a related subject
/// area. For example, the <code>db.sql</code> dimension group consists of the
/// following dimensions:
///
/// <ul>
/// <li>
/// <code>db.sql.id</code> - The hash of a running SQL statement, generated by
/// Performance Insights.
/// </li>
/// <li>
/// <code>db.sql.db_id</code> - Either the SQL ID generated by the database
/// engine, or a value generated by Performance Insights that begins with
/// <code>pi-</code>.
/// </li>
/// <li>
/// <code>db.sql.statement</code> - The full text of the SQL statement that is
/// running, for example, <code>SELECT * FROM employees</code>.
/// </li>
/// <li>
/// <code>db.sql_tokenized.id</code> - The hash of the SQL digest generated by
/// Performance Insights.
/// </li>
/// </ul> <note>
/// Each response element returns a maximum of 500 bytes. For larger elements,
/// such as SQL statements, only the first 500 bytes are returned.
/// </note>
class DimensionGroup {
  /// The name of the dimension group. Valid values are as follows:
  ///
  /// <ul>
  /// <li>
  /// <code>db</code> - The name of the database to which the client is connected.
  /// The following values are permitted:
  ///
  /// <ul>
  /// <li>
  /// Aurora PostgreSQL
  /// </li>
  /// <li>
  /// Amazon RDS PostgreSQL
  /// </li>
  /// <li>
  /// Aurora MySQL
  /// </li>
  /// <li>
  /// Amazon RDS MySQL
  /// </li>
  /// <li>
  /// Amazon RDS MariaDB
  /// </li>
  /// <li>
  /// Amazon DocumentDB
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>db.application</code> - The name of the application that is connected
  /// to the database. The following values are permitted:
  ///
  /// <ul>
  /// <li>
  /// Aurora PostgreSQL
  /// </li>
  /// <li>
  /// Amazon RDS PostgreSQL
  /// </li>
  /// <li>
  /// Amazon DocumentDB
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>db.host</code> - The host name of the connected client (all engines).
  /// </li>
  /// <li>
  /// <code>db.query</code> - The query that is currently running (only Amazon
  /// DocumentDB).
  /// </li>
  /// <li>
  /// <code>db.query_tokenized</code> - The digest query (only Amazon DocumentDB).
  /// </li>
  /// <li>
  /// <code>db.session_type</code> - The type of the current session (only Aurora
  /// PostgreSQL and RDS PostgreSQL).
  /// </li>
  /// <li>
  /// <code>db.sql</code> - The text of the SQL statement that is currently
  /// running (all engines except Amazon DocumentDB).
  /// </li>
  /// <li>
  /// <code>db.sql_tokenized</code> - The SQL digest (all engines except Amazon
  /// DocumentDB).
  /// </li>
  /// <li>
  /// <code>db.user</code> - The user logged in to the database (all engines
  /// except Amazon DocumentDB).
  /// </li>
  /// <li>
  /// <code>db.wait_event</code> - The event for which the database backend is
  /// waiting (all engines except Amazon DocumentDB).
  /// </li>
  /// <li>
  /// <code>db.wait_event_type</code> - The type of event for which the database
  /// backend is waiting (all engines except Amazon DocumentDB).
  /// </li>
  /// <li>
  /// <code>db.wait_state</code> - The event for which the database backend is
  /// waiting (only Amazon DocumentDB).
  /// </li>
  /// </ul>
  final String group;

  /// A list of specific dimensions from a dimension group. If this parameter is
  /// not present, then it signifies that all of the dimensions in the group were
  /// requested, or are present in the response.
  ///
  /// Valid values for elements in the <code>Dimensions</code> array are:
  ///
  /// <ul>
  /// <li>
  /// <code>db.application.name</code> - The name of the application that is
  /// connected to the database. Valid values are as follows:
  ///
  /// <ul>
  /// <li>
  /// Aurora PostgreSQL
  /// </li>
  /// <li>
  /// Amazon RDS PostgreSQL
  /// </li>
  /// <li>
  /// Amazon DocumentDB
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>db.host.id</code> - The host ID of the connected client (all engines).
  /// </li>
  /// <li>
  /// <code>db.host.name</code> - The host name of the connected client (all
  /// engines).
  /// </li>
  /// <li>
  /// <code>db.name</code> - The name of the database to which the client is
  /// connected. Valid values are as follows:
  ///
  /// <ul>
  /// <li>
  /// Aurora PostgreSQL
  /// </li>
  /// <li>
  /// Amazon RDS PostgreSQL
  /// </li>
  /// <li>
  /// Aurora MySQL
  /// </li>
  /// <li>
  /// Amazon RDS MySQL
  /// </li>
  /// <li>
  /// Amazon RDS MariaDB
  /// </li>
  /// <li>
  /// Amazon DocumentDB
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>db.query.id</code> - The query ID generated by Performance Insights
  /// (only Amazon DocumentDB).
  /// </li>
  /// <li>
  /// <code>db.query.db_id</code> - The query ID generated by the database (only
  /// Amazon DocumentDB).
  /// </li>
  /// <li>
  /// <code>db.query.statement</code> - The text of the query that is being run
  /// (only Amazon DocumentDB).
  /// </li>
  /// <li>
  /// <code>db.query.tokenized_id</code>
  /// </li>
  /// <li>
  /// <code>db.query.tokenized.id</code> - The query digest ID generated by
  /// Performance Insights (only Amazon DocumentDB).
  /// </li>
  /// <li>
  /// <code>db.query.tokenized.db_id</code> - The query digest ID generated by
  /// Performance Insights (only Amazon DocumentDB).
  /// </li>
  /// <li>
  /// <code>db.query.tokenized.statement</code> - The text of the query digest
  /// (only Amazon DocumentDB).
  /// </li>
  /// <li>
  /// <code>db.session_type.name</code> - The type of the current session (only
  /// Amazon DocumentDB).
  /// </li>
  /// <li>
  /// <code>db.sql.id</code> - The hash of the full, non-tokenized SQL statement
  /// generated by Performance Insights (all engines except Amazon DocumentDB).
  /// </li>
  /// <li>
  /// <code>db.sql.db_id</code> - Either the SQL ID generated by the database
  /// engine, or a value generated by Performance Insights that begins with
  /// <code>pi-</code> (all engines except Amazon DocumentDB).
  /// </li>
  /// <li>
  /// <code>db.sql.statement</code> - The full text of the SQL statement that is
  /// running, as in <code>SELECT * FROM employees</code> (all engines except
  /// Amazon DocumentDB)
  /// </li>
  /// <li>
  /// <code>db.sql.tokenized_id</code>
  /// </li>
  /// <li>
  /// <code>db.sql_tokenized.id</code> - The hash of the SQL digest generated by
  /// Performance Insights (all engines except Amazon DocumentDB). In the console,
  /// <code>db.sql_tokenized.id</code> is called the Support ID because Amazon Web
  /// Services Support can look at this data to help you troubleshoot database
  /// issues.
  /// </li>
  /// <li>
  /// <code>db.sql_tokenized.db_id</code> - Either the native database ID used to
  /// refer to the SQL statement, or a synthetic ID such as
  /// <code>pi-2372568224</code> that Performance Insights generates if the native
  /// database ID isn't available (all engines except Amazon DocumentDB).
  /// </li>
  /// <li>
  /// <code>db.sql_tokenized.statement</code> - The text of the SQL digest, as in
  /// <code>SELECT * FROM employees WHERE employee_id = ?</code> (all engines
  /// except Amazon DocumentDB)
  /// </li>
  /// <li>
  /// <code>db.user.id</code> - The ID of the user logged in to the database (all
  /// engines except Amazon DocumentDB).
  /// </li>
  /// <li>
  /// <code>db.user.name</code> - The name of the user logged in to the database
  /// (all engines except Amazon DocumentDB).
  /// </li>
  /// <li>
  /// <code>db.wait_event.name</code> - The event for which the backend is waiting
  /// (all engines except Amazon DocumentDB).
  /// </li>
  /// <li>
  /// <code>db.wait_event.type</code> - The type of event for which the backend is
  /// waiting (all engines except Amazon DocumentDB).
  /// </li>
  /// <li>
  /// <code>db.wait_event_type.name</code> - The name of the event type for which
  /// the backend is waiting (all engines except Amazon DocumentDB).
  /// </li>
  /// <li>
  /// <code>db.wait_state.name</code> - The event for which the backend is waiting
  /// (only Amazon DocumentDB).
  /// </li>
  /// </ul>
  final List<String>? dimensions;

  /// The maximum number of items to fetch for this dimension group.
  final int? limit;

  DimensionGroup({
    required this.group,
    this.dimensions,
    this.limit,
  });
  Map<String, dynamic> toJson() {
    final group = this.group;
    final dimensions = this.dimensions;
    final limit = this.limit;
    return {
      'Group': group,
      if (dimensions != null) 'Dimensions': dimensions,
      if (limit != null) 'Limit': limit,
    };
  }
}

/// Information about dimensions within a dimension group.
class DimensionGroupDetail {
  /// The dimensions within a dimension group.
  final List<DimensionDetail>? dimensions;

  /// The name of the dimension group.
  final String? group;

  DimensionGroupDetail({
    this.dimensions,
    this.group,
  });

  factory DimensionGroupDetail.fromJson(Map<String, dynamic> json) {
    return DimensionGroupDetail(
      dimensions: (json['Dimensions'] as List?)
          ?.whereNotNull()
          .map((e) => DimensionDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      group: json['Group'] as String?,
    );
  }
}

/// An object that includes the requested dimension key values and aggregated
/// metric values within a dimension group.
class DimensionKeyDescription {
  /// A map that contains the value for each additional metric.
  final Map<String, double>? additionalMetrics;

  /// A map of name-value pairs for the dimensions in the group.
  final Map<String, String>? dimensions;

  /// If <code>PartitionBy</code> was specified, <code>PartitionKeys</code>
  /// contains the dimensions that were.
  final List<double>? partitions;

  /// The aggregated metric value for the dimensions, over the requested time
  /// range.
  final double? total;

  DimensionKeyDescription({
    this.additionalMetrics,
    this.dimensions,
    this.partitions,
    this.total,
  });

  factory DimensionKeyDescription.fromJson(Map<String, dynamic> json) {
    return DimensionKeyDescription(
      additionalMetrics: (json['AdditionalMetrics'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as double)),
      dimensions: (json['Dimensions'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      partitions: (json['Partitions'] as List?)
          ?.whereNotNull()
          .map((e) => e as double)
          .toList(),
      total: json['Total'] as double?,
    );
  }
}

/// An object that describes the details for a specified dimension.
class DimensionKeyDetail {
  /// The full name of the dimension. The full name includes the group name and
  /// key name. The following values are valid:
  ///
  /// <ul>
  /// <li>
  /// <code>db.query.statement</code> (Amazon DocumentDB)
  /// </li>
  /// <li>
  /// <code>db.sql.statement</code> (Amazon RDS and Aurora)
  /// </li>
  /// </ul>
  final String? dimension;

  /// The status of the dimension detail data. Possible values include the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// <code>AVAILABLE</code> - The dimension detail data is ready to be retrieved.
  /// </li>
  /// <li>
  /// <code>PROCESSING</code> - The dimension detail data isn't ready to be
  /// retrieved because more processing time is required. If the requested detail
  /// data has the status <code>PROCESSING</code>, Performance Insights returns
  /// the truncated query.
  /// </li>
  /// <li>
  /// <code>UNAVAILABLE</code> - The dimension detail data could not be collected
  /// successfully.
  /// </li>
  /// </ul>
  final DetailStatus? status;

  /// The value of the dimension detail data. Depending on the return status, this
  /// value is either the full or truncated SQL query for the following
  /// dimensions:
  ///
  /// <ul>
  /// <li>
  /// <code>db.query.statement</code> (Amazon DocumentDB)
  /// </li>
  /// <li>
  /// <code>db.sql.statement</code> (Amazon RDS and Aurora)
  /// </li>
  /// </ul>
  final String? value;

  DimensionKeyDetail({
    this.dimension,
    this.status,
    this.value,
  });

  factory DimensionKeyDetail.fromJson(Map<String, dynamic> json) {
    return DimensionKeyDetail(
      dimension: json['Dimension'] as String?,
      status: (json['Status'] as String?)?.toDetailStatus(),
      value: json['Value'] as String?,
    );
  }
}

/// The metadata for a feature. For example, the metadata might indicate that a
/// feature is turned on or off on a specific DB instance.
class FeatureMetadata {
  /// The status of the feature on the DB instance. Possible values include the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// <code>ENABLED</code> - The feature is enabled on the instance.
  /// </li>
  /// <li>
  /// <code>DISABLED</code> - The feature is disabled on the instance.
  /// </li>
  /// <li>
  /// <code>UNSUPPORTED</code> - The feature isn't supported on the instance.
  /// </li>
  /// <li>
  /// <code>ENABLED_PENDING_REBOOT</code> - The feature is enabled on the instance
  /// but requires a reboot to take effect.
  /// </li>
  /// <li>
  /// <code>DISABLED_PENDING_REBOOT</code> - The feature is disabled on the
  /// instance but requires a reboot to take effect.
  /// </li>
  /// <li>
  /// <code>UNKNOWN</code> - The feature status couldn't be determined.
  /// </li>
  /// </ul>
  final FeatureStatus? status;

  FeatureMetadata({
    this.status,
  });

  factory FeatureMetadata.fromJson(Map<String, dynamic> json) {
    return FeatureMetadata(
      status: (json['Status'] as String?)?.toFeatureStatus(),
    );
  }
}

enum FeatureStatus {
  enabled,
  disabled,
  unsupported,
  enabledPendingReboot,
  disabledPendingReboot,
  unknown,
}

extension FeatureStatusValueExtension on FeatureStatus {
  String toValue() {
    switch (this) {
      case FeatureStatus.enabled:
        return 'ENABLED';
      case FeatureStatus.disabled:
        return 'DISABLED';
      case FeatureStatus.unsupported:
        return 'UNSUPPORTED';
      case FeatureStatus.enabledPendingReboot:
        return 'ENABLED_PENDING_REBOOT';
      case FeatureStatus.disabledPendingReboot:
        return 'DISABLED_PENDING_REBOOT';
      case FeatureStatus.unknown:
        return 'UNKNOWN';
    }
  }
}

extension FeatureStatusFromString on String {
  FeatureStatus toFeatureStatus() {
    switch (this) {
      case 'ENABLED':
        return FeatureStatus.enabled;
      case 'DISABLED':
        return FeatureStatus.disabled;
      case 'UNSUPPORTED':
        return FeatureStatus.unsupported;
      case 'ENABLED_PENDING_REBOOT':
        return FeatureStatus.enabledPendingReboot;
      case 'DISABLED_PENDING_REBOOT':
        return FeatureStatus.disabledPendingReboot;
      case 'UNKNOWN':
        return FeatureStatus.unknown;
    }
    throw Exception('$this is not known in enum FeatureStatus');
  }
}

class GetDimensionKeyDetailsResponse {
  /// The details for the requested dimensions.
  final List<DimensionKeyDetail>? dimensions;

  GetDimensionKeyDetailsResponse({
    this.dimensions,
  });

  factory GetDimensionKeyDetailsResponse.fromJson(Map<String, dynamic> json) {
    return GetDimensionKeyDetailsResponse(
      dimensions: (json['Dimensions'] as List?)
          ?.whereNotNull()
          .map((e) => DimensionKeyDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class GetResourceMetadataResponse {
  /// The metadata for different features. For example, the metadata might
  /// indicate that a feature is turned on or off on a specific DB instance.
  final Map<String, FeatureMetadata>? features;

  /// An immutable identifier for a data source that is unique for an Amazon Web
  /// Services Region. Performance Insights gathers metrics from this data source.
  /// To use a DB instance as a data source, specify its
  /// <code>DbiResourceId</code> value. For example, specify
  /// <code>db-ABCDEFGHIJKLMNOPQRSTU1VW2X</code>.
  final String? identifier;

  GetResourceMetadataResponse({
    this.features,
    this.identifier,
  });

  factory GetResourceMetadataResponse.fromJson(Map<String, dynamic> json) {
    return GetResourceMetadataResponse(
      features: (json['Features'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, FeatureMetadata.fromJson(e as Map<String, dynamic>))),
      identifier: json['Identifier'] as String?,
    );
  }
}

class GetResourceMetricsResponse {
  /// The end time for the returned metrics, after alignment to a granular
  /// boundary (as specified by <code>PeriodInSeconds</code>).
  /// <code>AlignedEndTime</code> will be greater than or equal to the value of
  /// the user-specified <code>Endtime</code>.
  final DateTime? alignedEndTime;

  /// The start time for the returned metrics, after alignment to a granular
  /// boundary (as specified by <code>PeriodInSeconds</code>).
  /// <code>AlignedStartTime</code> will be less than or equal to the value of the
  /// user-specified <code>StartTime</code>.
  final DateTime? alignedStartTime;

  /// An immutable identifier for a data source that is unique for an Amazon Web
  /// Services Region. Performance Insights gathers metrics from this data source.
  /// In the console, the identifier is shown as <i>ResourceID</i>. When you call
  /// <code>DescribeDBInstances</code>, the identifier is returned as
  /// <code>DbiResourceId</code>.
  final String? identifier;

  /// An array of metric results, where each array element contains all of the
  /// data points for a particular dimension.
  final List<MetricKeyDataPoints>? metricList;

  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the token,
  /// up to the value specified by <code>MaxRecords</code>.
  final String? nextToken;

  GetResourceMetricsResponse({
    this.alignedEndTime,
    this.alignedStartTime,
    this.identifier,
    this.metricList,
    this.nextToken,
  });

  factory GetResourceMetricsResponse.fromJson(Map<String, dynamic> json) {
    return GetResourceMetricsResponse(
      alignedEndTime: timeStampFromJson(json['AlignedEndTime']),
      alignedStartTime: timeStampFromJson(json['AlignedStartTime']),
      identifier: json['Identifier'] as String?,
      metricList: (json['MetricList'] as List?)
          ?.whereNotNull()
          .map((e) => MetricKeyDataPoints.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }
}

class ListAvailableResourceDimensionsResponse {
  /// The dimension information returned for requested metric types.
  final List<MetricDimensionGroups>? metricDimensions;

  /// An optional pagination token provided by a previous request. If this
  /// parameter is specified, the response includes only records beyond the token,
  /// up to the value specified by <code>MaxRecords</code>.
  final String? nextToken;

  ListAvailableResourceDimensionsResponse({
    this.metricDimensions,
    this.nextToken,
  });

  factory ListAvailableResourceDimensionsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListAvailableResourceDimensionsResponse(
      metricDimensions: (json['MetricDimensions'] as List?)
          ?.whereNotNull()
          .map((e) => MetricDimensionGroups.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }
}

class ListAvailableResourceMetricsResponse {
  /// An array of metrics available to query. Each array element contains the full
  /// name, description, and unit of the metric.
  final List<ResponseResourceMetric>? metrics;

  /// A pagination token that indicates the response didn’t return all available
  /// records because <code>MaxRecords</code> was specified in the previous
  /// request. To get the remaining records, specify <code>NextToken</code> in a
  /// separate request with this value.
  final String? nextToken;

  ListAvailableResourceMetricsResponse({
    this.metrics,
    this.nextToken,
  });

  factory ListAvailableResourceMetricsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListAvailableResourceMetricsResponse(
      metrics: (json['Metrics'] as List?)
          ?.whereNotNull()
          .map(
              (e) => ResponseResourceMetric.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }
}

/// The available dimension information for a metric type.
class MetricDimensionGroups {
  /// The available dimension groups for a metric type.
  final List<DimensionGroupDetail>? groups;

  /// The metric type to which the dimension information belongs.
  final String? metric;

  MetricDimensionGroups({
    this.groups,
    this.metric,
  });

  factory MetricDimensionGroups.fromJson(Map<String, dynamic> json) {
    return MetricDimensionGroups(
      groups: (json['Groups'] as List?)
          ?.whereNotNull()
          .map((e) => DimensionGroupDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      metric: json['Metric'] as String?,
    );
  }
}

/// A time-ordered series of data points, corresponding to a dimension of a
/// Performance Insights metric.
class MetricKeyDataPoints {
  /// An array of timestamp-value pairs, representing measurements over a period
  /// of time.
  final List<DataPoint>? dataPoints;

  /// The dimensions to which the data points apply.
  final ResponseResourceMetricKey? key;

  MetricKeyDataPoints({
    this.dataPoints,
    this.key,
  });

  factory MetricKeyDataPoints.fromJson(Map<String, dynamic> json) {
    return MetricKeyDataPoints(
      dataPoints: (json['DataPoints'] as List?)
          ?.whereNotNull()
          .map((e) => DataPoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      key: json['Key'] != null
          ? ResponseResourceMetricKey.fromJson(
              json['Key'] as Map<String, dynamic>)
          : null,
    );
  }
}

/// A single query to be processed. You must provide the metric to query. If no
/// other parameters are specified, Performance Insights returns all data points
/// for the specified metric. Optionally, you can request that the data points
/// be aggregated by dimension group (<code>GroupBy</code>), and return only
/// those data points that match your criteria (<code>Filter</code>).
class MetricQuery {
  /// The name of a Performance Insights metric to be measured.
  ///
  /// Valid values for <code>Metric</code> are:
  ///
  /// <ul>
  /// <li>
  /// <code>db.load.avg</code> - A scaled representation of the number of active
  /// sessions for the database engine.
  /// </li>
  /// <li>
  /// <code>db.sampledload.avg</code> - The raw number of active sessions for the
  /// database engine.
  /// </li>
  /// <li>
  /// The counter metrics listed in <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/USER_PerfInsights_Counters.html#USER_PerfInsights_Counters.OS">Performance
  /// Insights operating system counters</a> in the <i>Amazon Aurora User
  /// Guide</i>.
  /// </li>
  /// </ul>
  /// If the number of active sessions is less than an internal Performance
  /// Insights threshold, <code>db.load.avg</code> and
  /// <code>db.sampledload.avg</code> are the same value. If the number of active
  /// sessions is greater than the internal threshold, Performance Insights
  /// samples the active sessions, with <code>db.load.avg</code> showing the
  /// scaled values, <code>db.sampledload.avg</code> showing the raw values, and
  /// <code>db.sampledload.avg</code> less than <code>db.load.avg</code>. For most
  /// use cases, you can query <code>db.load.avg</code> only.
  final String metric;

  /// One or more filters to apply in the request. Restrictions:
  ///
  /// <ul>
  /// <li>
  /// Any number of filters by the same dimension, as specified in the
  /// <code>GroupBy</code> parameter.
  /// </li>
  /// <li>
  /// A single filter for any other dimension in this dimension group.
  /// </li>
  /// </ul>
  final Map<String, String>? filter;

  /// A specification for how to aggregate the data points from a query result.
  /// You must specify a valid dimension group. Performance Insights will return
  /// all of the dimensions within that group, unless you provide the names of
  /// specific dimensions within that group. You can also request that Performance
  /// Insights return a limited number of values for a dimension.
  final DimensionGroup? groupBy;

  MetricQuery({
    required this.metric,
    this.filter,
    this.groupBy,
  });
  Map<String, dynamic> toJson() {
    final metric = this.metric;
    final filter = this.filter;
    final groupBy = this.groupBy;
    return {
      'Metric': metric,
      if (filter != null) 'Filter': filter,
      if (groupBy != null) 'GroupBy': groupBy,
    };
  }
}

enum PeriodAlignment {
  endTime,
  startTime,
}

extension PeriodAlignmentValueExtension on PeriodAlignment {
  String toValue() {
    switch (this) {
      case PeriodAlignment.endTime:
        return 'END_TIME';
      case PeriodAlignment.startTime:
        return 'START_TIME';
    }
  }
}

extension PeriodAlignmentFromString on String {
  PeriodAlignment toPeriodAlignment() {
    switch (this) {
      case 'END_TIME':
        return PeriodAlignment.endTime;
      case 'START_TIME':
        return PeriodAlignment.startTime;
    }
    throw Exception('$this is not known in enum PeriodAlignment');
  }
}

/// If <code>PartitionBy</code> was specified in a
/// <code>DescribeDimensionKeys</code> request, the dimensions are returned in
/// an array. Each element in the array specifies one dimension.
class ResponsePartitionKey {
  /// A dimension map that contains the dimensions for this partition.
  final Map<String, String> dimensions;

  ResponsePartitionKey({
    required this.dimensions,
  });

  factory ResponsePartitionKey.fromJson(Map<String, dynamic> json) {
    return ResponsePartitionKey(
      dimensions: (json['Dimensions'] as Map<String, dynamic>)
          .map((k, e) => MapEntry(k, e as String)),
    );
  }
}

/// An object that contains the full name, description, and unit of a metric.
class ResponseResourceMetric {
  /// The description of the metric.
  final String? description;

  /// The full name of the metric.
  final String? metric;

  /// The unit of the metric.
  final String? unit;

  ResponseResourceMetric({
    this.description,
    this.metric,
    this.unit,
  });

  factory ResponseResourceMetric.fromJson(Map<String, dynamic> json) {
    return ResponseResourceMetric(
      description: json['Description'] as String?,
      metric: json['Metric'] as String?,
      unit: json['Unit'] as String?,
    );
  }
}

/// An object describing a Performance Insights metric and one or more
/// dimensions for that metric.
class ResponseResourceMetricKey {
  /// The name of a Performance Insights metric to be measured.
  ///
  /// Valid values for <code>Metric</code> are:
  ///
  /// <ul>
  /// <li>
  /// <code>db.load.avg</code> - A scaled representation of the number of active
  /// sessions for the database engine.
  /// </li>
  /// <li>
  /// <code>db.sampledload.avg</code> - The raw number of active sessions for the
  /// database engine.
  /// </li>
  /// <li>
  /// The counter metrics listed in <a
  /// href="https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/USER_PerfInsights_Counters.html#USER_PerfInsights_Counters.OS">Performance
  /// Insights operating system counters</a> in the <i>Amazon Aurora User
  /// Guide</i>.
  /// </li>
  /// </ul>
  /// If the number of active sessions is less than an internal Performance
  /// Insights threshold, <code>db.load.avg</code> and
  /// <code>db.sampledload.avg</code> are the same value. If the number of active
  /// sessions is greater than the internal threshold, Performance Insights
  /// samples the active sessions, with <code>db.load.avg</code> showing the
  /// scaled values, <code>db.sampledload.avg</code> showing the raw values, and
  /// <code>db.sampledload.avg</code> less than <code>db.load.avg</code>. For most
  /// use cases, you can query <code>db.load.avg</code> only.
  final String metric;

  /// The valid dimensions for the metric.
  final Map<String, String>? dimensions;

  ResponseResourceMetricKey({
    required this.metric,
    this.dimensions,
  });

  factory ResponseResourceMetricKey.fromJson(Map<String, dynamic> json) {
    return ResponseResourceMetricKey(
      metric: json['Metric'] as String,
      dimensions: (json['Dimensions'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }
}

enum ServiceType {
  rds,
  docdb,
}

extension ServiceTypeValueExtension on ServiceType {
  String toValue() {
    switch (this) {
      case ServiceType.rds:
        return 'RDS';
      case ServiceType.docdb:
        return 'DOCDB';
    }
  }
}

extension ServiceTypeFromString on String {
  ServiceType toServiceType() {
    switch (this) {
      case 'RDS':
        return ServiceType.rds;
      case 'DOCDB':
        return ServiceType.docdb;
    }
    throw Exception('$this is not known in enum ServiceType');
  }
}

class InternalServiceError extends _s.GenericAwsException {
  InternalServiceError({String? type, String? message})
      : super(type: type, code: 'InternalServiceError', message: message);
}

class InvalidArgumentException extends _s.GenericAwsException {
  InvalidArgumentException({String? type, String? message})
      : super(type: type, code: 'InvalidArgumentException', message: message);
}

class NotAuthorizedException extends _s.GenericAwsException {
  NotAuthorizedException({String? type, String? message})
      : super(type: type, code: 'NotAuthorizedException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'InternalServiceError': (type, message) =>
      InternalServiceError(type: type, message: message),
  'InvalidArgumentException': (type, message) =>
      InvalidArgumentException(type: type, message: message),
  'NotAuthorizedException': (type, message) =>
      NotAuthorizedException(type: type, message: message),
};
