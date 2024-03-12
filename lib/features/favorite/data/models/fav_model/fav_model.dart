import 'package:equatable/equatable.dart';

import 'datum.dart';

class FavModel extends Equatable {
  final String? status;
  final int? count;
  final List<Datum>? data;

  const FavModel({this.status, this.count, this.data});

  factory FavModel.fromJson(Map<String, dynamic> json) => FavModel(
        status: json['status'] as String?,
        count: json['count'] as int?,
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'count': count,
        'data': data?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [status, count, data];
}
