#!/usr/bin/env bash
set -eu
set -o pipefail

CUR_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

PLAY1_VERSION="${1:-1.2.7}"
INSTALL_DIR="${2:-}"

if [[ -z "${INSTALL_DIR}" ]]; then
  # install to project-home
  INSTALL_DIR="${CUR_DIR}/.."
elif [[ ! -d "${INSTALL_DIR}" ]]; then
  echo "Invalid install_dir => ${INSTALL_DIR}" >&2
  exit 1
else
  INSTALL_DIR=${INSTALL_DIR%/}
fi

echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo "PLAY1_VERSION => ${PLAY1_VERSION}"
echo "INSTALL_DIR   => ${INSTALL_DIR}"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

if [[ ! -d "${INSTALL_DIR}/play-${PLAY1_VERSION}" ]]; then
  wget -O "${INSTALL_DIR}/play-${PLAY1_VERSION}.zip" "https://downloads.typesafe.com/play/${PLAY1_VERSION}/play-${PLAY1_VERSION}.zip"
  unzip -qo "${INSTALL_DIR}/play-${PLAY1_VERSION}.zip" -d "${INSTALL_DIR}"
  rm -fr "${INSTALL_DIR}/play-${PLAY1_VERSION}.zip"
else
  echo "play-${PLAY1_VERSION} is already installed"
fi
