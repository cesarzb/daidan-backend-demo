require 'sequel'
require 'yaml'

config_path = File.expand_path('../config/database.yml', __dir__)
db = YAML.load_file(config_path)["db"]
DB = Sequel.connect(db)
