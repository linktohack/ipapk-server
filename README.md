# What
IPA & APK server

# Build & deploy
```sh
go get github.com/linktohack/ipapk-server
make linux
# or build & deploy via docker
make deploy
```

# Config
`config.json`
```json
{
  "host": "0.0.0.0",
  "port": "8080",
  "database": "file:db.sqlite3",
  "proxy": "https://apps.ql6625.fr"
}
```

# Upload
POST /upload (multipart)
param:
```
package: IPA/APK, required
changelog: ChangeLog, optional
```
response:
```json
{
    "uid": "820e8c1b-954a-4489-8d6c-7ea2c47d1ec1",
    "name": "xxxxxxx",
    "platform": "ios",
    "bundleId": "com.xxxxxx",
    "version": "1.0.0",
    "build": "100",
    "install_url": "itms-services://?action=download-manifest&url=https://apps.ql6625.fr/plist/820e8c1b-954a-4489-8d6c-7ea2c47d1ec1",
    "qrcode_url": "https://apps.ql6625.fr/qrcode/820e8c1b-954a-4489-8d6c-7ea2c47d1ec1",
    "icon_url": "https://apps.ql6625.fr/icon/820e8c1b-954a-4489-8d6c-7ea2c47d1ec1",
    "downloads": 0
}
```
With ommand line:
```sh
curl -X POST https://apps.ql6625.fr/upload -F "file=@test.ipa" -F "changelog=123"
```
Or using web interface at the end of home page.
