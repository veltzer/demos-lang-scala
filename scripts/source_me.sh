# shellcheck shell=bash
# sbt (scala development)
SBT_HOME="$(path_abs "${HOME}/install/sbt")"
export SBT_HOME
PATH="$(path_add "${PATH}" "${SBT_HOME}/bin")"
export PATH
