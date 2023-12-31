class String
  def camelize
    split(/[^[:alnum:]]+/).map(&:capitalize).join
  end

  def underscore
    gsub(/::/, '/')
      .gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
      .gsub(/([a-z\d])([A-Z])/, '\1_\2')
      .tr('-', '_')
      .downcase
  end
end

app_name = ENV.fetch('APP_NAME', nil)

if app_name.nil? || app_name.size.negative?
  puts "Please set APP_NAME='your-app-name'"
  exit
end

sed = if RbConfig::CONFIG['host_os'] =~ /darwin/
        "sed -i '' -e"
      else
        'sed -i -e'
      end

app_parent_dir = Dir.pwd

Dir.chdir('/tmp')
`curl -L -o skelton71.zip https://github.com/h-izumi/skelton71/archive/main.zip`
`unzip skelton71.zip`
`mv skelton71-main #{app_parent_dir}/#{app_name}`
`rm skelton71.zip`

Dir.chdir("#{app_parent_dir}/#{app_name}")
`find . -type f -print0 | xargs -0 #{sed} 's/SKELTON71/#{app_name.upcase.tr('-', '_')}/g'`
`find . -type f -print0 | xargs -0 #{sed} 's/skelton71/#{app_name.underscore}/g'`
`find . -type f -print0 | xargs -0 #{sed} 's/Skelton71/#{app_name.camelize}/g'`
`rm README.md`
`rm LICENSE.txt`
`rm setup.rb`

`git init`
`git add .`

`git commit -m "initial."` unless ENV['NO_COMMIT']
