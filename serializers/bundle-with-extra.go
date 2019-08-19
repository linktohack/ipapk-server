package serializers

import (
	"github.com/linktohack/ipapk-server/models"
)

type BundleWithExtraJSON struct {
	Bundle     models.Bundle `json:"bundle"`
	InstallUrl string        `json:"installUrl"`
	QrCodeUrl  string        `json:"qrCodeUrl"`
	IconUrl    string        `json:"iconUrl"`
}
