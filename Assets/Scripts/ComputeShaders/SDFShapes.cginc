float4 ScaleObject(float3 p, float3 scale)
{
    float3 newScale = p / scale;
    
    float minAxis = min(min(scale.x, scale.y), scale.z);
    
    return float4(newScale, minAxis);
}

float2x2 Rotate(float angle)
{
    float s = sin(angle);
    float c = cos(angle);
    return float2x2(c, -s, s, c);
}

float3 RotateObject(float3 p, float3 rotation)
{
    p.yz = mul(Rotate(radians(rotation.x)), p.yz);
    p.xz = mul(Rotate(radians(rotation.y)), p.xz);
    p.xy = mul(Rotate(radians(rotation.z)), p.xy);

    return p;
}

float SDFSphere(float3 eye, float3 p, float radius, float3 rotation, float3 scale)
{
    float3 origin = eye - p;
    
    origin = RotateObject(origin, rotation);
    
    float4 scaled = ScaleObject(origin, scale);
    origin = scaled.xyz;
    
    return (length(origin) - radius) * scaled.w;

}

float SDFCube(float3 eye, float3 p, float3 scale, float3 rotation)
{
    float3 origin = eye - p;
    
    origin = RotateObject(origin, rotation);
    
    float3 o = abs(origin) - scale;
    float ud = length(max(o, 0));
    float n = max(max(min(o.x, 0), min(o.y, 0)), min(o.z, 0));
    
    return ud+n;
}