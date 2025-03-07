// SPDX-FileCopyrightText: 2002-2025 PCSX2 Dev Team
// SPDX-License-Identifier: GPL-3.0+

#include "GSMTLShaderCommon.h"
#include "../../../../bin/resources/shaders/common/fxaa.fx"

fragment float4 ps_fxaa(ConvertShaderData data [[stage_in]], texture2d<float> tex [[texture(GSMTLTextureIndexNonHW)]])
{
	float4 color = tex.sample(MAIN_SAMPLER, data.t);
	color = PreGammaPass(color);
	color = FxaaPass(color, data.t, tex);
	return color;
}
