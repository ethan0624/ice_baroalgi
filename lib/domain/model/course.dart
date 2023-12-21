import 'package:incheon_knowhow/domain/model/spot.dart';
import 'package:json_annotation/json_annotation.dart';

part 'course.g.dart';

@JsonSerializable()
class Course {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'duration')
  final String duration; //  분
  @JsonKey(name: 'distance')
  final String distance; //  km
  @JsonKey(name: 'image')
  final List<String> images;
  @JsonKey(name: 'wishlist')
  final bool isLiked;
  @JsonKey(name: 'spot')
  final int spotCount;
  @JsonKey(name: 'completeSpot')
  final int completedSpotCount;

  // 상세정보
  @JsonKey(name: 'region')
  final String? region;
  @JsonKey(name: 'summary')
  final String? summary;
  @JsonKey(name: 'descript')
  final String? description;
  @JsonKey(name: 'spots')
  final List<Spot>? spots;

  const Course({
    required this.id,
    required this.title,
    required this.duration,
    required this.distance,
    required this.images,
    this.isLiked = false,
    this.spotCount = 0,
    this.completedSpotCount = 0,
    this.region,
    this.summary,
    this.description,
    this.spots,
  });

  factory Course.mock() {
    return const Course(
      id: 1,
      title: '지붕없는 박물관, 강화',
      duration: '270',
      distance: '12',
      images: [''],
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
        images: [
          'https://lh5.googleusercontent.com/p/AF1QipNYtzCdlIQWnkvUhkV9MEb0yV0KKrpIMxtfNGwa=w426-h240-k-no',
        ],
      ),
      Course(
        id: 2,
        title: '지붕없는 박물관, 강화',
        duration: '210',
        distance: '8.5',
        images: [
          'https://lh5.googleusercontent.com/p/AF1QipNYtzCdlIQWnkvUhkV9MEb0yV0KKrpIMxtfNGwa=w426-h240-k-no',
        ],
      ),
      Course(
        id: 3,
        title: '지붕없는 박물관, 강화',
        duration: '410',
        distance: '31.5',
        images: [
          'https://lh5.googleusercontent.com/p/AF1QipNYtzCdlIQWnkvUhkV9MEb0yV0KKrpIMxtfNGwa=w426-h240-k-no',
        ],
      ),
      Course(
        id: 4,
        title: '지붕없는 박물관, 강화',
        duration: '180',
        distance: '7',
        images: [
          'https://lh5.googleusercontent.com/p/AF1QipNYtzCdlIQWnkvUhkV9MEb0yV0KKrpIMxtfNGwa=w426-h240-k-no',
        ],
      ),
      Course(
        id: 5,
        title: '지붕없는 박물관, 강화',
        duration: '420',
        distance: '16',
        images: [
          'https://lh5.googleusercontent.com/p/AF1QipNYtzCdlIQWnkvUhkV9MEb0yV0KKrpIMxtfNGwa=w426-h240-k-no',
        ],
      ),
      Course(
        id: 6,
        title: '지붕없는 박물관, 강화',
        duration: '20',
        distance: '1',
        images: [
          'https://lh5.googleusercontent.com/p/AF1QipNYtzCdlIQWnkvUhkV9MEb0yV0KKrpIMxtfNGwa=w426-h240-k-no',
        ],
      ),
      Course(
        id: 7,
        title: '지붕없는 박물관, 강화',
        duration: '85',
        distance: '4',
        images: [
          'https://lh5.googleusercontent.com/p/AF1QipNYtzCdlIQWnkvUhkV9MEb0yV0KKrpIMxtfNGwa=w426-h240-k-no',
        ],
      ),
    ];
  }
}

extension CourseExtension on Course {
  double get km => double.parse(distance);

  // 총 소요시간(분)
  int get totalDuration => int.parse(duration);

  // 소요시간 (분)
  int get min {
    return totalDuration % 60;
  }

  int get hour {
    return (totalDuration / 60).round();
  }
}
