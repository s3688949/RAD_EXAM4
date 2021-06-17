# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "json"

Answer.destroy_all
Attempt.destroy_all
History.destroy_all
Question.destroy_all

file = File.read('./quiz.json')
data = JSON.parse(file)

data.each do |child|
  createObject = Question.create(text: child['question'], description: child['description'], explaination: child['explaination'], category: child['category'], difficulty: child['difficulty'])
  puts Question
  createObject.answers.build(text: child['answers']['answer_a'], correct: child['correct_answers']['answer_a_correct'])
  createObject.answers.build(text: child['answers']['answer_b'], correct: child['correct_answers']['answer_b_correct'])
  createObject.answers.build(text: child['answers']['answer_c'], correct: child['correct_answers']['answer_c_correct'])
  createObject.answers.build(text: child['answers']['answer_d'], correct: child['correct_answers']['answer_d_correct'])
  createObject.answers.build(text: child['answers']['answer_e'], correct: child['correct_answers']['answer_e_correct'])
  createObject.answers.build(text: child['answers']['answer_f'], correct: child['correct_answers']['answer_f_correct'])
end