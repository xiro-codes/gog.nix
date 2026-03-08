# https://just.systems

report:
  python3 ./scripts/report-broken.py

test game:
  python3 ./scripts/test-games.py {{game}}

force-test:
  python3 ./scripts/test-games.py  -f

gen-packages dir:
  python3 ./scripts/generate_pkgs.py {{dir}}
