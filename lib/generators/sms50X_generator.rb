class Sms50XGenerator < Rails::Generators::Base
  source_root File.expand_path("../templates", __FILE__)
  def create_initializer_file
    copy_file "sms50X.rb", "config/initializers/sms50X.rb"
  end
end
