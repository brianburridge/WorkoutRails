# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.where(first_name: 'Brian').first_or_create
User.where(first_name: 'Brandon').first_or_create

# name, machine weight, split, record per dumbbell
exercises = [
    ["Barbell Squat", 45, true, false],
    ["Barbell Deadlift", 45, true, false],
    ["Smith Narrow Squats", 15, true, false],
    ["Smith Chair Squats", 15, true, false],
    ["Close Grip Cable Rows", 0, false, false],
    ["Close Grip Pulldowns", 0, false, false],
    ["Wide Grip Lat Pulldowns", 0, false, false],
    ["Behind the Head Lat Pulldown", 0, false, false],
    ["Kneeling Crossover Cable Lat Pulldown", 0, true, false],
    ["Wide Grip Cable Row", 0, false, false],
    ["Dumbbell Pullovers", 0, true, false],
    ["Smith Upright Rows", 15, true, false],
    ["Seated Bent Rear Delt Dumbbell Flyes", 0, true, false],
    ["Seated Dumbbell Shoulder Press", 0, true, false],
    ["Dumbbell Lateral Raise", 0, true, false],
    ["Incline Barbell Press", 45, true, false],
    ["Dumbbell Incline Flyes with Twist", 0, true, false],
    ["Dumbbell Flyes", 0, true, false],
    ["Smith Squats", 15, true, false],
    ["Narrow Leg Press", 167, true, false],
    ["Dumbbell Stiff Legged Deadlifts", 0, true, false],
    ["Smith Incline Bench Press", 15, true, false],
    ["Smith Flat Press", 15, true, false],
    ["Dumbbell Flat Press", 0, true, false],
    ["Dumbbell Incline Flyes", 0, true, false],
    ["Dumbbell Press No Arc", 0, true, false],
    ["Barbell Upright Rows", 30, true, false],
    ["Rear Delt Dumbbell Flyes", 0, true, false],
    ["Seated Dumbbell Shoulder Press", 0, true, false],
    ["Dumbbell Lateral Raise - Full Range", 0, true, false],
    ["Skull Crushers", 30, true, false],
    ["Ez Bar Curls", 30, true, false],
    ["Cable Rope Curls", 0, false, false],
    ["Cable Rope Push-Thrus ", 0, false, false],
    ["Reverse Tricep Pushdowns", 0, false, false],
    ["Seated Cable Row Curls", 0, false, false],
    ["Smith Chair Squats", 15, true, false],
    ["Smith Narrow Squats", 15, true, false],
    ["Barbell Deadlift", 45, true, false],
    ["Ex Bar Supermans", 30, true, false]
]
exercises.each do |exercise_seed|
  exercise = Exercise.where(name: exercise_seed[0]).first_or_initialize
  exercise.machine_weight = exercise_seed[1]
  exercise.split = exercise_seed[2]
  exercise.record_per_dumbbell = exercise_seed[3]
  exercise.save
end
