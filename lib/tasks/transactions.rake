namespace :transactions do
  desc 'Import transactions'
  task :import, [:user_email, :service_name] => [:environment] do |t, args|
    owner = User.find_by(email: args[:user_email])
    source_account = owner.accounts.find_by(service: args[:service_name])
    Transactions::ImportCsv.new(source_account, 'transactions.csv').proccess if source_account
  end
end
