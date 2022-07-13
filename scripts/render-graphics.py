import bpy

for scene in bpy.data.scenes:
  shadows = "shadow" in scene.name
  bpy.data.collections["Collection"].hide_render = shadows
  bpy.data.collections["Shadows"].hide_render = not shadows
  bpy.ops.render.render(write_still=True, scene=scene.name)
