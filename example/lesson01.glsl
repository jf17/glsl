// Author:
// Title:

#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

void main() {
    vec3 colorBlack = vec3(.0);
    vec3 colorBlue = vec3(0, 1, 0);
    vec3 colorRed = vec3(1, 0, 0);
    vec3 result = colorBlack;

    vec2 st = gl_FragCoord.xy/u_resolution.xy;


    float leftCoord = 0.54 ;
    float rightCoord = 0.55;

    float upCoord = 0. + abs(cos(u_time));
    float downCoord = 0.01 + abs(cos(u_time));

    if(st.x < rightCoord && st.x > leftCoord &&
    st.y > upCoord && st.y < downCoord){
        result = colorBlue;
    }

    // функция mix смешивает два входящих обьекта в указаной пропорции ( например один к трём)
    // тут пропорция смешивание зависит от координаты пикселя 
    vec3 colorMix = mix(colorBlue,colorRed,st.x);
    if(st.y < rightCoord && st.y > leftCoord &&
     st.x > upCoord && st.x < downCoord
    ){
        result = colorMix;
    }


    gl_FragColor = vec4(result,1.0);

}
