import 'package:test/test.dart';
import 'input/json/base64_encoded_blobs_test.dart' as _i0;
import 'input/json/empty_maps_test.dart' as _i1;
import 'input/json/endpoint_host_trait_static_prefix_test.dart' as _i2;
import 'input/json/enum_test.dart' as _i3;
import 'input/json/idempotency_token_auto_fill_test.dart' as _i4;
import 'input/json/nested_blobs_test.dart' as _i5;
import 'input/json/recursive_shapes_test.dart' as _i6;
import 'input/json/scalar_members_test.dart' as _i7;
import 'input/json/timestamp_values_test.dart' as _i8;
import 'input/query/base64_encoded_blobs_nested_test.dart' as _i9;
import 'input/query/base64_encoded_blobs_test.dart' as _i10;
import 'input/query/endpoint_host_trait_test.dart' as _i11;
import 'input/query/enum_test.dart' as _i12;
import 'input/query/flattened_list_test.dart' as _i13;
import 'input/query/flattened_list_with_locationname_test.dart' as _i14;
import 'input/query/idempotency_token_auto_fill_test.dart' as _i15;
import 'input/query/list_types_test.dart' as _i16;
import 'input/query/nested_structure_members_test.dart' as _i17;
import 'input/query/non_flattened_list_with_locationname_test.dart' as _i18;
import 'input/query/recursive_shapes_test.dart' as _i19;
import 'input/query/scalar_members_test.dart' as _i20;
import 'input/query/serialize_flattened_map_type_test.dart' as _i21;
import 'input/query/serialize_map_type_test.dart' as _i22;
import 'input/query/serialize_map_type_with_locationname_test.dart' as _i23;
import 'input/query/timestamp_values_test.dart' as _i24;
import 'input/rest-json/blob_payload_test.dart' as _i25;
import 'input/rest-json/boolean_in_querystring_test.dart' as _i26;
import 'input/rest-json/endpoint_host_trait_test.dart' as _i27;
import 'input/rest-json/enum_test.dart' as _i28;
import 'input/rest-json/idempotency_token_auto_fill_test.dart' as _i29;
import 'input/rest-json/json_value_trait_test.dart' as _i30;
import 'input/rest-json/named_locations_in_json_body_test.dart' as _i31;
import 'input/rest-json/no_parameters_test.dart' as _i32;
import 'input/rest-json/omits_null_query_params_but_serializes_empty_strings_test.dart'
    as _i33;
import 'input/rest-json/querystring_list_of_strings_test.dart' as _i34;
import 'input/rest-json/recursive_shapes_test.dart' as _i35;
import 'input/rest-json/serialize_blobs_in_body_test.dart' as _i36;
import 'input/rest-json/streaming_payload_test.dart' as _i37;
import 'input/rest-json/string_payload_test.dart' as _i38;
import 'input/rest-json/string_to_string_list_maps_in_querystring_test.dart'
    as _i39;
import 'input/rest-json/string_to_string_maps_in_querystring_test.dart' as _i40;
import 'input/rest-json/structure_payload_test.dart' as _i41;
import 'input/rest-json/timestamp_values_test.dart' as _i42;
import 'input/rest-json/uri_parameter_and_querystring_params_test.dart' as _i43;
import 'input/rest-json/uri_parameter_only_with_location_name_test.dart'
    as _i44;
import 'input/rest-json/uri_parameter_only_with_no_location_name_test.dart'
    as _i45;
import 'input/rest-json/uri_parameter_querystring_params_and_json_body_test.dart'
    as _i46;
import 'input/rest-json/uri_parameter_querystring_params_headers_and_json_body_test.dart'
    as _i47;
import 'input/rest-xml/basic_xml_serialization_test.dart' as _i48;
import 'input/rest-xml/blob_payload_test.dart' as _i49;
import 'input/rest-xml/blob_shapes_test.dart' as _i50;
import 'input/rest-xml/boolean_in_querystring_test.dart' as _i51;
import 'input/rest-xml/endpoint_host_trait_test.dart' as _i52;
import 'input/rest-xml/enum_test.dart' as _i53;
import 'input/rest-xml/flattened_lists_test.dart' as _i54;
import 'input/rest-xml/flattened_lists_with_locationname_test.dart' as _i55;
import 'input/rest-xml/greedy_keys_test.dart' as _i56;
import 'input/rest-xml/header_maps_test.dart' as _i57;
import 'input/rest-xml/idempotency_token_auto_fill_test.dart' as _i58;
import 'input/rest-xml/list_of_structures_test.dart' as _i59;
import 'input/rest-xml/nested_structures_test.dart' as _i60;
import 'input/rest-xml/non_flattened_lists_test.dart' as _i61;
import 'input/rest-xml/non_flattened_lists_with_locationname_test.dart' as _i62;
import 'input/rest-xml/omits_null_query_params_but_serializes_empty_strings_test.dart'
    as _i63;
