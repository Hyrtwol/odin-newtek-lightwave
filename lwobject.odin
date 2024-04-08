package lightwave

foreign import lightwave "lightwave.lib"

BEH_RESET :: 0
BEH_CONSTANT :: 1
BEH_REPEAT :: 2
BEH_OSCILLATE :: 3
BEH_OFFSET :: 4
BEH_LINEAR :: 5

PROJ_PLANAR :: 0
PROJ_CYLINDRICAL :: 1
PROJ_SPHERICAL :: 2
PROJ_CUBIC :: 3
PROJ_FRONT :: 4

WRAP_NONE :: 0
WRAP_EDGE :: 1
WRAP_REPEAT :: 2
WRAP_MIRROR :: 3

lwNode :: st_lwNode
lwPlugin :: st_lwPlugin
lwKey :: st_lwKey
lwEnvelope :: st_lwEnvelope
lwEParam :: st_lwEParam
lwVParam :: st_lwVParam
lwClipStill :: st_lwClipStill
lwClipSeq :: st_lwClipSeq
lwClipAnim :: st_lwClipAnim
lwClipXRef :: st_lwClipXRef
lwClipCycle :: st_lwClipCycle
lwClip :: st_lwClip
lwTMap :: st_lwTMap
lwImageMap :: st_lwImageMap
lwProcedural :: st_lwProcedural
lwGradKey :: st_lwGradKey
lwGradient :: st_lwGradient
lwTexture :: st_lwTexture
lwTParam :: st_lwTParam
lwCParam :: st_lwCParam
Glow :: st_lwGlow
lwRMap :: st_lwRMap
lwLine :: st_lwLine
lwSurface :: st_lwSurface
lwVMap :: st_lwVMap
lwVMapPt :: st_lwVMapPt
lwPoint :: st_lwPoint
lwPolVert :: st_lwPolVert
lwPolygon :: st_lwPolygon
lwPointList :: st_lwPointList
lwPolygonList :: st_lwPolygonList
lwLayer :: st_lwLayer
lwTagList :: st_lwTagList
lwObject :: st_lwObject

st_lwNode :: struct {
	next: ^st_lwNode,
	prev: ^st_lwNode,
	data: rawptr,
}

st_lwPlugin :: struct {
	next:  ^st_lwPlugin,
	prev:  ^st_lwPlugin,
	ord:   cstring,
	name:  cstring,
	flags: lwint,
	data:  rawptr,
}

st_lwKey :: struct {
	next:       ^st_lwKey,
	prev:       ^st_lwKey,
	value:      lwfloat,
	time:       lwfloat,
	shape:      lwuint,
	tension:    lwfloat,
	continuity: lwfloat,
	bias:       lwfloat,
	param:      [4]lwfloat,
}

st_lwEnvelope :: struct {
	next:      ^st_lwEnvelope,
	prev:      ^st_lwEnvelope,
	index:     lwint,
	type:      lwint,
	name:      cstring,
	key:       ^lwKey,
	nkeys:     lwint,
	behavior:  [2]lwint,
	cfilter:   ^lwPlugin,
	ncfilters: lwint,
}

st_lwEParam :: struct {
	val:    lwfloat,
	eindex: lwint,
}

st_lwVParam :: struct {
	val:    [3]lwfloat,
	eindex: lwint,
}

st_lwClipStill :: struct {
	name: cstring,
}

st_lwClipSeq :: struct {
	prefix: cstring,
	suffix: cstring,
	digits: lwint,
	flags:  lwint,
	offset: lwint,
	start:  lwint,
	end:    lwint,
}

st_lwClipAnim :: struct {
	name:   cstring,
	server: cstring,
	data:   rawptr,
}

st_lwClip :: struct {
	next:       ^st_lwClip,
	prev:       ^st_lwClip,
	index:      lwint,
	type:       lwuint,
	source:     AnonymousUnion0,
	start_time: lwfloat,
	duration:   lwfloat,
	frame_rate: lwfloat,
	contrast:   lwEParam,
	brightness: lwEParam,
	saturation: lwEParam,
	hue:        lwEParam,
	gamma:      lwEParam,
	negative:   lwint,
	ifilter:    ^lwPlugin,
	nifilters:  lwint,
	pfilter:    ^lwPlugin,
	npfilters:  lwint,
}

