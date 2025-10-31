--[[
Quarto filter to set date-modified from git commit history.

This filter runs during Quarto rendering and sets the date-modified
metadata field based on the last git commit for each document.
]]--

local function get_git_date(file_path)
  -- Get the last commit date for the file
  local command = 'git log -1 --format=%cI -- "' .. file_path .. '"'
  local handle = io.popen(command)
  local result = handle:read("*a")
  handle:close()

  -- Trim whitespace
  result = result:gsub("^%s*(.-)%s*$", "%1")

  if result ~= "" then
    -- Parse ISO date
    local year, month, day = result:match("(%d%d%d%d)%-(%d%d)%-(%d%d)")
    if year and month and day then
      -- Format as "MMMM D, YYYY" (e.g., "October 14, 2025")
      local months = {
        "January", "February", "March", "April", "May", "June",
        "July", "August", "September", "October", "November", "December"
      }
      local month_name = months[tonumber(month)]
      local day_num = tonumber(day)

      return month_name .. " " .. day_num .. ", " .. year
    end
  end

  return nil
end

-- This runs after Quarto processes metadata, so we need to set date-modified
-- regardless of what's already there
function Meta(meta)
  -- Get the input file path
  local input_file = quarto.doc.input_file

  if not input_file then
    return meta
  end

  -- Get git date for this file
  local git_date = get_git_date(input_file)

  if git_date then
    -- Set date-modified to the git commit date
    -- Use MetaString so Quarto can format it
    meta["date-modified"] = pandoc.MetaString(git_date)
  else
    -- Fallback: use current date if no git history
    meta["date-modified"] = pandoc.MetaString(os.date("%Y-%m-%d"))
  end

  return meta
end
