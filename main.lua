-- Load libraries
fennel = require("lib.fennel")
narrator = require("narrator.narrator")
book = require("coming-out")

-- Use fennel's tracebacks, makes things intelligeble
debug.traceback = fennel.traceback

-- Allow require to load fennel files
table.insert(package.loaders, fennel.make_searcher({correlate=true}))

-- dump function for tables
function dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end

-- Load main fennel file
require("game")
