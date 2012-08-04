require 'ostruct'

KEYS_FILE = "./config/keys.yml"

Dashboard::Application.configure do
  if File.exist? KEYS_FILE
    keys_hash = Psych.load(File.open "./config/keys.yml")
    config.keys = OpenStruct.new(keys_hash)
  else
    config.keys = OpenStruct.new
  end
end

Config = Dashboard::Application.config
