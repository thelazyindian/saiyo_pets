// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pagination _$PaginationFromJson(Map<String, dynamic> json) => Pagination(
      countPerPage: json['count_per_page'] as int?,
      totalCount: json['total_count'] as int?,
      currentPage: json['current_page'] as int?,
      totalPages: json['total_pages'] as int?,
      links: json['_links'] == null
          ? null
          : Links.fromJson(json['_links'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PaginationToJson(Pagination instance) =>
    <String, dynamic>{
      'count_per_page': instance.countPerPage,
      'total_count': instance.totalCount,
      'current_page': instance.currentPage,
      'total_pages': instance.totalPages,
      '_links': instance.links,
    };
