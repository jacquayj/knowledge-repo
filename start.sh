#!/usr/bin/env bash

echo
echo "Setting up server"
echo "--------"
echo

# Exit script if any command returns a non-zero status
set -e

if [ ! -d "/app/<GITHUB-POST-REPO>" ]; then
	echo "Cloning research repo "

	cd /app/
	if [ -z "$(ls -A <GITHUB-POST-REPO>)" ]; then
		echo "clone here"
#		This will need to be the PAT for the knowledge repo github account
		git clone https://${GITHUB_PAT}@github.com/<ORG>/<GITHUB-POST-REPO>.git
	fi
fi
echo Runtime context ${RUNTIME_CONTEXT}

echo
cd /app/
if [ "${RUNTIME_CONTEXT}" == "local" ]; then
    echo Starting local server
    echo ---
    python scripts/knowledge_repo --repo ./<GITHUB-POST-REPO> --debug runserver --config ./server_config.py --port ${PORT}
else
    echo Starting remote server
    echo ---
    python scripts/knowledge_repo --repo ./<GITHUB-POST-REPO> runserver --config ./server_config.py --port ${PORT}

fi