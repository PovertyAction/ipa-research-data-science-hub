--[[
Quarto filter for content images and tables in HTML output.

- Images whose source ends in .mp4 become a muted, looping <video>, so screen
  recordings can be written as ordinary Markdown images:
    ![Create Twilio flow](/assets/images/twilio/twilio-design-5.mp4)
  The image alt text becomes the video's aria-label. `controls` lets readers
  pause the motion (WCAG 2.2.2).
- Figures get their caption as alt text when no fig-alt is set (Quarto
  otherwise leaves the <img> with no alt).
- Other images get loading="lazy" so the browser fetches them only as the
  reader scrolls near them. The first image on a page is skipped because it is
  often visible on load. Images that already set `loading` are left alone.
- Tables get Quarto's `responsive` class, which wraps them in Bootstrap's
  .table-responsive so a wide table scrolls inside its own box instead of
  pushing the whole page sideways on narrow screens.
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
  -- Quarto moves a figure's caption into <figcaption> and leaves the <img>
  -- with no alt at all, which leaves linked figures without a name. Reuse the
  -- caption as fig-alt unless the author set one. Runs at pre-ast (see
  -- _quarto.yml) because Quarto reads fig-alt when it parses figures.
  if #img.caption > 0 and img.attributes["fig-alt"] == nil
      and img.attributes["alt"] == nil then
    img.attributes["fig-alt"] = pandoc.utils.stringify(img.caption)
  end
  seen = seen + 1
  if seen > 1 and img.attributes["loading"] == nil then
    img.attributes["loading"] = "lazy"
  end
  -- always return img: returning nil would discard the fig-alt set above
  return img
end

function Table(tbl)
  if not quarto.doc.is_format("html") or tbl.classes:includes("responsive") then
    return nil
  end
  tbl.classes:insert("responsive")
  return tbl
end
