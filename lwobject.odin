package lightwave

foreign import lightwave "lightwave.lib"

lwBEH :: enum lwint {
	BEH_RESET = 0,
	BEH_CONSTANT = 1,
	BEH_REPEAT = 2,
	BEH_OSCILLATE = 3,
	BEH_OFFSET = 4,
	BEH_LINEAR = 5,
}

lwPROJ :: enum lwint {
	PROJ_PLANAR = 0,
	PROJ_CYLINDRICAL = 1,
	PROJ_SPHERICAL = 2,
	PROJ_CUBIC = 3,
	PROJ_FRONT = 4,
}

lwWRAP :: enum lwint {
	WRAP_NONE = 0,
	WRAP_EDGE = 1,
	WRAP_REPEAT = 2,
	WRAP_MIRROR = 3,
}

lwNode :: struct {
	next: ^lwNode,
	prev: ^lwNode,
	data: rawptr,
}

lwPlugin :: struct {
	next:  ^lwPlugin,
	prev:  ^lwPlugin,
	ord:   cstring,
	name:  cstring,
	flags: lwint,
	data:  rawptr,
}

lwKey :: struct {
	next:       ^lwKey,
	prev:       ^lwKey,
	value:      lwfloat,
	time:       lwfloat,
	shape:      lwuint,
	tension:    lwfloat,
	continuity: lwfloat,
	bias:       lwfloat,
	param:      [4]lwfloat,
}

lwEnvelope :: struct {
	next:      ^lwEnvelope,
	prev:      ^lwEnvelope,
	index:     lwint,
	type:      lwint,
	name:      cstring,
	key:       ^lwKey,
	nkeys:     lwint,
	behavior:  [2]lwBEH,
	cfilter:   ^lwPlugin,
	ncfilters: lwint,
}

lwEParam :: struct {
	val:    lwfloat,
	eindex: lwint,
}

lwVParam :: struct {
	val:    LWFVector,
	eindex: lwint,
}

lwClipStill :: struct {
	name: cstring,
}

lwClipSeq :: struct {
	prefix: cstring,
	suffix: cstring,
	digits: lwint,
	flags:  lwint,
	offset: lwint,
	start:  lwint,
	end:    lwint,
}

lwClipAnim :: struct {
	name:   cstring,
	server: cstring,
	data:   rawptr,
}

