# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ProjectUser.delete_all
Project.delete_all
User.delete_all

user = User.create!(name: 'Fulano de Tal', email: 'user@example.com', password: '123456')

project1 = user.own_projects.create!(title: 'Criança Esperança', description: 'Criança Esperança é um projeto da Rede Globo em parceria com a UNESCO - Órgão das Nações Unidas para a Educação, a Ciência e a Cultura.', image_url: 'http://www.unesco.org/new/fileadmin/MULTIMEDIA/FIELD/Brasilia/images/brz_shs_logo_CRIESP_2016.png')

project2 = user.own_projects.create!(title: 'WWF Brasil', description: 'O WWF-Brasil é uma ONG brasileira, participante de uma rede internacional e comprometida com a conservação da natureza dentro do contexto social e econômico brasileiro.', image_url: 'https://c402277.ssl.cf1.rackcdn.com/photos/9031/images/original/WWF_25mm_no_tab.png')

project3 = user.own_projects.create!(title: 'AACD', description: 'Associação de Assistência à Criança Deficiente (AACD) é uma associação sem fins lucrativos brasileira, com sede em São Paulo - SP, que visa tratar, reabilitar e reintegrar à sociedade crianças, adolescentes e adultos portadores de deficiência física.', image_url: 'http://www.infoescola.com/wp-content/uploads/2010/05/aacd.gif')

user.contributing_projects.create(project: project1, percentage: 30)
user.contributing_projects.create(project: project2, percentage: 70)
