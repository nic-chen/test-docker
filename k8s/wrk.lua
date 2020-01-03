counter = 0

request = function()
   svr = string.format("%03d", counter % 900 + 1)
   path = "/service_" .. svr .. "/" .. counter
   counter = counter + 1
   return wrk.format(nil, path)
end
