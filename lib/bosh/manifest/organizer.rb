require 'bosh/manifest/organizer/version'
require 'yaml'

module Bosh
  module Manifest
    module Organizer
      TOP_LEVEL_KEY_ORDER = [
        'director_uuid',
        'name',
        'releases',
        'compilation',
        'update',
        'networks',
        'properties',
        'resource_pools',
        'jobs'
      ]

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

        TOP_LEVEL_KEY_ORDER.each do |key|
          if yml.key? key
            new_hash[key] = yml[key]
          end
        end

        new_hash.merge!(yml)

        YAML.dump(new_hash)
      end
    end
  end
end
