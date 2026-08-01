# Generic headless py5 runner (Docker)

Runs py5 sketches inside a Docker container with no display, using Xvfb
as a virtual framebuffer. No sketch is baked into the image — you mount
a directory to `/app` at run time, and by default the container runs
**every** `.py` file it finds there, one after another. Each sketch's
own save call (e.g. `py5.save("output.png")`) writes back into that same
mounted directory, so outputs appear locally once the container exits.

## Build (once)

```bash
docker build -t py5-sketch .
```

## Run — process every sketch in a folder

```bash
docker run --rm -v "$(pwd):/app" py5-sketch
```

This finds every `.py` file directly under the mounted folder, runs each
one in turn (alphabetical order) under its own Xvfb instance, and prints
a summary at the end. If a sketch fails, the others still run, and the
container exits non-zero listing which ones failed.

Have each sketch save to a distinct filename so they don't overwrite one
another, e.g. `py5.save("truchet_output.png")` vs `py5.save("tree_output.png")`.

### Example layout

```
my-sketches/
├── node_tree.py       # py5.save("tree_output.png")
├── truchet_tile_3.py  # py5.save("truchet_output.png")
└── mosaic.py           # py5.save("mosaic_output.png")
```

```bash
docker run --rm -v "$(pwd)/my-sketches:/app" py5-sketch
```

Output:
```
Found 3 sketch(es): mosaic.py node_tree.py truchet_tile_3.py
=== Running mosaic.py ===
...
=== Finished mosaic.py ===
=== Running node_tree.py ===
...
All sketches completed successfully.
```

## Run — a single sketch only

Either pass the filename as an argument:

```bash
docker run --rm -v "$(pwd):/app" py5-sketch node_tree.py
```

or set the `SKETCH` environment variable:

```bash
docker run --rm -v "$(pwd):/app" -e SKETCH=node_tree.py py5-sketch
```

Either form skips the "process everything" behaviour and runs just that
one file.

## Notes

- `xvfb-run` starts a virtual X server, sets `$DISPLAY`, runs the sketch,
  then cleans up automatically for each sketch — no manual Xvfb
  start/stop needed, and one sketch's display can't interfere with
  another's.
- py5 wraps the same Java/Processing core as the desktop app, so it still
  needs a display surface even for offscreen/2D rendering — hence Xvfb
  is required here, the same as with `processing-java`.
- Only `.py` files directly in the mounted folder are picked up (not
  subfolders) — if your sketches live in per-project subdirectories,
  mount each one separately or adjust the `find` depth in
  `entrypoint.sh`.
- If a sketch imports other local files, make sure those are in the same
  mounted folder so imports resolve.
