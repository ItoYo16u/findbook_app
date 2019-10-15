# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!
Amazon::Ecs.options={
    associate_tag: 'xhateblo11041-22',
    AWS_access_key_id: 'AKIAJH5XD2OVJLGUSEGQ',
    AWS_secret_key: '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'
}

ActionMailer::Base.smtp_settings = {
    :address        => 'smtp.sendgrid.net',
    :port           => '587',
    :authentication => :plain,
    :user_name      => ENV['SENDGRID_USERNAME'],
    :password       => ENV['SENDGRID_PASSWORD'],
    :domain         => 'bookio.info',
    :enable_starttls_auto => true
}