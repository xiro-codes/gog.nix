# https://just.systems

check-broken:
  python3 ./scripts/report-broken.py
gen-packages dir:
  python3 ./scripts/generate_pkgs.py {{dir}}
