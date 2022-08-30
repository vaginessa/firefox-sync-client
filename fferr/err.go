package fferr

import "github.com/joomcode/errorx"

var (
	FFSyncErrors = errorx.NewNamespace("ffsync")
)

var (
	Request404 = FFSyncErrors.NewType("http_404")
)