shader_type canvas_item; 

//from: http://glslsandbox.com/e#36547.0
//and: https://www.youtube.com/watch?v=6P9MGk7KmOc

//credits to Catzpaw 2016 (original GL shader) and Airvikar (porting to Godot)


uniform vec2 resolution;
//uniform float time;
float snow(vec2 uv,float scale, float time)
{
	float w=smoothstep(1,0,-uv.y*(scale/10.0));
	if(w<.1){return 0.0;}
	uv+=time/scale;
	uv.y+=time*2.0/scale;uv.x+=sin(uv.y+time*0.5)/scale;
	uv*=scale;
	vec2 s=floor(uv),f=fract(uv); vec2 p = vec2(0,0);
	float k=3.0,d;
	p=0.5+0.35*sin(11.0*fract(sin((s+p+scale)*mat2(vec2(7.0,3.0),vec2(6.0,5.0)))*5.0))-f;d=length(p);k=min(d,k);
	k=smoothstep(0.0,k,sin(f.x+f.y)*0.01);
    return k*w;
}

void fragment(){
	float col1 = 0.0;
	
	vec3 c = textureLod(SCREEN_TEXTURE, SCREEN_UV, 0.0).rgb;
	vec4 col2 = vec4(vec3(c), 1);
	vec2 uv = vec2(1.0)-UV/1.0-vec2(1.0);

	col1+=snow(uv,30, TIME)*0.3;
	col1+=snow(uv,20, TIME)*0.5;
	col1+=snow(uv,15, TIME)*0.8;
	col1+=snow(uv,10, TIME);
	col1+=snow(uv,8, TIME);
	col1+=snow(uv,6, TIME);
	col1+=snow(uv,5, TIME);
	COLOR = vec4(vec3(col1),1.0)+col2;

}











