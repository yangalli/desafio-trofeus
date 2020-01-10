namespace :dev do

  desc "Configurar o ambiente de desenvolvimento"
  task setup: :environment do
    unless Rails.env.production?
      show_spinner("Migrando BD...") { %x(rails db:migrate) }
      show_spinner("Criando Usuários...") { %x(rails dev:add_users) }
    else
      puts "Você não está no ambiente de desenvolvimento"
    end
  end

  desc "Criando Usuários"
  task add_users: :environment do
    User.create(
      email: "user@user.com",
      password: "user123",
      password_confirmation: "user123"
    )
  end

  private

    def show_spinner(msg_start, msg_end = "Concluído!")
      spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
      spinner.auto_spin
      yield
      spinner.success("(#{msg_end})")
    end
end