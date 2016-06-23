namespace :reset do
  desc "Rebuilds and repopulates the entire database"
  task all: :environment do
    if Rails.env.production?
      raise DangerousOperationError, "Please use `heroku pg:reset DATABASE_URL` and run everything manually."
    end

    Rake::Task["db:drop"].invoke
    Rake::Task["db:create"].invoke
    Rake::Task["db:migrate"].invoke
  end
end
