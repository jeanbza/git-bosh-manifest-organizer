require 'bosh/manifest/organizer/version'
require 'yaml'

module Bosh
  module Manifest
    module Organizer
      def self.organize
        str = (STDIN.tty?) ? nil : $stdin.read

        if str
          yml = YAML.load str
          self.organize_yml yml
        else
          raise 'Incorrect usage: cat something.yml | bosh-manifest-organizer'
        end
      end

      private

      def self.organize_yml(yml)
        p yml
      end
    end
  end
end
