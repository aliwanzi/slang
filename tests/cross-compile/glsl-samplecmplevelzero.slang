//TEST:CROSS_COMPILE(filecheck=CHECK): -profile ps_5_0 -entry main -target glsl

// CHECK: float _S3 = (textureLod(sampler2DShadow(shadowMap_0,sampler_0), vec3((_S2), (0.0)), 0));
// CHECK: float _S4 = (textureLodOffset(sampler2DShadow(shadowMap_0,sampler_0), vec3((_S2), (0.0)), 0, (ivec2(1, 1))));

Texture2D shadowMap;
SamplerComparisonState sampler;
float4 main(float4 p : SV_POSITION)
{
    return shadowMap.SampleCmpLevelZero(sampler, float2(0.0), 0.0)
         + shadowMap.SampleCmpLevelZero(sampler, float2(0.0), 0.0, int2(1,1));
}
