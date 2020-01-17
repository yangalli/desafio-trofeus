# frozen_string_literal: true

namespace :dev do
  desc "Configure development environment"
  task setup: :environment do
    unless Rails.env.production?
      # show_spinner("Migrating DB...") { %x(rails db:migrate) }
      # show_spinner("Creating Default User...") { %x(rails dev:add_users) }
      show_spinner("Creating Collected Coins Trophies...") { %x(rails dev:add_collected_coints_trophies) }
      show_spinner("Creating Killed Monsters Trophies...") { %x(rails dev:add_killed_monsters_trophies) }
      show_spinner("Creating Times of Death Trophies...") { %x(rails dev:add_times_of_death_trophies) }
    else
      puts "You are not in development environment."
    end
  end

  desc "Creating Users"
  task add_users: :environment do
    User.create(
      email: "user@user.com",
      password: "user123",
      password_confirmation: "user123"
    )
  end

  desc "Creating Collected Coins Trophies"
  task add_collected_coints_trophies: :environment do
    [1, 100, 1000, 10_000, 100_000].each do |value|
      Trophy.find_or_create_by!(trophy_category: 0, value: value)
    end
  end

  desc "Creating Killed Monsters Trophies"
  task add_killed_monsters_trophies: :environment do
    [1, 100, 1000, 10_000, 100_000].each do |value|
      Trophy.find_or_create_by!(trophy_category: 1, value: value)
    end
  end

  desc "Creating Times of Death Trophies"
  task add_times_of_death_trophies: :environment do
    [1, 10, 25, 50, 100].each do |value|
      Trophy.find_or_create_by!(trophy_category: 2, value: value)
    end
  end

  desc "Creating Turtle Trophies"
  task add_bowser_trophies: :environment do
    [1, 100, 1000, 10_000, 100_000].each do |value|
      Trophy.find_or_create_by!(trophy_category: 3, value: value)
    end
  end

  desc "Creating Bowser Trophies"
  task add_bowser_trophies: :environment do
    [1, 100, 1000, 10_000, 100_000].each do |value|
      Trophy.find_or_create_by!(trophy_category: 4, value: value)
    end
  end

  private

  def show_spinner(msg_start, msg_end = "Concluído!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end
end
