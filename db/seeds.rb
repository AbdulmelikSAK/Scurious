puts 'Suppression des anciennes données'

Candidate.destroy_all
Project.destroy_all
User.destroy_all

puts 'Creation de deux users (creator and dev)'

toto = User.new(email: 'toto@gmail.com', username: 'toto Gaga', role: 'creator', profile: 'Ceci est le profile de toto')
toto.password = '123456'
toto.password_confirmation = '123456'
toto.save!

tata = User.new(email: 'tata@gmail.com', username: 'Tata Gaga', role: 'developer', profile: 'Ceci est le profile de tata')
tata.password = '123456'
tata.password_confirmation = '123456'
tata.save!

puts 'Creation de 6 projets'

(0..5).to_a.each do |i|
  Project.create!(
    title: "project #{i}",
    catchphrase: "This is my super catchphrase for project #{i}",
    description: "Ceci est la description du projet #{i}",
    user: toto,
    dev: User.new,
    angel: User.new
  )
end

puts 'Creation de 3 candidatures'

(0..2).to_a.each do |i|
  Candidate.create!(
    status: 'In progress',
    message: "Hey I'm the application n°#{i}",
    project: Project.all.sample,
    user: tata
  )
end

puts 'Finished!'
