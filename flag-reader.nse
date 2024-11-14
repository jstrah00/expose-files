-- Define the description and category
description = [[
  This script reads the content of a file called 'flag.txt' in the current directory.
]]
categories = {"discovery", "intrusive"}

-- Import necessary libraries
local stdnse = require("stdnse")

-- Define the rule function to specify when this script should run
hostrule = function(host)
  return true  -- Always run on specified target
end

-- Define the main action function
action = function(host)
  -- Execute a command to read the file content
  local file = io.popen("cat flag.txt", "r")
  if not file then
    return "Error: Could not read file"
  end

  -- Read file content
  local content = file:read("*a")
  file:close()

  if content then
    return "flag.txt content:\n" .. content
  else
    return "Error: No content found in flag.txt"
  end
end

