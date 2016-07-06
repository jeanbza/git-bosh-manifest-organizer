require 'bosh/manifest/organizer/version'
require 'yaml'

module Bosh
  module Manifest
    module Organizer
      def self.organize
        str = (STDIN.tty?) ? nil : $stdin.read

        if str
          puts self.organize_yml str
        else
          raise 'Incorrect usage: cat something.yml | bosh-manifest-organizer'
        end
      end

      def self.organize_yml(str)
        yml = YAML.load str

        new_hash = {}

        if yml.key? 'director_uuid'
          new_hash['director_uuid'] = yml['director_uuid']
        end

        if yml.key? 'name'
          new_hash['name'] = yml['name']
        end

        new_hash.merge!(yml)

        YAML.dump(new_hash)
      end
    end
  end
end
