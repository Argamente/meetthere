# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )

#Rails.application.config.assets.precompile += %w( global.css )
Rails.application.config.assets.precompile += %w( meetthere.css )
Rails.application.config.assets.precompile += %w( homepage.css )
Rails.application.config.assets.precompile += %w( signinup.css )
Rails.application.config.assets.precompile += %w( header.css )
Rails.application.config.assets.precompile += %w( filter.css )
Rails.application.config.assets.precompile += %w( post.css )
Rails.application.config.assets.precompile += %w( bootstrap/bootstrap.min.css )
Rails.application.config.assets.precompile += %w( bootstrap/bootstrap.css )

Rails.application.config.assets.precompile += %w( bootstrap/bootstrap.min.js )
Rails.application.config.assets.precompile += %w( bootstrap/bootstrap.js )



# bootstrap-select 插件
Rails.application.config.assets.precompile += %w( bootstrap/bootstrap-select.css )
Rails.application.config.assets.precompile += %w( bootstrap/bootstrap-select.js )

Rails.application.config.assets.precompile += %w( bootstrap/jquery.min.js )

Rails.application.config.assets.precompile += %w( noone/PCASClass.js )