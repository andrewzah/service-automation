#!/bin/bash

goatcounter serve -port "${GC_PORT}" \
  -listen "${GC_LISTEN}" \
  -db "/data/${GC_DB}" \
  -tls "${GC_TLS}" \
  -errors "${GC_ERRORS}" \
  -email-from "${GC_EMAIL_FROM}" \
  -smtp "${GOATCOUNTER_SMTP}" \
  -automigrate
