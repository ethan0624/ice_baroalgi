enum CourseStateType {
  ready, // 아직 코스 시작은 하지 않은 상태
  inProgress, // 코스를 시작해서 아직 모든 스팟의 깃발을 등록하지 않은 상태
  stampReady, // 스팟 깃발 등록은 완료하였고 스탬프 미발행 상태
  completed, // 스탬프 발행 완료 코스 정복 완료 상태
}
