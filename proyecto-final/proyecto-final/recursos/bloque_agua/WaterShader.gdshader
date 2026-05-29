shader_type spatial;
render_mode blend_mix, depth_draw_always, cull_back;

uniform sampler2D atlas : source_color;
uniform vec2 tam_atlas = vec2(2.0, 2.0);
uniform float velocidad = 4.0;
uniform float densidad_textura = 1.0;
uniform float transparencia  = 0.5;

void fragment() {
    int num_frames = int(tam_atlas.x * tam_atlas.y);
    int frame = int(mod(TIME * velocidad, float(num_frames)));

    int x = frame % int(tam_atlas.x);
    int y = frame / int(tam_atlas.x);

    vec2 tile_size = 1.0 / tam_atlas;
    vec2 offset = vec2(float(x), float(y)) * tile_size;

    vec2 uv_escalado = fract(UV * densidad_textura);
    vec2 uv_atlas = (uv_escalado * tile_size) + offset;

    vec4 tex = texture(atlas, uv_atlas);

    ALBEDO = tex.rgb;
    ALPHA = tex.a * transparencia;
}