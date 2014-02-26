# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
if User.count==0
User.create(first_name: 'Brian')
User.create(first_name: 'Brandon')
end

# name, machine weight, split, record per dumbbell
exercises = [
    ["Cable Rows", 0, false, false],
    ["Close Grip Pulldowns", 0, false, false],
    ["Wide Grip Lat Pulldowns", 0, false, false],
    ["Dumbbell Pullovers", 0, true, false],
    ["Smith Upright Rows", 15, true, false],
    ["Seated Bent Rear Delt Dumbbell Flyes", 0, true, false],
    ["Seated Dumbbell Shoulder Press", 0, true, false],
    ["Dumbbell Lateral Raise", 0, true, false],
    ["Smith Squats", 15, true, false],
    ["Narrow Leg Press", 167, true, false],
    ["Dumbbell Stiff Legged Deadlifts", 0, true, false],
    ["Smith Incline Bench Press", 15, true, false],
    ["Smith Flat Press", 15, true, false],
    ["Dumbbell Flat Press", 0, true, false],
    ["Dumbbell Press No Arc", 0, true, false],
    ["Barbell Upright Rows", 30, true, false],
    ["Rear Delt Dumbbell Flyes", 0, true, false],
    ["Seated Dumbbell Shoulder Press", 0, true, false],
    ["Dumbbell Lateral Raise - Full Range", 0, true, false]
]
exercises.each do |exercise|
  Exercise.create(name: exercise[0], machine_weight: exercise[1], split: exercise[2], record_per_dumbbell: exercise[3])
end