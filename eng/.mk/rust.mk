#: rust engineering

# Automatically detect whether Rust is in use
ENG_AUTODETECT_USING_RUST = $(shell [ ! -f Cargo.toml ] ; echo $$?)
ENG_AVAILABLE_RUNTIMES += rust

# User can define ENG_USING_RUST themselves to avoid autodeteciton
ifdef ENG_USING_RUST
_ENG_ACTUALLY_USING_RUST = $(ENG_USING_RUST)
else
_ENG_ACTUALLY_USING_RUST = $(ENG_AUTODETECT_USING_RUST)
endif

.PHONY: \
	-hint-unsupported-rust \
	-rust/build \
	-rust/init \
	-use/rust-cargo-toml \
	rust/build \
	rust/init \
	use/rust \

## Add support for Rust to the project
use/rust: -rust/init

build: rust/build

# Enable the tasks if we are using Rust
ifeq (1,$(ENG_USING_RUST))
ENG_ENABLED_RUNTIMES += rust

## Install Rust and project dependencies
rust/init: -rust/init
rust/build: -rust/build
rust/get: -rust/get
else
rust/init: -hint-unsupported-rust
rust/build: -hint-unsupported-rust
rust/get: -hint-unsupported-rust
endif

-rust/init:
	@    echo "$(_GREEN)Installing Rust and Rust dependencies...$(_RESET)"
	$(Q) $(OUTPUT_COLLAPSED) eng/brew_bundle_inject rustup
	$(Q) $(OUTPUT_COLLAPSED) brew bundle

-rust/build:
	$(Q) cargo build

-hint-unsupported-rust:
	@ echo $(_HIDDEN_IF_BOOTSTRAPPING) "$(_WARNING) Nothing to do" \
		"because $(_MAGENTA)rust$(_RESET) is not enabled (Investigate $(_CYAN)\`make use/rust\`$(_RESET))"