st_lwClipXRef :: struct {
	string: cstring,
	index:  lwint,
	clip:   ^st_lwClip,
}

st_lwClipCycle :: struct {
	name: cstring,
	lo:   lwint,
	hi:   lwint,
}

st_lwTMap :: struct {
	size:       lwVParam,
	center:     lwVParam,
	rotate:     lwVParam,
	falloff:    lwVParam,
	fall_type:  lwint,
	ref_object: cstring,
	coord_sys:  lwint,
}

st_lwImageMap :: struct {
	cindex:      lwint,
	projection:  lwint,
	vmap_name:   cstring,
	axis:        lwint,
	wrapw_type:  lwint,
	wraph_type:  lwint,
	wrapw:       lwEParam,
	wraph:       lwEParam,
	aa_strength: lwfloat,
	aas_flags:   lwint,
	pblend:      lwint,
	stck:        lwEParam,
	amplitude:   lwEParam,
}

st_lwProcedural :: struct {
	axis:  lwint,
	value: [3]lwfloat,
	name:  cstring,
	data:  rawptr,
}

st_lwGradKey :: struct {
	next:  ^st_lwGradKey,
	prev:  ^st_lwGradKey,
	value: lwfloat,
	rgba:  [4]lwfloat,
}

st_lwGradient :: struct {
	paramname: cstring,
	itemname:  cstring,
	start:     lwfloat,
	end:       lwfloat,
	repeat:    lwint,
	key:       ^lwGradKey,
	ikey:      ^lwshort,
}

st_lwTexture :: struct {
	next:      ^st_lwTexture,
	prev:      ^st_lwTexture,
	ord:       cstring,
	type:      lwuint,
	chan:      lwuint,
	opacity:   lwEParam,
	opac_type: lwshort,
	enabled:   lwshort,
	negative:  lwshort,
	axis:      lwshort,
	param:     AnonymousUnion1,
	tmap:      lwTMap,
}

st_lwTParam :: struct {
	val:    lwfloat,
	eindex: lwint,
	tex:    ^lwTexture,
}

st_lwCParam :: struct {
	rgb:    [3]lwfloat,
	eindex: lwint,
	tex:    ^lwTexture,
}

st_lwGlow :: struct {
	enabled:   lwshort,
	type:      lwshort,
	intensity: lwEParam,
	size:      lwEParam,
}

st_lwRMap :: struct {
	val:        lwTParam,
	options:    lwint,
	cindex:     lwint,
	seam_angle: lwfloat,
}

st_lwLine :: struct {
	enabled: lwshort,
	flags:   lwushort,
	size:    lwEParam,
}

st_lwSurface :: struct {
	next:         ^st_lwSurface,
	prev:         ^st_lwSurface,
	name:         cstring,
	srcname:      cstring,
	color:        lwCParam,
	luminosity:   lwTParam,
	diffuse:      lwTParam,
	specularity:  lwTParam,
	glossiness:   lwTParam,
	reflection:   lwRMap,
	transparency: lwRMap,
	eta:          lwTParam,
	translucency: lwTParam,
	bump:         lwTParam,
	smooth:       lwfloat,
	sideflags:    lwint,
	alpha:        lwfloat,
	alpha_mode:   lwint,
	color_hilite: lwEParam,
	color_filter: lwEParam,
	add_trans:    lwEParam,
	dif_sharp:    lwEParam,
	glow:         lwEParam,
	line:         lwLine,
	shader:       ^lwPlugin,
	nshaders:     lwint,
}

st_lwVMap :: struct {
	next:    ^st_lwVMap,
	prev:    ^st_lwVMap,
	name:    cstring,
	type:    lwuint,
	dim:     lwint,
	nverts:  lwint,
	perpoly: lwint,
	vindex:  ^lwint,
	pindex:  ^lwint,
	val:     ^^lwfloat,
}

