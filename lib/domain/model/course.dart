import 'package:json_annotation/json_annotation.dart';
import 'package:incheon_knowhow/domain/model/spot.dart';

part 'course.g.dart';

@JsonSerializable()
class Course {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'duration')
  final String? duration; //  분
  @JsonKey(name: 'distance')
  final String? distance; //  km
  // @JsonKey(name: 'image')
  // final List<String> images;
  // @JsonKey(name: 'image')
  // final String? image;
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

  // 상세정보
  @JsonKey(name: 'summary')
  final String? summary;
  @JsonKey(name: 'descript')
  final String? description;
  @JsonKey(name: 'spots')
  final List<Spot>? spots;

  const Course({
    required this.id,
    required this.title,
    this.duration,
    this.distance,
    // this.image,
    this.isLiked = false,
    this.isCompleted = false,
    this.spotCount = 0,
    this.completedSpotCount = 0,
    this.regionId,
    this.regionName,
    this.summary,
    this.description,
    this.spots,
  });

  copyWith({
    bool? isLiked,
    bool? isCompleted,
  }) {
    return Course(
      id: id,
      title: title,
      description: description,
      distance: distance,
      duration: duration,
      isLiked: isLiked ?? this.isLiked,
      isCompleted: isCompleted ?? this.isCompleted,
      spotCount: spotCount,
      completedSpotCount: completedSpotCount,
      regionId: regionId,
      regionName: regionName,
      summary: summary,
      spots: spots,
      // image: image,
    );
  }

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);

  Map<String, dynamic> toJson() => _$CourseToJson(this);

  static List<Course> mocks() {
    return const [
      Course(
        id: 1,
        title: '지붕없는 박물관, 강화',
        duration: '270',
        distance: '12',
        // image: 'https://lh5.googleusercontent.com/p/AF1QipNYtzCdlIQWnkvUhkV9MEb0yV0KKrpIMxtfNGwa=w426-h240-k-no',
        // images: [
        //   'https://lh5.googleusercontent.com/p/AF1QipNYtzCdlIQWnkvUhkV9MEb0yV0KKrpIMxtfNGwa=w426-h240-k-no',
        // ],
      ),
      Course(
        id: 2,
        title: '지붕없는 박물관, 강화',
        duration: '210',
        distance: '8.5',
        // image:'https://lh5.googleusercontent.com/p/AF1QipNYtzCdlIQWnkvUhkV9MEb0yV0KKrpIMxtfNGwa=w426-h240-k-no',
        // images: [
        //   'https://lh5.googleusercontent.com/p/AF1QipNYtzCdlIQWnkvUhkV9MEb0yV0KKrpIMxtfNGwa=w426-h240-k-no',
        // ],
      ),
      Course(
        id: 3,
        title: '지붕없는 박물관, 강화',
        duration: '410',
        distance: '31.5',
        // image: 'https://lh5.googleusercontent.com/p/AF1QipNYtzCdlIQWnkvUhkV9MEb0yV0KKrpIMxtfNGwa=w426-h240-k-no',
        // images: [
        //   'https://lh5.googleusercontent.com/p/AF1QipNYtzCdlIQWnkvUhkV9MEb0yV0KKrpIMxtfNGwa=w426-h240-k-no',
        // ],
      ),
      Course(
        id: 4,
        title: '지붕없는 박물관, 강화',
        duration: '180',
        distance: '7',
        // image: 'https://lh5.googleusercontent.com/p/AF1QipNYtzCdlIQWnkvUhkV9MEb0yV0KKrpIMxtfNGwa=w426-h240-k-no',
        // images: [
        //   'https://lh5.googleusercontent.com/p/AF1QipNYtzCdlIQWnkvUhkV9MEb0yV0KKrpIMxtfNGwa=w426-h240-k-no',
        // ],
      ),
      // Course(
      //   id: 5,
      //   title: '지붕없는 박물관, 강화',
      //   duration: '420',
      //   distance: '16',
      //   images: [
      //     'https://lh5.googleusercontent.com/p/AF1QipNYtzCdlIQWnkvUhkV9MEb0yV0KKrpIMxtfNGwa=w426-h240-k-no',
      //   ],
      // ),
      // Course(
      //   id: 6,
      //   title: '지붕없는 박물관, 강화',
      //   duration: '20',
      //   distance: '1',
      //   images: [
      //     'https://lh5.googleusercontent.com/p/AF1QipNYtzCdlIQWnkvUhkV9MEb0yV0KKrpIMxtfNGwa=w426-h240-k-no',
      //   ],
      // ),
      // Course(
      //   id: 7,
      //   title: '지붕없는 박물관, 강화',
      //   duration: '85',
      //   distance: '4',
      //   images: [
      //     'https://lh5.googleusercontent.com/p/AF1QipNYtzCdlIQWnkvUhkV9MEb0yV0KKrpIMxtfNGwa=w426-h240-k-no',
      //   ],
      // ),
    ];
  }
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

  String get detailRoutePath => '/course/$id/info';
}
