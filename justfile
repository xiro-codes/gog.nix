# https://just.systems

report:
  python3 ./scripts/report-broken.py

test:
  python3 ./scripts/test-games.py

gen-packages dir:
  python3 ./scripts/generate_pkgs.py {{dir}}
