Shader "ShaderSketches2/Test2-1"
{
    Properties
    {
        MainTex("MainTex",2D)="white"
    }

    CGINCLUDE
    #include "UnityCG.cginc"

    float4 frag(v2f_img i) : SV_TARGET
    {
        return float4(i.uv.x,0,0,1);
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