IGNORED_SERVICES := http_proxy|nodered|homeassistant|mayan_edms|droppy|misc_bots

up:
	IGNORED_SERVICES="${IGNORED_SERVICES}" ./compose.sh up -d
	@echo "Started services except '${IGNORED_SERVICES}'"
	@echo "Started http_proxy manually to avoid LetsEncrypt rate limiting by accident"

update:
	./compose.sh pull
	./compose.sh up -d
