package models

import (
	"github.com/gin-gonic/gin"
	"github.com/jinzhu/gorm"
	_ "github.com/jinzhu/gorm/dialects/sqlite"
	"github.com/sharljimhtsin/ipapk-server-fixed-pkg-error/conf"
)

var orm *gorm.DB

func InitDB() error {
	var err error
	orm, err = gorm.Open("sqlite", conf.AppConfig.Database)
	if err != nil {
		return err
	}
	if gin.Mode() != "release" {
		orm.LogMode(true)
	}
	orm.AutoMigrate(&Bundle{})
	return nil
}
