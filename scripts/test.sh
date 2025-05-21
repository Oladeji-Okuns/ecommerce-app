#!/bin/bash

sleep 5

URL="http://localhost/api"
MAX_RETRIES=5
BODY_FILE=$(mktemp)

for attempt in $(seq 1 $MAX_RETRIES); do
  STATUS=$(curl --silent --output "$BODY_FILE" --write-out "%{http_code}" --max-time 10 "$URL")
  BODY=$(cat "$BODY_FILE")

  if [ "$STATUS" -eq 200 ]; then
    echo "✅ API test passed: $BODY"
    rm "$BODY_FILE"
    exit 0
  else
    echo "❌ Attempt $attempt failed. Status: $STATUS"
    echo "Response: $BODY"
    sleep 3
  fi
done

rm "$BODY_FILE"
echo "❌ API test failed after $MAX_RETRIES attempts."
exit 1

