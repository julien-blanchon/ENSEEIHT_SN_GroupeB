module decoder4to16(e[3..0] : s[15..0])
	decoder3to8 (e[2..0] : c[7..0])
	s[7..0] = /e[3]*c[7..0]
	s[15..8] = e[3]*c[7..0]
end module
