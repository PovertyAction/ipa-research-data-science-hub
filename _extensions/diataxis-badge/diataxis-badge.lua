--[[
Quarto filter that reads the page's `categories` metadata and, when one of
the four Diataxis documentation types is present, sets two metadata fields
consumed by the title-block template partial
(assets/design-styles/title-block.html):

  diataxis-type  - slug used in the badge's CSS class
                   (tutorial | how-to | reference | explanation)
  diataxis-label - display text for the badge

Canonical values in `categories` are matched case-insensitively, and a few
common variants (e.g. "how-to guide") are normalized.
]]--

local LABELS = {
  ["tutorial"] = { slug = "tutorial", label = "Tutorial" },
  ["tutorials"] = { slug = "tutorial", label = "Tutorial" },
  ["how-to"] = { slug = "how-to", label = "How-to guide" },
  ["how-to guide"] = { slug = "how-to", label = "How-to guide" },
  ["how-to guides"] = { slug = "how-to", label = "How-to guide" },
  ["reference"] = { slug = "reference", label = "Reference" },
  ["explanation"] = { slug = "explanation", label = "Explanation" },
}

function Meta(meta)
  if meta["diataxis-type"] ~= nil then
    return meta
  end

  local categories = meta["categories"]
  if categories == nil then
    return meta
  end

  if categories.t ~= "List" then
    categories = { categories }
  end

  for _, item in ipairs(categories) do
    local value = pandoc.utils.stringify(item):lower()
    local match = LABELS[value]
    if match then
      meta["diataxis-type"] = pandoc.MetaString(match.slug)
      meta["diataxis-label"] = pandoc.MetaString(match.label)
      break
    end
  end

  return meta
end
