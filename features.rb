Shard.find(1).activate!

#sample set
StudentEnrollment.
  where("computed_final_score IS NOT NULL").
  where(workflow_state: "completed").limit(5)

StudentEnrollment.
  where("computed_final_score IS NOT NULL").
  where("total_activity_time IS NOT NULL").
  where(workflow_state: "completed").limit(20)

FEATURE_HEADERS = [
  "ENROLLMENT_ID",
  "TOTAL_ENROLLMENTS_FOR_STUDENT",
  "TOTAL_ENROLLMENTS_IN_COURSE",
  "TOTAL_ACTIVITY_TIME",
  "SCORE",
  "GRADE"
]

def csv_row(enrollment)
  return [
    enrollment.id,
    enrollment.user.enrollments.count,
    enrollment.course.enrollments.count,
    enrollment.total_activity_time,
    enrollment.computed_final_score,
    enrollment.computed_final_grade
  ]
end
