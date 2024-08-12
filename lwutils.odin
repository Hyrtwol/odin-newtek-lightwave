package lightwave

import "core:slice"

get_points :: #force_inline proc "contextless" (pointList: ^lwPointList) -> []lwPoint {
	return slice.from_ptr(pointList.pt, int(pointList.count))
}

get_pols :: #force_inline proc "contextless" (point: ^lwPoint) -> []lwint {
	return slice.from_ptr(point.pol, int(point.npols))
}

get_vmaps :: #force_inline proc "contextless" (point: ^lwPoint) -> []lwVMapPt {
	return slice.from_ptr(point.vm, int(point.nvmaps))
}

get_polys :: #force_inline proc "contextless" (polygonList: ^lwPolygonList) -> []lwPolygon {
	return slice.from_ptr(polygonList.pol, int(polygonList.count))
}

get_polverts :: #force_inline proc "contextless" (poly: ^lwPolygon) -> []lwPolVert {
	return slice.from_ptr(poly.v, int(poly.nverts))
}

get_polvert_vmaps :: #force_inline proc "contextless" (polVert: ^lwPolVert) -> []lwVMapPt {
	return slice.from_ptr(polVert.vm, int(polVert.nvmaps))
}