lwClip :: struct {
	next:       ^lwClip,
	prev:       ^lwClip,
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

lwClipXRef :: struct {
	string: cstring,
	index:  lwint,
	clip:   ^lwClip,
}

lwClipCycle :: struct {
	name: cstring,
	lo:   lwint,
	hi:   lwint,
}

lwTMap :: struct {
	size:       lwVParam,
	center:     lwVParam,
	rotate:     lwVParam,
	falloff:    lwVParam,
	fall_type:  lwint,
	ref_object: cstring,
	coord_sys:  lwint,
}

lwImageMap :: struct {
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

lwProcedural :: struct {
	axis:  lwint,
	value: LWFVector,
	name:  cstring,
	data:  rawptr,
}

lwGradKey :: struct {
	next:  ^lwGradKey,
	prev:  ^lwGradKey,
	value: lwfloat,
	rgba:  [4]lwfloat,
}

lwGradient :: struct {
	paramname: cstring,
	itemname:  cstring,
	start:     lwfloat,
	end:       lwfloat,
	repeat:    lwint,
	key:       ^lwGradKey,
	ikey:      ^lwshort,
}

lwTexture :: struct {
	next:      ^lwTexture,
	prev:      ^lwTexture,
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

lwTParam :: struct {
	val:    lwfloat,
	eindex: lwint,
	tex:    ^lwTexture,
}

lwCParam :: struct {
	rgb:    LWFVector,
	eindex: lwint,
	tex:    ^lwTexture,
}

lwGlow :: struct {
	enabled:   lwshort,
	type:      lwshort,
	intensity: lwEParam,
	size:      lwEParam,
}

lwRMap :: struct {
	val:        lwTParam,
	options:    lwint,
	cindex:     lwint,
	seam_angle: lwfloat,
}

lwLine :: struct {
	enabled: lwshort,
	flags:   lwushort,
	size:    lwEParam,
}

lwSurface :: struct {
	next:         ^lwSurface,
	prev:         ^lwSurface,
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

lwVMap :: struct {
	next:    ^lwVMap,
	prev:    ^lwVMap,
	name:    cstring,
	type:    lwuint,
	dim:     lwint,
	nverts:  lwint,
	perpoly: lwint,
	vindex:  ^lwint,
	pindex:  ^lwint,
	val:     ^^lwfloat,
}

lwVMapPt :: struct {
	vmap:  ^lwVMap,
	index: lwint,
}

lwPoint :: struct {
	pos:    LWFVector,
	npols:  lwint,
	pol:    ^lwint,
	nvmaps: lwint,
	vm:     ^lwVMapPt,
}

lwPolVert :: struct {
	index:  lwint,
	norm:   LWFVector,
	nvmaps: lwint,
	vm:     ^lwVMapPt,
}

lwPolygon :: struct {
	surf:      ^lwSurface,
	part:      lwint,
	smoothgrp: lwint,
	flags:     lwint,
	type:      polygon_types, // lwuint,
	norm:      LWFVector,
	nverts:    lwint,
	v:         ^lwPolVert,
}

lwPointList :: struct {
	count:  lwint,
	offset: lwint,
	pt:     ^lwPoint,
}

lwPolygonList :: struct {
	count:   lwint,
	offset:  lwint,
	vcount:  lwint,
	voffset: lwint,
	pol:     ^lwPolygon,
}

lwLayer :: struct {
	next:    ^lwLayer,
	prev:    ^lwLayer,
	name:    cstring,
	index:   lwint,
	parent:  lwint,
	flags:   lwint,
	pivot:   LWFVector,
	bbox:    [2]LWFVector, // [6]lwfloat,
	point:   lwPointList,
	polygon: lwPolygonList,
	nvmaps:  lwint,
	vmap:    ^lwVMap,
}

lwTagList :: struct {
	count:  lwint,
	offset: lwint,
	tag:    ^cstring,
}

lwObject :: struct {
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
	lwFreeLayer :: proc(layer: ^lwLayer) ---
	lwFreeObject :: proc(object: ^lwObject) ---
	lwGetObject :: proc(filename: cstring, failID: ^lwuint, failpos: ^lwint) -> ^lwObject ---
	lwFreePoints :: proc(point: ^lwPointList) ---
	lwFreePolygons :: proc(plist: ^lwPolygonList) ---
	lwGetPoints :: proc(fp: ^FILE, cksize: lwint, point: ^lwPointList) -> lwint ---
	lwGetBoundingBox :: proc(point: ^lwPointList, bbox: ^lwfloat) ---
	lwAllocPolygons :: proc(plist: ^lwPolygonList, npols: lwint, nverts: lwint) -> lwint ---
	lwGetPolygons :: proc(fp: ^FILE, cksize: lwint, plist: ^lwPolygonList, ptoffset: lwint) -> lwint ---
	lwGetPolyNormals :: proc(point: ^lwPointList, polygon: ^lwPolygonList) ---
	lwGetPointPolygons :: proc(point: ^lwPointList, polygon: ^lwPolygonList) -> lwint ---
	lwResolvePolySurfaces :: proc(polygon: ^lwPolygonList, tlist: ^lwTagList, surf: ^^lwSurface, nsurfs: ^lwint) -> lwint ---
	lwGetVertNormals :: proc(point: ^lwPointList, polygon: ^lwPolygonList) ---
	lwFreeTags :: proc(tlist: ^lwTagList) ---
	lwGetTags :: proc(fp: ^FILE, cksize: lwint, tlist: ^lwTagList) -> lwint ---
	lwGetPolygonTags :: proc(fp: ^FILE, cksize: lwint, tlist: ^lwTagList, plist: ^lwPolygonList) -> lwint ---
	lwFreeVMap :: proc(vmap: ^lwVMap) ---
	lwGetVMap :: proc(fp: ^FILE, cksize: lwint, ptoffset: lwint, poloffset: lwint, perpoly: lwint) -> ^lwVMap ---
	lwGetPointVMaps :: proc(point: ^lwPointList, vmap: ^lwVMap) -> lwint ---
	lwGetPolyVMaps :: proc(polygon: ^lwPolygonList, vmap: ^lwVMap) -> lwint ---
	lwFreeClip :: proc(clip: ^lwClip) ---
	lwGetClip :: proc(fp: ^FILE, cksize: lwint) -> ^lwClip ---
	lwFindClip :: proc(list: ^lwClip, index: lwint) -> ^lwClip ---
	lwFreeEnvelope :: proc(env: ^lwEnvelope) ---
	lwGetEnvelope :: proc(fp: ^FILE, cksize: lwint) -> ^lwEnvelope ---
	lwFindEnvelope :: proc(list: ^lwEnvelope, index: lwint) -> ^lwEnvelope ---
	lwEvalEnvelope :: proc(env: ^lwEnvelope, time: lwfloat) -> lwfloat ---
	lwFreePlugin :: proc(p: ^lwPlugin) ---
	lwFreeTexture :: proc(t: ^lwTexture) ---
	lwFreeSurface :: proc(surf: ^lwSurface) ---
	lwGetTHeader :: proc(fp: ^FILE, hsz: lwint, tex: ^lwTexture) -> lwint ---
	lwGetTMap :: proc(fp: ^FILE, tmapsz: lwint, tmap: ^lwTMap) -> lwint ---
	lwGetImageMap :: proc(fp: ^FILE, rsz: lwint, tex: ^lwTexture) -> lwint ---
	lwGetProcedural :: proc(fp: ^FILE, rsz: lwint, tex: ^lwTexture) -> lwint ---
	lwGetGradient :: proc(fp: ^FILE, rsz: lwint, tex: ^lwTexture) -> lwint ---
	lwGetTexture :: proc(fp: ^FILE, bloksz: lwint, type: lwuint) -> ^lwTexture ---
	lwGetShader :: proc(fp: ^FILE, bloksz: lwint) -> ^lwPlugin ---
	lwGetSurface :: proc(fp: ^FILE, cksize: lwint) -> ^lwSurface ---
	lwDefaultSurface :: proc() -> ^lwSurface ---
	lwGetSurface5 :: proc(fp: ^FILE, cksize: lwint, obj: ^lwObject) -> ^lwSurface ---
	lwGetPolygons5 :: proc(fp: ^FILE, cksize: lwint, plist: ^lwPolygonList, ptoffset: lwint) -> lwint ---
	lwGetObject5 :: proc(filename: cstring, failID: ^lwuint, failpos: ^lwint) -> ^lwObject ---
	lwListFree :: proc(list: rawptr, unamed0: #type proc(unamed0: rawptr)) ---
	lwListAdd :: proc(list: ^rawptr, node: rawptr) ---
	lwListInsert :: proc(vlist: ^rawptr, vitem: rawptr, unamed0: #type proc(unamed0: rawptr, unamed1: rawptr) -> lwint) ---
	dot :: proc(a: ^lwfloat, b: ^lwfloat) -> lwfloat ---
	cross :: proc(a: ^lwfloat, b: ^lwfloat, c: ^lwfloat) ---
	normalize :: proc(v: ^lwfloat) ---
	set_flen :: proc(i: lwint) ---
	get_flen :: proc() -> lwint ---
	getbytes :: proc(fp: ^FILE, size: lwint) -> rawptr ---
	skipbytes :: proc(fp: ^FILE, n: lwint) ---
	getI1 :: proc(fp: ^FILE) -> lwint ---
	getI2 :: proc(fp: ^FILE) -> lwshort ---
	getI4 :: proc(fp: ^FILE) -> lwint ---
	getU1 :: proc(fp: ^FILE) -> lwchar ---
	getU2 :: proc(fp: ^FILE) -> lwushort ---
	getU4 :: proc(fp: ^FILE) -> lwuint ---
	getVX :: proc(fp: ^FILE) -> lwint ---
	getF4 :: proc(fp: ^FILE) -> lwfloat ---
	getS0 :: proc(fp: ^FILE) -> cstring ---
	sgetI1 :: proc(bp: ^^lwchar) -> lwint ---
	sgetI2 :: proc(bp: ^^lwchar) -> lwshort ---
	sgetI4 :: proc(bp: ^^lwchar) -> lwint ---
	sgetU1 :: proc(bp: ^^lwchar) -> lwchar ---
	sgetU2 :: proc(bp: ^^lwchar) -> lwushort ---
	sgetU4 :: proc(bp: ^^lwchar) -> lwuint ---
	sgetVX :: proc(bp: ^^lwchar) -> lwint ---
	sgetF4 :: proc(bp: ^^lwchar) -> lwfloat ---
	sgetS0 :: proc(bp: ^^lwchar) -> cstring ---
}
