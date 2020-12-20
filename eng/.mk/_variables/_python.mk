# ------- Python settings
#

# Variables used by Python settings
ENG_PYTHON_VARIABLES := \
	ENG_USING_PYTHON \
	PIP \
	PYTHON \
	PYENV_VERSION \
	VIRTUAL_ENV \
	VIRTUAL_ENV_DISABLE_PROMPT \
	VIRTUAL_ENV_NAME \

# Whether we are meant to use Python.  (See python.mk for autodetection)
ENG_USING_PYTHON ?= $(ENG_AUTODETECT_USING_PYTHON)

# Name of the python executable
PYTHON ?= python3

# Name of the pip executable
PIP ?= pip3

# Name of the virtual environment
VIRTUAL_ENV_NAME ?= venv
