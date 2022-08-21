package syncclient

type loginRequestSchema struct {
	Email  string `json:"email"`
	AuthPW string `json:"authPW"`
	Reason string `json:"reason"`
}

type loginResponseSchema struct {
	UserID         string `json:"uid"`
	SessionToken   string `json:"sessionToken"`
	AuthAt         int64  `json:"authAt"`
	MetricsEnabled bool   `json:"metricsEnabled"`
	KeyFetchToken  string `json:"keyFetchToken"`
	Verified       bool   `json:"verified"`
}

type keysResponseSchema struct {
	Bundle string `json:"bundle"`
}

type signCertRequestSchemaPKey struct {
	Algorithm string `json:"algorithm"`
	P         string `json:"p"`
	Q         string `json:"q"`
	G         string `json:"g"`
	Y         string `json:"y"`
}

type signCertRequestSchema struct {
	PublicKey signCertRequestSchemaPKey `json:"publicKey"`
	Duration  int64                     `json:"duration"`
}

type signCertResponseSchema struct {
	Certificate string `json:"cert"`
}

type hawkCredResponseSchema struct {
	ID            string `json:"id"`
	Key           string `json:"key"`
	UID           string `json:"uid"`
	APIEndpoint   string `json:"api_endpoint"`
	Duration      string `json:"duration"`
	HashAlgorithm string `json:"hashalg"`
	HashedFxAUID  string `json:"hashed_fxa_uid"`
	NodeType      string `json:"node_type"`
}