import 'input/rest-xml/querystring_list_of_strings_test.dart' as _i64;
import 'input/rest-xml/recursive_shapes_test.dart' as _i65;
import 'input/rest-xml/serialize_other_scalar_types_test.dart' as _i66;
import 'input/rest-xml/string_payload_test.dart' as _i67;
import 'input/rest-xml/string_to_string_list_maps_in_querystring_test.dart'
    as _i68;
import 'input/rest-xml/string_to_string_maps_in_querystring_test.dart' as _i69;
import 'input/rest-xml/structure_payload_test.dart' as _i70;
import 'input/rest-xml/timestamp_shapes_test.dart' as _i71;
import 'input/rest-xml/xml_attribute_test.dart' as _i72;
import 'output/json/blob_members_test.dart' as _i73;
import 'output/json/enum_output_test.dart' as _i74;
import 'output/json/ignores_extra_data_test.dart' as _i75;
import 'output/json/lists_test.dart' as _i76;
import 'output/json/maps_test.dart' as _i77;
import 'output/json/scalar_members_test.dart' as _i78;
import 'output/json/timestamp_members_test.dart' as _i79;
import 'output/query/blob_test.dart' as _i80;
import 'output/query/empty_string_test.dart' as _i81;
import 'output/query/enum_output_test.dart' as _i82;
import 'output/query/flattened_list_of_structures_test.dart' as _i83;
import 'output/query/flattened_list_test.dart' as _i84;
import 'output/query/flattened_list_with_location_name_test.dart' as _i85;
import 'output/query/flattened_map_in_shape_definition_test.dart' as _i86;
import 'output/query/flattened_map_test.dart' as _i87;
import 'output/query/flattened_single_element_list_test.dart' as _i88;
import 'output/query/list_of_structures_test.dart' as _i89;
import 'output/query/list_with_custom_member_name_test.dart' as _i90;
import 'output/query/lists_test.dart' as _i91;
import 'output/query/named_map_test.dart' as _i92;
import 'output/query/normal_map_test.dart' as _i93;
import 'output/query/not_all_members_in_response_test.dart' as _i94;
import 'output/query/scalar_members_test.dart' as _i95;
import 'output/query/timestamp_members_test.dart' as _i96;
import 'output/rest-json/blob_members_test.dart' as _i97;
import 'output/rest-json/complex_list_values_test.dart' as _i98;
import 'output/rest-json/enum_test.dart' as _i99;
import 'output/rest-json/ignores_extra_data_test.dart' as _i100;
import 'output/rest-json/ignores_undefined_output_test.dart' as _i101;
import 'output/rest-json/json_payload_test.dart' as _i102;
import 'output/rest-json/json_value_trait_test.dart' as _i103;
import 'output/rest-json/lists_test.dart' as _i104;
import 'output/rest-json/lists_with_structure_member_test.dart' as _i105;
import 'output/rest-json/maps_test.dart' as _i106;
import 'output/rest-json/scalar_members_test.dart' as _i107;
import 'output/rest-json/streaming_payload_test.dart' as _i108;
import 'output/rest-json/supports_header_maps_test.dart' as _i109;
import 'output/rest-json/timestamp_members_test.dart' as _i110;
import 'output/rest-xml/blob_test.dart' as _i111;
import 'output/rest-xml/empty_string_test.dart' as _i112;
import 'output/rest-xml/enum_test.dart' as _i113;
import 'output/rest-xml/flattened_list_test.dart' as _i114;
import 'output/rest-xml/flattened_map_test.dart' as _i115;
import 'output/rest-xml/list_with_custom_member_name_test.dart' as _i116;
import 'output/rest-xml/lists_test.dart' as _i117;
import 'output/rest-xml/named_map_test.dart' as _i118;
import 'output/rest-xml/normal_map_test.dart' as _i119;
import 'output/rest-xml/scalar_members_in_headers_test.dart' as _i120;
import 'output/rest-xml/scalar_members_test.dart' as _i121;
import 'output/rest-xml/streaming_payload_test.dart' as _i122;
import 'output/rest-xml/timestamp_members_test.dart' as _i123;
import 'output/rest-xml/xml_attributes_test.dart' as _i124;
import 'output/rest-xml/xml_payload_test.dart' as _i125;

