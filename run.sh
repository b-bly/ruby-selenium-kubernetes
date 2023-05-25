docker run \
	-p 8080:8080 \
	--env SELENIUM_URL=$SELENIUM_SERVICE_URL \
    --env IDENTITY_TOKEN=$IDENTITY_TOKEN \
    ruby-selenium-kubernetes:latest