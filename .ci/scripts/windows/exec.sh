#!/bin/bash -ex

# SPDX-FileCopyrightText: 2019 yuzu Emulator Project
# SPDX-License-Identifier: GPL-2.0-or-later

mkdir -p "ccache" || true
chmod a+x ./.ci/scripts/windows/docker.sh
# the UID for the container yuzu user is 1027
sudo chown -R 1027 ./
docker run -e CCACHE_DIR=/yuzu/ccache -v "$(pwd):/yuzu" -w /yuzu yuzulator/build-environments:linux-mingw /bin/bash -ex /yuzu/.ci/scripts/windows/docker.sh "$1"
sudo chown -R $UID ./
