# Guardfile
# More info at https://github.com/guard/guard#readme

guard 'foodcritic', :cookbook_paths => '.' do

  [ 'metadata\.rb',
    '(attributes|definitions|libraries|providers|recipes|resources)/.+\.rb',
    'templates/.+\.erb'
  ].each do |pattern|
    watch(%r{^#{pattern}$})
  end
end
