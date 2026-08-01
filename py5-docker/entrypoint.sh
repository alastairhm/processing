#!/bin/bash
set -e

run_one() {
    local file="$1"
    echo "=== Running ${file} ==="
    if xvfb-run -a --server-args="-screen 0 1280x1024x24" python3 "/app/${file}"; then
        echo "=== Finished ${file} ==="
    else
        echo "=== FAILED: ${file} ==="
        FAILED_SKETCHES+=("${file}")
    fi
}

FAILED_SKETCHES=()

# Explicit target: SKETCH env var, or a filename passed as the docker run
# command, takes priority over the "process everything" default.
TARGET="${SKETCH:-$1}"

if [ -n "${TARGET}" ]; then
    if [ ! -f "/app/${TARGET}" ]; then
        echo "Error: /app/${TARGET} not found."
        exit 1
    fi
    run_one "${TARGET}"
else
    # No specific target: run every .py file directly under /app,
    # sorted for repeatable ordering. Each gets its own Xvfb instance
    # in turn, so sketches can't interfere with each other's display.
    mapfile -t SKETCHES < <(find /app -maxdepth 1 -name '*.py' -type f -printf '%f\n' | sort)

    if [ "${#SKETCHES[@]}" -eq 0 ]; then
        echo "No .py files found in /app."
        echo "Mount a directory containing one or more sketches, e.g.:"
        echo "  docker run --rm -v \"\$(pwd):/app\" py5-sketch"
        exit 1
    fi

    echo "Found ${#SKETCHES[@]} sketch(es): ${SKETCHES[*]}"
    for f in "${SKETCHES[@]}"; do
        run_one "${f}"
    done
fi

if [ "${#FAILED_SKETCHES[@]}" -gt 0 ]; then
    echo ""
    echo "Completed with failures: ${FAILED_SKETCHES[*]}"
    exit 1
fi

echo ""
echo "All sketches completed successfully."
