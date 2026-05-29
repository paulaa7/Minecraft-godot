# Minecraft-like Game – Computer Graphics Final Project

A simplified Minecraft-style game developed as the final project for the **Computer Graphics** course.  
This project demonstrates key 3D graphics and interaction concepts using the **Godot Engine**.


---

## Overview

This project implements a block-based world inspired by Minecraft, featuring:

- First-person character movement and camera control
- Block addition and removal (left/right click with RayCast)
- Interactive elements: levers, buttons, an elevator, and a drawbridge
- Animated water texture using shaders
- Articulated structures: a windmill with rotating blades and a multi‑joint bridge
- Custom keyboard/mouse input mapping

The game world includes a terrain, trees, houses, a river, and a windmill — all built with `GridMap` and custom block meshes.

---

## 🎮 Controls

| Action                     | Input                          |
|----------------------------|--------------------------------|
| Move                       | `WASD` or Arrow Keys           |
| Run                        | `Shift` (toggle)               |
| Look around                | Mouse                           |
| Remove block               | Left Click                      |
| Place block (dirt)         | Right Click                     |
| Interact with levers/buttons | Right Click (while aiming)   |
| Rotate windmill structure  | `1`                             |
| Toggle windmill blades     | `2`                             |

---

## Features

### Player & Camera
- `CharacterBody3D` with collision and a camera as the eyes
- Mouse‑captured mode for first‑person view
- Smooth rotation with configurable sensitivity and vertical limits (±80°)

### Block System
- Custom mesh library from an external model pack (Quaternius Cube World Kit)
- `GridMap` for terrain and structure design
- Two custom blocks: plain white block and animated water
- Water texture animation via `ShaderMaterial` (UV‑based atlas cycling)

### Interaction (RayCast)
- RayCast attached to the camera detects objects
- **Left click** → removes block (sets index to `-1` on the `GridMap`)
- **Right click** → places dirt block (index `5`) or interacts with levers/buttons

### Elevator
- Inside the windmill: a lever activates an elevator block
- At the top: a button brings it back down
- Elevator movement is time‑based interpolation

### Drawbridge
- Hidden lever (a flower) near the river
- Activates a multi‑joint bridge with 5 articulated segments
- Each segment rotates within specific angle ranges, animated over time
- Lever rotates while the bridge opens/closes

### Articulations
- **Windmill**: blades rotate around a top pivot
- **Drawbridge**: 5 sequential joints with custom rotation limits (e.g., `[180°, 0°]`, `[-90°, 90°]`)

---
