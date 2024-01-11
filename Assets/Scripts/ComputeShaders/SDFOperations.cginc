float4 OperationUnion(float distanceA, float distanceB, float3 colorA, float3 colorB)
{
    float result = min(distanceA, distanceB);
    float3 resultColor = colorA;
    
    if (result == distanceB)
        resultColor = colorB;
    
    return float4(resultColor, result);
}

float4 OperationSubtraction(float distanceA, float distanceB, float3 colorA, float3 colorB)
{
    float result = max(distanceA, -distanceB);
    float3 resultColor = colorA;
    
    if (result == -distanceB)
    {
        resultColor = colorB;
    }
    
    return float4(resultColor, result);
}

float4 OperationIntersection(float distanceA, float distanceB, float3 colorA, float3 colorB)
{
    float result = max(distanceA, distanceB);
    float3 resultColor = colorA;
    
    if (result == distanceB)
    {
        resultColor = colorB;
    }
    
    return float4(resultColor, result);
}