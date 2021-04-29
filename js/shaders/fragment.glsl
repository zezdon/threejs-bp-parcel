varying vec2 vCoordinates;
uniform sampler2D t1;
uniform sampler2D t2;
void main()	{
	gl_FragColor = vec4(vCoordinates.x/512.,vCoordinates.y/512.,0,1.);
}