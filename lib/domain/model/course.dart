import 'package:equatable/equatable.dart';
import 'package:incheon_knowhow/domain/enum/course_state_type.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:incheon_knowhow/domain/model/spot.dart';

part 'course.g.dart';

@JsonSerializable()
class Course extends Equatable {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'duration')
  final String? duration; //  분
  @JsonKey(name: 'distance')
  final String? distance; //  km
  @JsonKey(name: 'image')
  final String? image;
  @JsonKey(name: 'images')
  final List<String>? images;
  @JsonKey(name: 'wishList')
  final bool isLiked;
  @JsonKey(name: 'courseState')
  final bool isCompleted;

  @JsonKey(name: 'spotCount')
  final int spotCount;
  @JsonKey(name: 'completeSpot')
  final int completedSpotCount;
  @JsonKey(name: 'regionId')
  final int? regionId;
  @JsonKey(name: 'region')
  final String? regionName;
  @JsonKey(name: 'categoryId')
  final int? recommendCategoryId;

  // 상세정보
  @JsonKey(name: 'summary')
  final String? summary;
  @JsonKey(name: 'descript')
  final String? description;
  @JsonKey(name: 'spots')
  final List<Spot>? spots;
  @JsonKey(name: 'courseIng')
  final bool? isProgress;

  const Course({
    required this.id,
    required this.title,
    this.duration,
    this.distance,
    this.image,
    this.images,
    this.isLiked = false,
    this.isCompleted = false,
    this.spotCount = 0,
    this.completedSpotCount = 0,
    this.regionId,
    this.regionName,
    this.recommendCategoryId,
    this.summary,
    this.description,
    this.spots,
    this.isProgress = false,
  });

  copyWith({
    bool? isLiked,
    bool? isCompleted,
    bool? isProgress,
    int? spotCount,
    int? completedSpotCount,
  }) {
    return Course(
      id: id,
      title: title,
      description: description,
      distance: distance,
      duration: duration,
      isLiked: isLiked ?? this.isLiked,
      isCompleted: isCompleted ?? this.isCompleted,
      spotCount: spotCount ?? this.spotCount,
      completedSpotCount: completedSpotCount ?? this.completedSpotCount,
      regionId: regionId,
      regionName: regionName,
      recommendCategoryId: recommendCategoryId,
      summary: summary,
      spots: spots,
      image: image,
      images: images,
      isProgress: isProgress ?? this.isProgress,
    );
  }

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);

  Map<String, dynamic> toJson() => _$CourseToJson(this);

  @override
  List<Object?> get props => [
        id,
        title,
        isLiked,
        isCompleted,
        isProgress,
        spotCount,
        completedSpotCount,
      ];
}

extension CourseExtension on Course {
  double get km => double.parse(distance ?? '0');

  // 총 소요시간(분)
  int get totalDuration => int.parse(duration ?? '0');

  // 소요시간 (분)
  int get min {
    return totalDuration % 60;
  }

  // 소요시간 (시간)
  int get hour {
    return (totalDuration / 60).round();
  }

  // 완료 진행률
  double get progress {
    final value = completedSpotCount / spotCount;
    return value.isNaN ? 0 : value;
  }

  CourseStateType get state {
    if (isCompleted) {
      return CourseStateType.completed;
    }

    if (isProgress == false) {
      return CourseStateType.ready;
    }

    final spotList = spots ?? [];
    final includeSpotCount = spotList.length;
    final flagCompletedSpotCount = spotList.where((e) => e.isFlag).length;

    return (includeSpotCount == flagCompletedSpotCount)
        ? CourseStateType.stampReady
        : CourseStateType.inProgress;
  }

  String get detailRoutePath => '/course/$id/info';
}