st_lwVMapPt :: struct {
	vmap:  ^lwVMap,
	index: lwint,
}

st_lwPoint :: struct {
	pos:    [3]lwfloat,
	npols:  lwint,
	pol:    ^lwint,
	nvmaps: lwint,
	vm:     ^lwVMapPt,
}

st_lwPolVert :: struct {
	index:  lwint,
	norm:   [3]lwfloat,
	nvmaps: lwint,
	vm:     ^lwVMapPt,
}

st_lwPolygon :: struct {
	surf:      ^lwSurface,
	part:      lwint,
	smoothgrp: lwint,
	flags:     lwint,
	type:      lwuint,
	norm:      [3]lwfloat,
	nverts:    lwint,
	v:         ^lwPolVert,
}

st_lwPointList :: struct {
	count:  lwint,
	offset: lwint,
	pt:     ^lwPoint,
}

st_lwPolygonList :: struct {
	count:   lwint,
	offset:  lwint,
	vcount:  lwint,
	voffset: lwint,
	pol:     ^lwPolygon,
}

st_lwLayer :: struct {
	next:    ^st_lwLayer,
	prev:    ^st_lwLayer,
	name:    cstring,
	index:   lwint,
	parent:  lwint,
	flags:   lwint,
	pivot:   [3]lwfloat,
	bbox:    [6]lwfloat,
	point:   lwPointList,
	polygon: lwPolygonList,
	nvmaps:  lwint,
	vmap:    ^lwVMap,
}

st_lwTagList :: struct {
	count:  lwint,
	offset: lwint,
	tag:    ^cstring,
}

st_lwObject :: struct {
	layer:   ^lwLayer,
	env:     ^lwEnvelope,
	clip:    ^lwClip,
	surf:    ^lwSurface,
	taglist: lwTagList,
	nlayers: lwint,
	nenvs:   lwint,
	nclips:  lwint,
	nsurfs:  lwint,
}

AnonymousUnion0 :: struct #raw_union {
	still: lwClipStill,
	seq:   lwClipSeq,
	anim:  lwClipAnim,
	xref:  lwClipXRef,
	cycle: lwClipCycle,
}

AnonymousUnion1 :: struct #raw_union {
	imap:  lwImageMap,
	_proc: lwProcedural,
	grad:  lwGradient,
}

