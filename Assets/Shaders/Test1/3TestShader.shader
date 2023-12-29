Shader "ShaderSketches/3TestShader"
{
    Properties
    {
        MainTex("MainTex",2D) = "white"{}
    }

    CGINCLUDE
    #include "UnityCG.cginc"

    float4 frag(v2f_img i) : SV_Target
    {
        float d = distance(float2(0.5,0.5),i.uv);
        float a = 0.4; //闘値
        return step(a,d);
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