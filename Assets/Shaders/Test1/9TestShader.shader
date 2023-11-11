Shader "ShaderSketches/9TestShader"
{
    Properties
    {
        MainTex("MainTex",2D) = "White"
    }

    CGINCLUDE
    #include "UnityCG.cginc"

    //指定した大きさの資格を描く関数
    float box(float2 st, float size)
    {
        size = 0.5 + size * 0.5;
        st = step(st,size) * step(1.0 -st,size);
        return st.x * st.y;
    }


    float4 frag(v2f_img i) : SV_Target
    {
        float n = 10;
        float2 st = frac(i.uv * n);
        return box(st,abs(sin(_Time.y*3)));
    }

    ENDCG

    SubShader
    {
        pass
        {
            CGPROGRAM
            #pragma vertex vert_img
            #pragma fragment frag
            ENDCG
        }
    }

}