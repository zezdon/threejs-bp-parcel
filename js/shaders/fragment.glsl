varying vec2 vCoordinates;
uniform sampler2D t1;
uniform sampler2D t2;
void main()	{
	vec2 myUV = vec2(vCoordinates.x/512.,vCoordinates.y/512.);
	vec4 image = texture2D(t1,myUV);
	gl_FragColor = image;
}