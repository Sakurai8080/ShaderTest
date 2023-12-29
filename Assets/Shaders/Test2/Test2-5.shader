Shader "ShaderSketches2/Test2-5"
{
    Properties
    {
        MainTex ("MainTex", 2D) = "white" 
    }

    CGINCLUDE
    #include "UnityCG.cginc"

    float4 frag(v2f_img i) : SV_Target
    {
        float2 uv = (i.uv -0.5) * 2;
        float d = length(uv);
        float3 col = float3(1,0,0);
        d = sin(d*8 + _Time.y);
        d = abs(d);
        d = 0.1/d;
        col *= d;

        return float4(col.x,col.y,col.z,1);
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