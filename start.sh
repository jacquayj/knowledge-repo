#!/usr/bin/env bash

echo
echo "Setting up server"
echo "--------"
echo

# Exit script if any command returns a non-zero status
set -e

GIT_REPO="bms-knowledge-repo"

if [ ! -d "/app/${GIT_REPO}" ]; then
	echo "Cloning research repo "

	cd /app/
	if [ -z "$(ls -A ${GIT_REPO})" ]; then
#		This will need to be the PAT for the knowledge repo github account
		# git clone http://${GIT_USER}:${GIT_PASSWORD}@${GIT_URL}/${GIT_USER}/${GIT_REPO}
        git clone https://github.com/bioteam/bms-knowledge-repo.git
	fi
fi
echo Runtime context ${RUNTIME_CONTEXT}

echo
cd /app/
if [ "${RUNTIME_CONTEXT}" == "local" ]; then
    echo Starting local server
    echo ---
    python scripts/knowledge_repo --repo ./${GIT_REPO} --debug runserver --config ./server_config.py --port ${PORT}
else
    echo Starting remote server
    echo ---
    python scripts/knowledge_repo --repo ./${GIT_REPO} runserver --config ./server_config.py --port ${PORT}

fi