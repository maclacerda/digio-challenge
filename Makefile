setup_environment:
	@echo "Installing project dependencies for setup"
	@echo "Download and install Homebrew"
	@echo /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	@echo "Download and install swiftlint"
	@brew install swiftlint
	@echo "Download and install xcodegen"
	@brew install xcodegen
	@echo "Download and install ruby gems"
	@sudo gem install xcodeproj
	@echo " ╔═══════════════════════╗"
	@echo " ║ Done! You're all set! ║"
	@echo " ╚═══════════════════════╝"

config_scripts_permissions:
	@echo "Applying the scripts permissions"
	@chmod 775 scripts/*.sh
	@echo "Permissions granted successfull"

setup_swiftlint_template:
	@echo "Setup SwiftLint config file"
	@cp templates/lint/swiftlint.yml .swiftlint.yml
	@echo "SwiftLint configured at project dir with .swiftlint.yml name"

project:
	@make setup_swiftlint_template
	@echo "Generating Project"
	@xcodegen
	@echo " ╔═══════════════════════╗"
	@echo " ║ Done! You're all set! ║"
	@echo " ╚═══════════════════════╝"