require 'xcodeproj'

project_path = 'DigioApp.xcodeproj'
project = Xcodeproj::Project.open(project_path)
version = ""
buildVersion = "0"

versionFile = File.read("version").split
version = versionFile[0]
buildVersion = versionFile[1]

project.targets.each do |target|
    if target.name == "DigioApp" then
        target.build_configurations.each do |config|
            puts config.name
            config.build_settings['MARKETING_VERSION'] = version
            config.build_settings['CURRENT_PROJECT_VERSION'] = buildVersion
            puts 'MARKETING_VERSION = ' + version
            puts 'CURRENT_PROJECT_VERSION = ' + buildVersion
        end
    end
end

project.save