package conf

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
)

var AppConfig *Config

type Config struct {
	Host     string `json:"host"`
	Port     string `json:"port"`
	Proxy    string `json:"proxy"`
	Database string `json:"database"`
}

func InitConfig(filename string) error {
	data, err := ioutil.ReadFile(filename)
	if err != nil {
		return err
	}

	if err := json.Unmarshal(data, &AppConfig); err != nil {
		return err
	}
	return nil
}

func (c *Config) Addr() string {
	return fmt.Sprintf("%v:%v", c.Host, c.Port)
}

func (c *Config) ProxyURL() string {

	return c.Proxy
}
