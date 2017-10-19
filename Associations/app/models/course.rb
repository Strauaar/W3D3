class Course < ApplicationRecord

  has_many :enrollments,
  primary_key: :id,
  class_name: 'Enrollment',
  foreign_key: :course_id

  has_many :enrolled_students,
  through: :enrollments,
  source: :user

  belongs_to :prereq,
  primary_key: :id,
  class_name: 'Course',
  foreign_key: :prereq_id

  belongs_to :instructor,
  primary_key: :id,
  class_name: 'User',
  foreign_key: :instructor_id

end
