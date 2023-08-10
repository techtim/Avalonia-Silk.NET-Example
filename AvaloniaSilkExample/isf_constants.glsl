vec4 VVSAMPLER_2DBYPIXEL(sampler2D sampler, vec4 samplerImgRect, vec2 samplerImgSize, bool samplerFlip, vec2 loc) {
    return (samplerFlip)
        ? texture(sampler, vec2(((loc.x / samplerImgSize.x * samplerImgRect.z) + samplerImgRect.x), (samplerImgRect.w - (loc.y / samplerImgSize.y * samplerImgRect.w)+ samplerImgRect.y)))
        : texture(sampler, vec2(((loc.x /samplerImgSize.x * samplerImgRect.z) + samplerImgRect.x), ((loc.y /samplerImgSize.y * samplerImgRect.w) + samplerImgRect.y)));
}
vec4 VVSAMPLER_2DBYNORM(sampler2D sampler, vec4 samplerImgRect, vec2 samplerImgSize, bool samplerFlip, vec2 normLoc) {
    vec4 returnMe = VVSAMPLER_2DBYPIXEL(sampler, samplerImgRect, samplerImgSize, samplerFlip, vec2(normLoc.x * samplerImgSize.x, normLoc.y *samplerImgSize.y));
    return returnMe;
}

vec4 VVSAMPLER_2DBYPIXEL(sampler2D sampler, vec4 samplerImgRect, vec2 samplerImgSize, bool samplerFlip, vec2 loc, float bias) {
    return (samplerFlip)
        ? texture(sampler, vec2(((loc.x / samplerImgSize.x * samplerImgRect.z) + samplerImgRect.x), (samplerImgRect.w - (loc.y / samplerImgSize.y * samplerImgRect.w) + samplerImgRect.y)), bias)
        : texture(sampler, vec2(((loc.x / samplerImgSize.x * samplerImgRect.z) + samplerImgRect.x), ((loc.y / samplerImgSize.y * samplerImgRect.w) + samplerImgRect.y)), bias);
}

vec4 VVSAMPLER_2DBYNORM(sampler2D sampler, vec4 samplerImgRect, vec2 samplerImgSize, bool samplerFlip, vec2 normLoc, float bias) {
    vec4returnMe = VVSAMPLER_2DBYPIXEL(sampler, samplerImgRect, samplerImgSize, samplerFlip, vec2(normLoc.x * samplerImgSize.x, normLoc.y * samplerImgSize.y), bias);
    return returnMe;
}
vec4 VVSAMPLER_2DRECTBYPIXEL(sampler2DRect sampler, vec4 samplerImgRect, vec2 samplerImgSize, bool samplerFlip, vec2 loc)    {
    return (samplerFlip)
        ? texture(sampler, vec2(((loc.x / samplerImgSize.x* samplerImgRect.z) + samplerImgRect.x), (samplerImgRect.w - (loc.y/ samplerImgSize.y * samplerImgRect.w) +samplerImgRect.y)))
        : texture(sampler, vec2(((loc.x / samplerImgSize.x * samplerImgRect.z) + samplerImgRect.x), ((loc.y / samplerImgSize.y * samplerImgRect.w) + samplerImgRect.y)));
}

vec4 VVSAMPLER_2DRECTBYNORM(sampler2DRect sampler, vec4 samplerImgRect, vec2 samplerImgSize, bool samplerFlip, vec2 normLoc)    {
    vec4returnMe = VVSAMPLER_2DRECTBYPIXEL(sampler, samplerImgRect, samplerImgSize, samplerFlip, vec2(normLoc.x * samplerImgRect.z, normLoc.y * samplerImgRect.w));
    return returnMe;
}

vec4 VVSAMPLER_2DRECTBYPIXEL(sampler2DRect sampler, vec4 samplerImgRect, vec2 samplerImgSize, bool samplerFlip, vec2 loc, float bias)    {
    return (samplerFlip)
        ? texture(sampler, vec2(((loc.x / samplerImgSize.x* samplerImgRect.z) + samplerImgRect.x), (samplerImgRect.w - (loc.y/ samplerImgSize.y * samplerImgRect.w) +samplerImgRect.y)))
        : texture(sampler, vec2(((loc.x / samplerImgSize.x * samplerImgRect.z) + samplerImgRect.x), ((loc.y / samplerImgSize.y * samplerImgRect.w) + samplerImgRect.y)));
}

vec4 VVSAMPLER_2DRECTBYNORM(sampler2DRect sampler, vec4 samplerImgRect, vec2 samplerImgSize, bool samplerFlip, vec2 normLoc, float bias)    {
    vec4returnMe = VVSAMPLER_2DRECTBYPIXEL(sampler, samplerImgRect, samplerImgSize, samplerFlip, vec2(normLoc.x * samplerImgRect.z, normLoc.y * samplerImgRect.w), bias);
    return returnMe;
}