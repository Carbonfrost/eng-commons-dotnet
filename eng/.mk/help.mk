ifdef ALL
	_HELP_MAKEFILE_LIST = $(MAKEFILE_LIST)
else
	_DISABLED_RUNTIMES = $(subst $(_SPACE),$(_PIPE),$(strip $(ENG_DISABLED_RUNTIMES)))
	_HELP_MAKEFILE_LIST = $(shell echo "$(MAKEFILE_LIST)" | sed -E "s/[^ ]+($(_DISABLED_RUNTIMES)).mk//g")
endif

.PHONY: help \
	list \
	doctor \

_AWK_VERSION = $(shell awk --version)

# Show help when no other goal is specified
.DEFAULT_GOAL = help

## Show this help screen
help:
	@ if [[ "$(_AWK_VERSION)" == *"GNU Awk"* ]]; then \
		awk -f $(_ENG_MAKEFILE_DIR)/.mk/awk/makefile-help-screen.awk $(_HELP_MAKEFILE_LIST); \
	else \
		awk -f $(_ENG_MAKEFILE_DIR)/.mk/awk/makefile-simple-help-screen.awk $(_HELP_MAKEFILE_LIST) | sort; \
	fi

## List all targets
list:
	@ awk -f $(_ENG_MAKEFILE_DIR)/.mk/awk/makefile-list-targets.awk $(MAKEFILE_LIST) | grep -vE '^\.' | uniq | sort

## Diagnose common issues
doctor: \
	-checks \
	-preflight-checks \

# "slow" checks used by doctor
-checks:

# "fast" checks that are implied on any nacho command
-preflight-checks:

# macOS-specific checks (or not)
-darwin-preflight-checks:
-non-darwin-preflight-checks:

ifeq ($(UNAME),Darwin)
-preflight-checks: -darwin-preflight-checks
else
-preflight-checks: -non-darwin-preflight-checks
endif
