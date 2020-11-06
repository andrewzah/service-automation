IGNORED_DIRS := http_proxy|nodered|homeassistant|mayan_edms|droppy|misc_bots

update: dependencies up

up:
	IGNORED_DIRS="${IGNORED_DIRS}" ./compose.sh up -d
	@echo "Started services except '${IGNORED_DIRS}'"
	@echo "Started 'http_proxy' manually to avoid LetsEncrypt rate limiting by accident"

dependencies:
	./compose.sh pull
