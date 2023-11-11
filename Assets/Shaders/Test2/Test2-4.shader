Shader "ShaderSketches2/Test2-4"
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
        d -= 0.5;
        d = abs(d);
        d = 0.1/d;

        return float4(d,d,d,1);
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