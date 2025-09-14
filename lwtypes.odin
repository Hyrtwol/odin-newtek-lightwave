#+vet
package lightwave

import _c "core:c/libc"

lwint :: _c.int
lwuint :: _c.uint
lwshort :: _c.short
lwushort :: _c.ushort
lwfloat :: _c.float
lwdouble :: _c.double
lwbyte :: _c.char
lwchar :: _c.uchar
FILE :: _c.FILE

LWImageID :: rawptr
LWBufferValue :: lwfloat
LWPixmapID :: rawptr
LWTextureID :: rawptr
NodeEditorID :: rawptr

LWFrame :: lwint
LWTime :: lwdouble

LWFVector :: [3]lwfloat
LWDVector :: [3]lwdouble
LWFMatrix3 :: matrix[3, 3]lwfloat
LWFMatrix4 :: matrix[4, 4]lwfloat
LWDMatrix3 :: matrix[3, 3]lwdouble
LWDMatrix4 :: matrix[4, 4]lwdouble

LWID :: lwuint

LWID_ :: #force_inline proc(a, b, c, d: lwuint) -> LWID {
	return (LWID(lwbyte(a)) << 24) | (LWID(lwbyte(b)) << 16) | (LWID(lwbyte(c)) << 8) | LWID(lwbyte(d))
}

LWCommandCode :: lwint

LWChannelID :: rawptr

/*
Persistent instances are just some opaque data object referenced
by void pointer.  Errors from handler functions are human-readable
strings, where a null string pointer indicates no error.
*/
LWInstance :: rawptr

LWError :: ^lwbyte
