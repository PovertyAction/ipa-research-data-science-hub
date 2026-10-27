--[[
Quarto filter for content images in HTML output.

- Images whose source ends in .mp4 become a muted, looping <video>, so screen
  recordings can be written as ordinary Markdown images:
    ![Create Twilio flow](/assets/images/twilio/twilio-design-5.mp4)
  The image alt text becomes the video's aria-label. `controls` lets readers
  pause the motion (WCAG 2.2.2).
- Other images get loading="lazy" so the browser fetches them only as the
  reader scrolls near them. The first image on a page is skipped because it is
  often visible on load. Images that already set `loading` are left alone.
]]--

local seen = 0

local function escape(s)
  return (s:gsub("&", "&amp;"):gsub('"', "&quot;"):gsub("<", "&lt;"))
end

local function video(img)
  local style = img.attributes["style"] or ""
  if img.attributes["width"] then
    style = "width: " .. img.attributes["width"] .. "; " .. style
  end
  if style ~= "" then
    style = ' style="' .. escape(style) .. '"'
  end
  return pandoc.RawInline("html", string.format(
    '<video src="%s" autoplay loop muted playsinline controls%s aria-label="%s"></video>',
    escape(img.src), style, escape(pandoc.utils.stringify(img.caption))))
end

function Image(img)
  if not quarto.doc.is_format("html") then
    return nil
  end
  if img.src:lower():match("%.mp4$") then
    return video(img)
  end
  seen = seen + 1
  if seen == 1 or img.attributes["loading"] ~= nil then
    return nil
  end
  img.attributes["loading"] = "lazy"
  return img
end
