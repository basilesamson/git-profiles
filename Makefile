# Git Profiles Setup Makefile
# Safe to publish – no secrets, no hardcoded identities

PERSONAL_CONFIG=~/.gitconfig-personal
PRO_CONFIG=~/.gitconfig-pro
GLOBAL_CONFIG=~/.gitconfig

.PHONY: help personal pro include verify clean

help:
	@echo ""
	@echo "Git Profiles Setup"
	@echo "------------------"
	@echo "make personal   -> configure PERSONAL git identity"
	@echo "make pro        -> configure PROFESSIONAL git identity"
	@echo "make include    -> enable automatic profile switching"
	@echo "make verify     -> show active git identity"
	@echo "make clean      -> remove profile configs"
	@echo ""

personal:
	@read -p "Personal name: " name; \
	read -p "Personal email: " email; \
	git config --file $(PERSONAL_CONFIG) user.name "$$name"; \
	git config --file $(PERSONAL_CONFIG) user.email "$$email"; \
	echo "✔ Personal profile written to $(PERSONAL_CONFIG)"

pro:
	@read -p "Professional name: " name; \
	read -p "Professional email: " email; \
	git config --file $(PRO_CONFIG) user.name "$$name"; \
	git config --file $(PRO_CONFIG) user.email "$$email"; \
	echo "✔ Professional profile written to $(PRO_CONFIG)"

include:
	@echo "" >> $(GLOBAL_CONFIG)
	@echo "# Git profile auto-switching" >> $(GLOBAL_CONFIG)
	@echo '[includeIf "gitdir:~/projects/personal/"]' >> $(GLOBAL_CONFIG)
	@echo '    path = ~/.gitconfig-personal' >> $(GLOBAL_CONFIG)
	@echo '[includeIf "gitdir:~/projects/pro/"]' >> $(GLOBAL_CONFIG)
	@echo '    path = ~/.gitconfig-pro' >> $(GLOBAL_CONFIG)
	@echo "✔ includeIf rules added to ~/.gitconfig"

verify:
	@echo "Active Git identity:"
	@git config user.name
	@git config user.email
	@echo ""
	@echo "Config source:"
	@git config --show-origin user.email

clean:
	@rm -f $(PERSONAL_CONFIG) $(PRO_CONFIG)
	@echo "✔ Profile configs removed (global includeIf left untouched)"
