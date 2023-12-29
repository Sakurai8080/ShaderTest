Shader "ShaderSketches2/Test2-8"
{
    Properties
    {
        MainTex ("MainTex", 2D) = "white" 
    }

    CGINCLUDE
    #include "UnityCG.cginc"

    float3 pallette(float t)
    {
        float3 a = float3(0.5,0.5,0.5);
        float3 b = float3(0.5,0.5,0.5);
        float3 c = float3(1,1,1);
        float3 d = float3(0.263,0.416,0.557);

        return a + b * cos(6.28318 * (c * t + d));
    }

    float4 frag(v2f_img i) : SV_Target
    {
        float2 uv = (i.uv -0.5) * 2;
        float2 uv0 = uv;
        uv *= 2;
        uv = uv - floor(uv); //少数点部分が取り出される。
        uv -= 0.5;

        float d = length(uv);
        float3 col = pallette(length(uv0) + _Time.y*0.5);
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