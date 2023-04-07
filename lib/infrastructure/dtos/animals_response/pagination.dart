import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'links.dart';

part 'pagination.g.dart';

@JsonSerializable()
class Pagination extends Equatable {
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

  const Pagination({
    this.countPerPage,
    this.totalCount,
    this.currentPage,
    this.totalPages,
    this.links,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return _$PaginationFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PaginationToJson(this);

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
