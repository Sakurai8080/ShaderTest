Shader "ShaderSketches2/Test2-10"
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
        float3 finalCol = float3(0,0,0);

        for(float i= 0; i < 5; i++){
            uv *= 1.5;
            uv = uv - floor(uv); //少数点部分が取り出される。
            uv -= 0.5;
        
            float d = length(uv) * exp(-length(uv0));
            float3 col = pallette(length(uv0) + _Time.y*0.5);
            d = sin(d*8 + _Time.y);
            d = abs(d);
            d = pow(0.05/d,1.3);
            finalCol += col * d;
        }
        return float4(finalCol,1);
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