void main() {
  group('input/json/base64_encoded_blobs_test', _i0.main);
  group('input/json/empty_maps_test', _i1.main);
  group('input/json/endpoint_host_trait_static_prefix_test', _i2.main);
  group('input/json/enum_test', _i3.main);
  group('input/json/idempotency_token_auto_fill_test', _i4.main);
  group('input/json/nested_blobs_test', _i5.main);
  group('input/json/recursive_shapes_test', _i6.main);
  group('input/json/scalar_members_test', _i7.main);
  group('input/json/timestamp_values_test', _i8.main);
  group('input/query/base64_encoded_blobs_nested_test', _i9.main);
  group('input/query/base64_encoded_blobs_test', _i10.main);
  group('input/query/endpoint_host_trait_test', _i11.main);
  group('input/query/enum_test', _i12.main);
  group('input/query/flattened_list_test', _i13.main);
  group('input/query/flattened_list_with_locationname_test', _i14.main);
  group('input/query/idempotency_token_auto_fill_test', _i15.main);
  group('input/query/list_types_test', _i16.main);
  group('input/query/nested_structure_members_test', _i17.main);
  group('input/query/non_flattened_list_with_locationname_test', _i18.main);
  group('input/query/recursive_shapes_test', _i19.main);
  group('input/query/scalar_members_test', _i20.main);
  group('input/query/serialize_flattened_map_type_test', _i21.main);
  group('input/query/serialize_map_type_test', _i22.main);
  group('input/query/serialize_map_type_with_locationname_test', _i23.main);
  group('input/query/timestamp_values_test', _i24.main);
  group('input/rest-json/blob_payload_test', _i25.main);
  group('input/rest-json/boolean_in_querystring_test', _i26.main);
  group('input/rest-json/endpoint_host_trait_test', _i27.main);
  group('input/rest-json/enum_test', _i28.main);
  group('input/rest-json/idempotency_token_auto_fill_test', _i29.main);
  group('input/rest-json/json_value_trait_test', _i30.main);
  group('input/rest-json/named_locations_in_json_body_test', _i31.main);
  group('input/rest-json/no_parameters_test', _i32.main);
  group(
      'input/rest-json/omits_null_query_params_but_serializes_empty_strings_test',
      _i33.main);
  group('input/rest-json/querystring_list_of_strings_test', _i34.main);
  group('input/rest-json/recursive_shapes_test', _i35.main);
  group('input/rest-json/serialize_blobs_in_body_test', _i36.main);
  group('input/rest-json/streaming_payload_test', _i37.main);
  group('input/rest-json/string_payload_test', _i38.main);
  group('input/rest-json/string_to_string_list_maps_in_querystring_test',
      _i39.main);
  group('input/rest-json/string_to_string_maps_in_querystring_test', _i40.main);
  group('input/rest-json/structure_payload_test', _i41.main);
  group('input/rest-json/timestamp_values_test', _i42.main);
  group('input/rest-json/uri_parameter_and_querystring_params_test', _i43.main);
  group(
      'input/rest-json/uri_parameter_only_with_location_name_test', _i44.main);
  group('input/rest-json/uri_parameter_only_with_no_location_name_test',
      _i45.main);
  group('input/rest-json/uri_parameter_querystring_params_and_json_body_test',
      _i46.main);
  group(
      'input/rest-json/uri_parameter_querystring_params_headers_and_json_body_test',
      _i47.main);
  group('input/rest-xml/basic_xml_serialization_test', _i48.main);
  group('input/rest-xml/blob_payload_test', _i49.main);
  group('input/rest-xml/blob_shapes_test', _i50.main);
  group('input/rest-xml/boolean_in_querystring_test', _i51.main);
  group('input/rest-xml/endpoint_host_trait_test', _i52.main);
  group('input/rest-xml/enum_test', _i53.main);
  group('input/rest-xml/flattened_lists_test', _i54.main);
  group('input/rest-xml/flattened_lists_with_locationname_test', _i55.main);
  group('input/rest-xml/greedy_keys_test', _i56.main);
  group('input/rest-xml/header_maps_test', _i57.main);
  group('input/rest-xml/idempotency_token_auto_fill_test', _i58.main);
  group('input/rest-xml/list_of_structures_test', _i59.main);
  group('input/rest-xml/nested_structures_test', _i60.main);
  group('input/rest-xml/non_flattened_lists_test', _i61.main);
  group('input/rest-xml/non_flattened_lists_with_locationname_test', _i62.main);
  group(
      'input/rest-xml/omits_null_query_params_but_serializes_empty_strings_test',
      _i63.main);
  group('input/rest-xml/querystring_list_of_strings_test', _i64.main);
  group('input/rest-xml/recursive_shapes_test', _i65.main);
  group('input/rest-xml/serialize_other_scalar_types_test', _i66.main);
  group('input/rest-xml/string_payload_test', _i67.main);
  group('input/rest-xml/string_to_string_list_maps_in_querystring_test',
      _i68.main);
  group('input/rest-xml/string_to_string_maps_in_querystring_test', _i69.main);
  group('input/rest-xml/structure_payload_test', _i70.main);
  group('input/rest-xml/timestamp_shapes_test', _i71.main);
  group('input/rest-xml/xml_attribute_test', _i72.main);
  group('output/json/blob_members_test', _i73.main);
  group('output/json/enum_output_test', _i74.main);
  group('output/json/ignores_extra_data_test', _i75.main);
  group('output/json/lists_test', _i76.main);
  group('output/json/maps_test', _i77.main);
  group('output/json/scalar_members_test', _i78.main);
  group('output/json/timestamp_members_test', _i79.main);
  group('output/query/blob_test', _i80.main);
  group('output/query/empty_string_test', _i81.main);
  group('output/query/enum_output_test', _i82.main);
  group('output/query/flattened_list_of_structures_test', _i83.main);
  group('output/query/flattened_list_test', _i84.main);
  group('output/query/flattened_list_with_location_name_test', _i85.main);
  group('output/query/flattened_map_in_shape_definition_test', _i86.main);
  group('output/query/flattened_map_test', _i87.main);
  group('output/query/flattened_single_element_list_test', _i88.main);
  group('output/query/list_of_structures_test', _i89.main);
  group('output/query/list_with_custom_member_name_test', _i90.main);
  group('output/query/lists_test', _i91.main);
  group('output/query/named_map_test', _i92.main);
  group('output/query/normal_map_test', _i93.main);
  group('output/query/not_all_members_in_response_test', _i94.main);
  group('output/query/scalar_members_test', _i95.main);
  group('output/query/timestamp_members_test', _i96.main);
  group('output/rest-json/blob_members_test', _i97.main);
  group('output/rest-json/complex_list_values_test', _i98.main);
  group('output/rest-json/enum_test', _i99.main);
  group('output/rest-json/ignores_extra_data_test', _i100.main);
  group('output/rest-json/ignores_undefined_output_test', _i101.main);
  group('output/rest-json/json_payload_test', _i102.main);
  group('output/rest-json/json_value_trait_test', _i103.main);
  group('output/rest-json/lists_test', _i104.main);
  group('output/rest-json/lists_with_structure_member_test', _i105.main);
  group('output/rest-json/maps_test', _i106.main);
  group('output/rest-json/scalar_members_test', _i107.main);
  group('output/rest-json/streaming_payload_test', _i108.main);
  group('output/rest-json/supports_header_maps_test', _i109.main);
  group('output/rest-json/timestamp_members_test', _i110.main);
  group('output/rest-xml/blob_test', _i111.main);
  group('output/rest-xml/empty_string_test', _i112.main);
  group('output/rest-xml/enum_test', _i113.main);
  group('output/rest-xml/flattened_list_test', _i114.main);
  group('output/rest-xml/flattened_map_test', _i115.main);
  group('output/rest-xml/list_with_custom_member_name_test', _i116.main);
  group('output/rest-xml/lists_test', _i117.main);
  group('output/rest-xml/named_map_test', _i118.main);
  group('output/rest-xml/normal_map_test', _i119.main);
  group('output/rest-xml/scalar_members_in_headers_test', _i120.main);
  group('output/rest-xml/scalar_members_test', _i121.main);
  group('output/rest-xml/streaming_payload_test', _i122.main);
  group('output/rest-xml/timestamp_members_test', _i123.main);
  group('output/rest-xml/xml_attributes_test', _i124.main);
  group('output/rest-xml/xml_payload_test', _i125.main);
}
