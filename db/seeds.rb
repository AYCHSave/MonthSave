# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

WithdrawalTransaction.delete_all
WithdrawalAccount.delete_all
ProjectUser.delete_all
Project.delete_all
Saving.delete_all
CoinBank.delete_all
SourceTransaction.delete_all
SourceAccount.delete_all
User.delete_all

user = User.create!(
    name: 'Fulano de Tal',
    image_url: 'http://www.clubvelicotrasimeno.it/Portals/0/Users/061/29/829/Steve%20Murray.png',
    email: 'user@example.com',
    password: '123456'
)

project1 = user.own_projects.create!(title: 'Criança Esperança', description: 'Criança Esperança é um projeto da Rede Globo em parceria com a UNESCO - Órgão das Nações Unidas para a Educação, a Ciência e a Cultura.', image_url: 'http://www.unesco.org/new/fileadmin/MULTIMEDIA/FIELD/Brasilia/images/brz_shs_logo_CRIESP_2016.png')
project1.create_account!(service: 'Paypal')

project2 = user.own_projects.create!(title: 'AACD', description: 'Associação de Assistência à Criança Deficiente (AACD) é uma associação sem fins lucrativos brasileira, com sede em São Paulo - SP, que visa tratar, reabilitar e reintegrar à sociedade crianças, adolescentes e adultos portadores de deficiência física.', image_url: 'http://www.infoescola.com/wp-content/uploads/2010/05/aacd.gif')
project2.create_account(service: 'CEF')

project3 = user.own_projects.create!(title: 'WWF Brasil', description: 'O WWF-Brasil é uma ONG brasileira, participante de uma rede internacional e comprometida com a conservação da natureza dentro do contexto social e econômico brasileiro.', image_url: 'https://c402277.ssl.cf1.rackcdn.com/photos/9031/images/original/WWF_25mm_no_tab.png')
account = project3.create_account(service: 'BB')
project4 = user.own_projects.create!(title: 'CD Os Gonzagas', description: 'Causa para financiamento coletivo da gravação do primeiro CD de lançamento da banda Os Gonzagas!', image_url: 'http://www.baixarsomusica.com/wp-content/uploads/2016/03/2byEP9Jd_zpsctespfxv.jpeg', account: account)

Project.update(public: true)

user.contributing_projects.create!(project: project1, percentage: 30, min_cents: 0)
user.contributing_projects.create!(project: project2, percentage: 70, min_cents: 0)

user.accounts.create!(service: 'Banco do Brasil')
user.accounts.create!(service: 'PayPal')

account = user.accounts.first

user.coin_banks.create!
transaction_coffee = account.transactions.create(description: 'Cafézinho', price_cents: 249, external_id: 1)
transaction_food = account.transactions.create(description: 'Lanche', price_cents: 1749, external_id: 2)
user.coin_banks.active.savings.create!(source_transaction: transaction_coffee, price_cents: 51)
user.coin_banks.active.savings.create!(source_transaction: transaction_food, price_cents: 51)
TerminateCoinBank.new(user.coin_banks.active).call
CoinBank.first.update!(terminated_at: (Time.now - 1.month))

transaction_movie = account.transactions.create!(description: 'Cinema', price_cents: 7325, external_id: 3)
user.coin_banks.active.savings.create!(source_transaction: transaction_movie, price_cents: 275)
