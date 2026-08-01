import py5
import random
import math

nodes = []      # list of (x, y, r)
edges = []      # list of (x1, y1, x2, y2)


def setup():
    py5.size(700, 900)
    py5.background(255)
    py5.stroke(0, 70, 140)
    py5.stroke_weight(2)
    py5.no_fill()

    start_x = py5.width / 2
    start_y = 80
    start_r = 22
    grow(start_x, start_y, start_r, 0, 90, 5)

    draw_tree()
    py5.save("output.png")
    py5.exit_sketch()


def grow(x, y, r, depth, angle, max_depth):
    nodes.append((x, y, r))

    if depth >= max_depth:
        return

    roll = random.random()
    if roll < 0.15:
        num_branches = 0
    elif roll < 0.55:
        num_branches = 1
    elif roll < 0.85:
        num_branches = 2
    else:
        num_branches = 3

    for _ in range(num_branches):
        branch_len = random.uniform(50, 140)
        angle_offset = random.uniform(-55, 55)
        new_angle = angle + angle_offset

        if random.random() < 0.12:
            new_angle += random.uniform(-90, 90)

        rad = math.radians(new_angle)
        new_x = x + branch_len * math.cos(rad)
        new_y = y + branch_len * math.sin(rad)

        new_r = max(6, r * random.uniform(0.55, 0.9))

        edges.append((x, y, new_x, new_y))
        grow(new_x, new_y, new_r, depth + 1, new_angle, max_depth)


def draw_tree():
    py5.stroke(0, 70, 140)
    py5.stroke_weight(1.5)
    for (x1, y1, x2, y2) in edges:
        py5.line(x1, y1, x2, y2)

    py5.no_fill()
    py5.stroke_weight(2)
    for (x, y, r) in nodes:
        py5.ellipse(x, y, r, r)
        fudge = 1.5
        py5.ellipse(
            x + random.uniform(-fudge, fudge),
            y + random.uniform(-fudge, fudge),
            r, r
        )


py5.run_sketch()
