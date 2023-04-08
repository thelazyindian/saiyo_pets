import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'links.dart';

part 'pagination.g.dart';

@JsonSerializable()
class PaginationDto extends Equatable {
  @JsonKey(name: 'count_per_page')
  final int? countPerPage;
  @JsonKey(name: 'total_count')
  final int? totalCount;
  @JsonKey(name: 'current_page')
  final int? currentPage;
  @JsonKey(name: 'total_pages')
  final int? totalPages;
  @JsonKey(name: '_links')
  final Links? links;

  const PaginationDto({
    this.countPerPage,
    this.totalCount,
    this.currentPage,
    this.totalPages,
    this.links,
  });

  factory PaginationDto.fromJson(Map<String, dynamic> json) {
    return _$PaginationDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PaginationDtoToJson(this);

  @override
  List<Object?> get props {
    return [
      countPerPage,
      totalCount,
      currentPage,
      totalPages,
      links,
    ];
  }
}
