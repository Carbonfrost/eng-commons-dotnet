# ------- Ruby settings
#

# Variables used by Ruby settings
ENG_RUBY_VARIABLES = \
	ENG_USING_RUBY \
	ENG_LATEST_RUBY_VERSION \
	RBENV_SHELL \


# Whether we are meant to use Ruby.  (See ruby.mk for autodetection)
ENG_USING_RUBY ?= $(ENG_AUTODETECT_USING_RUBY)

# Latest version of Ruby supported
ENG_LATEST_RUBY_VERSION = 2.6.0	