@(default_calling_convention = "c")
foreign lightwave {

	@(link_name = "lwFreeLayer")
	lwFreeLayer :: proc(layer: ^lwLayer) ---

	@(link_name = "lwFreeObject")
	lwFreeObject :: proc(object: ^lwObject) ---

	@(link_name = "lwGetObject")
	lwGetObject :: proc(filename: cstring, failID: ^lwuint, failpos: ^lwint) -> ^lwObject ---

	@(link_name = "lwFreePoints")
	lwFreePoints :: proc(point: ^lwPointList) ---

	@(link_name = "lwFreePolygons")
	lwFreePolygons :: proc(plist: ^lwPolygonList) ---

	@(link_name = "lwGetPoints")
	lwGetPoints :: proc(fp: ^FILE, cksize: lwint, point: ^lwPointList) -> lwint ---

	@(link_name = "lwGetBoundingBox")
	lwGetBoundingBox :: proc(point: ^lwPointList, bbox: ^lwfloat) ---

	@(link_name = "lwAllocPolygons")
	lwAllocPolygons :: proc(plist: ^lwPolygonList, npols: lwint, nverts: lwint) -> lwint ---

	@(link_name = "lwGetPolygons")
	lwGetPolygons :: proc(fp: ^FILE, cksize: lwint, plist: ^lwPolygonList, ptoffset: lwint) -> lwint ---

	@(link_name = "lwGetPolyNormals")
	lwGetPolyNormals :: proc(point: ^lwPointList, polygon: ^lwPolygonList) ---

	@(link_name = "lwGetPointPolygons")
	lwGetPointPolygons :: proc(point: ^lwPointList, polygon: ^lwPolygonList) -> lwint ---

	@(link_name = "lwResolvePolySurfaces")
	lwResolvePolySurfaces :: proc(polygon: ^lwPolygonList, tlist: ^lwTagList, surf: ^^lwSurface, nsurfs: ^lwint) -> lwint ---

	@(link_name = "lwGetVertNormals")
	lwGetVertNormals :: proc(point: ^lwPointList, polygon: ^lwPolygonList) ---

	@(link_name = "lwFreeTags")
	lwFreeTags :: proc(tlist: ^lwTagList) ---

	@(link_name = "lwGetTags")
	lwGetTags :: proc(fp: ^FILE, cksize: lwint, tlist: ^lwTagList) -> lwint ---

	@(link_name = "lwGetPolygonTags")
	lwGetPolygonTags :: proc(fp: ^FILE, cksize: lwint, tlist: ^lwTagList, plist: ^lwPolygonList) -> lwint ---

	@(link_name = "lwFreeVMap")
	lwFreeVMap :: proc(vmap: ^lwVMap) ---

	@(link_name = "lwGetVMap")
	lwGetVMap :: proc(fp: ^FILE, cksize: lwint, ptoffset: lwint, poloffset: lwint, perpoly: lwint) -> ^lwVMap ---

	@(link_name = "lwGetPointVMaps")
	lwGetPointVMaps :: proc(point: ^lwPointList, vmap: ^lwVMap) -> lwint ---

	@(link_name = "lwGetPolyVMaps")
	lwGetPolyVMaps :: proc(polygon: ^lwPolygonList, vmap: ^lwVMap) -> lwint ---

	@(link_name = "lwFreeClip")
	lwFreeClip :: proc(clip: ^lwClip) ---

	@(link_name = "lwGetClip")
	lwGetClip :: proc(fp: ^FILE, cksize: lwint) -> ^lwClip ---

	@(link_name = "lwFindClip")
	lwFindClip :: proc(list: ^lwClip, index: lwint) -> ^lwClip ---

	@(link_name = "lwFreeEnvelope")
	lwFreeEnvelope :: proc(env: ^lwEnvelope) ---

	@(link_name = "lwGetEnvelope")
	lwGetEnvelope :: proc(fp: ^FILE, cksize: lwint) -> ^lwEnvelope ---

	@(link_name = "lwFindEnvelope")
	lwFindEnvelope :: proc(list: ^lwEnvelope, index: lwint) -> ^lwEnvelope ---

	@(link_name = "lwEvalEnvelope")
	lwEvalEnvelope :: proc(env: ^lwEnvelope, time: lwfloat) -> lwfloat ---

	@(link_name = "lwFreePlugin")
	lwFreePlugin :: proc(p: ^lwPlugin) ---

	@(link_name = "lwFreeTexture")
	lwFreeTexture :: proc(t: ^lwTexture) ---

	@(link_name = "lwFreeSurface")
	lwFreeSurface :: proc(surf: ^lwSurface) ---

	@(link_name = "lwGetTHeader")
	lwGetTHeader :: proc(fp: ^FILE, hsz: lwint, tex: ^lwTexture) -> lwint ---

	@(link_name = "lwGetTMap")
	lwGetTMap :: proc(fp: ^FILE, tmapsz: lwint, tmap: ^lwTMap) -> lwint ---

	@(link_name = "lwGetImageMap")
	lwGetImageMap :: proc(fp: ^FILE, rsz: lwint, tex: ^lwTexture) -> lwint ---

	@(link_name = "lwGetProcedural")
	lwGetProcedural :: proc(fp: ^FILE, rsz: lwint, tex: ^lwTexture) -> lwint ---

	@(link_name = "lwGetGradient")
	lwGetGradient :: proc(fp: ^FILE, rsz: lwint, tex: ^lwTexture) -> lwint ---

	@(link_name = "lwGetTexture")
	lwGetTexture :: proc(fp: ^FILE, bloksz: lwint, type: lwuint) -> ^lwTexture ---

	@(link_name = "lwGetShader")
	lwGetShader :: proc(fp: ^FILE, bloksz: lwint) -> ^lwPlugin ---

	@(link_name = "lwGetSurface")
	lwGetSurface :: proc(fp: ^FILE, cksize: lwint) -> ^lwSurface ---

	@(link_name = "lwDefaultSurface")
	lwDefaultSurface :: proc() -> ^lwSurface ---

	@(link_name = "lwGetSurface5")
	lwGetSurface5 :: proc(fp: ^FILE, cksize: lwint, obj: ^lwObject) -> ^lwSurface ---

	@(link_name = "lwGetPolygons5")
	lwGetPolygons5 :: proc(fp: ^FILE, cksize: lwint, plist: ^lwPolygonList, ptoffset: lwint) -> lwint ---

	@(link_name = "lwGetObject5")
	lwGetObject5 :: proc(filename: cstring, failID: ^lwuint, failpos: ^lwint) -> ^lwObject ---

	@(link_name = "lwListFree")
	lwListFree :: proc(list: rawptr, unamed0: #type proc(unamed0: rawptr)) ---

	@(link_name = "lwListAdd")
	lwListAdd :: proc(list: ^rawptr, node: rawptr) ---

	@(link_name = "lwListInsert")
	lwListInsert :: proc(vlist: ^rawptr, vitem: rawptr, unamed0: #type proc(unamed0: rawptr, unamed1: rawptr) -> lwint) ---

	@(link_name = "dot")
	dot :: proc(a: ^lwfloat, b: ^lwfloat) -> lwfloat ---

	@(link_name = "cross")
	cross :: proc(a: ^lwfloat, b: ^lwfloat, c: ^lwfloat) ---

	@(link_name = "normalize")
	normalize :: proc(v: ^lwfloat) ---

	@(link_name = "set_flen")
	set_flen :: proc(i: lwint) ---

	@(link_name = "get_flen")
	get_flen :: proc() -> lwint ---

	@(link_name = "getbytes")
	getbytes :: proc(fp: ^FILE, size: lwint) -> rawptr ---

	@(link_name = "skipbytes")
	skipbytes :: proc(fp: ^FILE, n: lwint) ---

	@(link_name = "getI1")
	getI1 :: proc(fp: ^FILE) -> lwint ---

	@(link_name = "getI2")
	getI2 :: proc(fp: ^FILE) -> lwshort ---

	@(link_name = "getI4")
	getI4 :: proc(fp: ^FILE) -> lwint ---

	@(link_name = "getU1")
	getU1 :: proc(fp: ^FILE) -> lwchar ---

	@(link_name = "getU2")
	getU2 :: proc(fp: ^FILE) -> lwushort ---

	@(link_name = "getU4")
	getU4 :: proc(fp: ^FILE) -> lwuint ---

	@(link_name = "getVX")
	getVX :: proc(fp: ^FILE) -> lwint ---

	@(link_name = "getF4")
	getF4 :: proc(fp: ^FILE) -> lwfloat ---

	@(link_name = "getS0")
	getS0 :: proc(fp: ^FILE) -> cstring ---

	@(link_name = "sgetI1")
	sgetI1 :: proc(bp: ^^lwchar) -> lwint ---

	@(link_name = "sgetI2")
	sgetI2 :: proc(bp: ^^lwchar) -> lwshort ---

	@(link_name = "sgetI4")
	sgetI4 :: proc(bp: ^^lwchar) -> lwint ---

	@(link_name = "sgetU1")
	sgetU1 :: proc(bp: ^^lwchar) -> lwchar ---

	@(link_name = "sgetU2")
	sgetU2 :: proc(bp: ^^lwchar) -> lwushort ---

	@(link_name = "sgetU4")
	sgetU4 :: proc(bp: ^^lwchar) -> lwuint ---

	@(link_name = "sgetVX")
	sgetVX :: proc(bp: ^^lwchar) -> lwint ---

	@(link_name = "sgetF4")
	sgetF4 :: proc(bp: ^^lwchar) -> lwfloat ---

	@(link_name = "sgetS0")
	sgetS0 :: proc(bp: ^^lwchar) -> cstring ---

}
