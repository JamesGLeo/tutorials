require 'active_record'
require 'pry'
require_relative 'lib/cohort.rb'
require_relative 'lib/student.rb'

ActiveRecord::Base.establish_connection({
  database: 'wdi_closure_db',
  adapter: 'postgresql'
})

loop do
  puts '---------------'
  puts '   Main Menu'
  puts '---------------'
  puts '1. View all cohorts'
  puts '2. View students of a cohort'
  puts '3. Add cohort'
  puts '4. Add student to cohort'
  puts '5. Remove student'
  puts '6. Move student'
  puts '7. Remove cohort'
  puts '0. Quit'
  puts 'Enter your choice:'
  user_input = gets.chomp

  case user_input
  when '1'
    Cohort.all.each do |cohort|
      puts cohort.info
    end
  when '2'
    Cohort.all.each do |cohort|
      puts "#{cohort.id}. #{cohort.name}"
    end
    puts 'Which cohort:'
    cohort_id = gets.chomp.to_i
    puts 'Students'
    puts '--------'
    Cohort.find(cohort_id).students.each do |student|
      puts student.name
    end
  when '3'
    puts 'Enter name:'
    name_input = gets.chomp
    puts 'Enter start date:'
    date_input = gets.chomp
    Cohort.create({
      name: name_input,
      start_date: date_input
    })
  when '4'
    Cohort.all.each do |cohort|
      puts "#{cohort.id}. #{cohort.name}"
    end
    puts 'Which cohort:'
    cohort_id = gets.chomp.to_i
    puts 'Enter name:'
    name_input = gets.chomp
    puts 'Enter favorite color:'
    fav_color_input = gets.chomp
    puts 'Enter number:'
    fav_num_input = gets.chomp.to_i
    Cohort.find(cohort_id).students.create({
      name: name_input,
      favorite_color: fav_color_input,
      favorite_number: fav_num_input
    })
  when '5'
    Cohort.all.each do |cohort|
      puts "#{cohort.id}. #{cohort.name}"
    end
    puts 'Which cohort:'
    cohort_id = gets.chomp.to_i
    cohort = Cohort.find(cohort_id)

    cohort.students.each do |student|
      puts "#{student.id}. #{student.name}"
    end
    puts 'Which student:'
    student_id = gets.chomp.to_i
    Student.find(student_id).destroy
  when '6'
    Cohort.all.each do |cohort|
      puts "#{cohort.id}. #{cohort.name}"
    end
    puts 'FROM which cohort:'
    from_cohort_id = gets.chomp.to_i
    cohort = Cohort.find(from_cohort_id)

    cohort.students.each do |student|
      puts "#{student.id}. #{student.name}"
    end
    puts 'Which student:'
    student_id = gets.chomp.to_i

    Cohort.all.each do |cohort|
      puts "#{cohort.id}. #{cohort.name}"
    end
    puts 'TO which cohort:'
    to_cohort_id = gets.chomp.to_i

    Student.find(student_id).update(cohort: Cohort.find(to_cohort_id))
  when '7'
    Cohort.all.each do |cohort|
      puts "#{cohort.id}. #{cohort.name}"
    end
    puts 'Which cohort:'
    cohort_id = gets.chomp.to_i
    Cohort.destroy(cohort_id)
  when '0'
    exit
  end
end
