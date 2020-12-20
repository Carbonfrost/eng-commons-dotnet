# ------- Go settings
#

# Variables used by Python settings
ENG_GO_VARIABLES := \
	GOPATH \

# Whether we are meant to use Go.  (See go.mk for autodetection)
ENG_USING_GO ?= $(ENG_AUTODETECT_USING_GO)
