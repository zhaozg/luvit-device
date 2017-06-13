local ffi = require 'ffi'
local arch = ffi.os .. "-" .. ffi.arch

local device = require('device')
local serial = require('./'..arch..'/serial')

local extend = function(...)
  local args = {...}
  local obj = args[1]
  for i=2, #args do
    for k,v in pairs(args[i]) do
      obj[k] = v
    end
  end
  return obj
end

--COMx[:][baud=b][parity=p][data=d][stop=s][to={on|off}][xon={on|off}][odsr={on|off}][octs={on|off}][dtr={on|off|hs}][rts={on|off|hs|tg}][idsr={on|off}]
local DEFAULT_OPTIONS = {
  baud=9600,
  data=8,
  stop=1,
  parity='N',
  to='off',
  xon='off',
  odsr='off',
  octs='off',
  dtr='off',
  rts='off',
  idsr='off',
  debug=false
}

exports.open = function(devname, ...)
  local dev,options,callback
  options = {...}
  if #options==2 then
    callback = options[2]
    options = options[1]
  elseif #options==1 then
    if type(options[1])=='function' then
      callback = options[1]
      options = nil
    else
      options=options[1]
    end
  end

  callback = callback or function() end
  options = extend({}, DEFAULT_OPTIONS, options or {})
  dev = serial.Serial:new(devname,options)
  dev:open(callback)
  return dev
end

exports.Device = device.Device
