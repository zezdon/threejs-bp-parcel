varying vec2 vUv;
varying vec3 vPos;
varying vec2 vCoordinates;
attribute vec3 aCoordinates;
attribute float aSpeed;
attribute float aOffset;
attribute float aDirection;
attribute float aPress;

uniform float move;
uniform float time;
uniform vec2 mouse;
uniform float mousePressed;

void main() {
  vUv = uv;
  vec3 pos = position;
  // NOT STABLE
  pos.x += sin(move*aSpeed)*3. ;
  pos.y += sin(move*aSpeed)*3. ;
  pos.z = mod(position.z + move*200.*aSpeed + aOffset, 2000.) - 1000.;

  // STABLE
  vec3 stable = position;
  float dist = distance(stable.xy,mouse);
  float area = 1. - smoothstep(0.,500.,dist);

  stable.x +=50.*sin(0.01*time*aPress)*aDirection*area*mousePressed;
  stable.y +=50.*sin(0.01*time*aPress)*aDirection*area*mousePressed;
  stable.z +=200.*cos(0.01*time*aPress)*aDirection*area*mousePressed;

  // STABLE
  vec4 mvPosition = modelViewMatrix * vec4( stable, 1. );
  gl_PointSize = 4000. * ( 1. / - mvPosition.z );
  gl_Position = projectionMatrix * mvPosition;

  vCoordinates = aCoordinates.xy;
  vPos = pos;
}