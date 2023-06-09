#!/usr/bin/env sh

set -e

/bin/goatcounter serve -port "${GC_PORT}" \
  -listen "${GC_LISTEN}" \
  -db "${GC_DB}" \
  -tls "${GC_TLS}" \
  -errors "${GC_ERRORS}" \
  -email-from "${GC_EMAIL_FROM}" \
  -smtp "${GOATCOUNTER_SMTP}" \
  -automigrate
