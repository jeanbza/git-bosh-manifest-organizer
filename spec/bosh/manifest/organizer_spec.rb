require 'spec_helper'

describe Bosh::Manifest::Organizer do
  it 'has a version number' do
    expect(Bosh::Manifest::Organizer::VERSION).not_to be nil
  end

  describe '#organize_yml' do
    it 'organizes top level keys' do
      file_contents = read_file 'spec/bosh/manifest/example-deployment.yml'
      res = Bosh::Manifest::Organizer.organize_yml file_contents
      keys = YAML.load(res).keys

      expect(keys).to eq [
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
    end
  end
end

def read_file(file)
  f = File.open(file, 'r')
  lines = []
  f.each_line do |line|
    lines.push line
  end
  f.close

  lines.join
end
