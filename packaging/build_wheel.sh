#!/bin/bash
set -ex

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
. "$script_dir/pkg_helpers.bash"

export CU_VERSION=cpu
export NO_CUDA_PACKAGE=1
export BUILD_TYPE="conda"

export SOURCE_ROOT_DIR="$PWD"
setup_env
pip_install numpy future
setup_pip_pytorch_version

pip_install wheel
git submodule update --init --recursive
python setup.py clean
# TODO: Add windows support
python setup.py bdist_wheel
