curl "$URL" \
  -H "x-xsrf-token: $XSRF_TOKEN" \
  -H 'x-requested-with: XMLHttpRequest' \
  -H 'origin: https://mywaifulist.moe' \
  -H "cookie: XSRF-TOKEN=$XSRF_TOKEN; forever_alone_session=$FOREVER_ALONE_SESSION_TOKEN" \
  --data-raw '$PAYLOAD'