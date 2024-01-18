#!/usr/bin/env bash

set -euo pipefail

function check_stats() {
  cat /sys/devices/system/cpu/cpufreq/policy*/energy_performance_preference
  cat /sys/devices/system/cpu/cpufreq/policy*/scaling_governor
}

function enable_perf_mode() {
  echo performance | tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor

  # check_stats
  echo "enabled."
}

function disable_perf_mode() {
  echo powersave | tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
  x86_energy_perf_policy --hwp-epp "balance-power"

  # check_stats
  echo "disabled."
}

case "$1" in
  on)
    enable_perf_mode
    ;;

  off)
    disable_perf_mode
    ;;

  *)
    echo "unknown argument. expected <on|off>"
    ;;
esac
