local base64 = require 'base64'

function Image(el)
  local src = el.src
  if src:match("^http") then
    return el -- leave remote URLs as is
  end
  local f = io.open(src, "rb")
  if not f then
    io.stderr:write("⚠️ Warning: cannot open image file " .. src .. "\n")
    return el
  end
  local data = f:read("*all")
  f:close()
  local ext = src:match("^.+(%..+)$")
  local mime = "image/png" -- default
  if ext then
    ext = ext:lower()
    if ext == ".jpg" or ext == ".jpeg" then
      mime = "image/jpeg"
    elseif ext == ".gif" then
      mime = "image/gif"
    elseif ext == ".svg" then
      mime = "image/svg+xml"
    elseif ext == ".webp" then
      mime = "image/webp"
    end
  end
  local b64 = base64.encode(data)
  el.src = "data:" .. mime .. ";base64," .. b64
  return el
end
