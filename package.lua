return {
  name = "zhaozg/device",
  version = "0.0.1",
  homepage = "https://github.com/zhaozg/luvit-device",
  description = "modbus module for luvit.",
  tags = {"ffi", "nonamsg", "MQ"},
  author = { name = "George Zhao" },
  license = "MIT",
  files = {
    "modbus/**",
    "serial/**"
  },
  dependencies = {
    "luvit/timer@2.0.0",
    "luvit/utils@2.0.0",
    "luvit/core@2.0.0",
  }
}
