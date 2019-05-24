
if not LSlib.styles then require "styles" else

  function LSlib.styles.addFrameStyle(customFrameSpecifications)
    local guiStyle = data.raw["gui-style"]["default"]
    if not guiStyle then return end

    if (not customFrameSpecifications.name)     or
       guiStyle[customFrameSpecifications.name] then
      return -- already exist
    end

    local defaultFrameStyle = customFrameSpecifications.parent and {} or util.table.deepcopy(guiStyle["frame"])
    -- https://github.com/wube/factorio-data/blob/master/core/prototypes/style.lua#L4187
    local customFrameStyle =
    {
      type                     = "frame_style"                                                                                   ,
      name                     = customFrameSpecifications.name                                                                  ,
      parent                   = customFrameSpecifications.parent                                                                ,

      font                     = customFrameSpecifications.font                     or defaultFrameStyle.font                    ,
      font_color               = customFrameSpecifications.font_color               or defaultFrameStyle.font_color              ,

      left_margin              = customFrameSpecifications.left_margin              or defaultFrameStyle.left_margin             ,
      right_margin             = customFrameSpecifications.right_margin             or defaultFrameStyle.right_margin            ,

      padding                  = customFrameSpecifications.padding                  or defaultFrameStyle.padding                                                     ,
      top_padding              = customFrameSpecifications.top_padding              or ((not customFrameSpecifications.padding) and defaultFrameStyle.top_padding   ),
      bottom_padding           = customFrameSpecifications.bottom_padding           or ((not customFrameSpecifications.padding) and defaultFrameStyle.bottom_padding),
      left_padding             = customFrameSpecifications.left_padding             or ((not customFrameSpecifications.padding) and defaultFrameStyle.left_padding  ),
      right_padding            = customFrameSpecifications.right_padding            or ((not customFrameSpecifications.padding) and defaultFrameStyle.right_padding ),

      graphical_set            = customFrameSpecifications.graphical_set            or defaultFrameStyle.graphical_set           ,

      flow_style               = customFrameSpecifications.flow_style               or defaultFrameStyle.flow_style              ,
      horizontal_flow_style    = customFrameSpecifications.horizontal_flow_style    or defaultFrameStyle.horizontal_flow_style   ,
      vertical_flow_style      = customFrameSpecifications.vertical_flow_style      or defaultFrameStyle.vertical_flow_style     ,

      header_flow_style        = customFrameSpecifications.header_flow_style        or defaultFrameStyle.header_flow_style       ,
      header_filler_style      = customFrameSpecifications.header_filler_style      or defaultFrameStyle.header_filler_style     ,
      use_header_filler        = customFrameSpecifications.use_header_filler        or defaultFrameStyle.use_header_filler       ,

      horizontally_stretchable = customFrameSpecifications.horizontally_stretchable or defaultFrameStyle.horizontally_stretchable,
      vertically_stretchable   = customFrameSpecifications.vertically_stretchable   or defaultFrameStyle.vertically_stretchable  ,

      border                   = customFrameSpecifications.border                   or defaultFrameStyle.border                  ,
    }

    -- add new frame to data
    guiStyle[customFrameSpecifications.name] = util.table.deepcopy(customFrameStyle)
  end

  function LSlib.styles.addFillerFrameStyle()
    local guiStyles = data.raw["gui-style"]["default"]
    local fillerStyle = guiStyles["draggable_space"]

    LSlib.styles.addFrameStyle({
      name   = "LSlib_default_filler_frame",
      parent = "frame"                     ,

      left_margin  = fillerStyle.left_margin ,
      right_margin = fillerStyle.right_margin,

      padding = 0,
      horizontally_stretchable = "on",

      graphical_set = fillerStyle.graphical_set,
    })
  end

end
