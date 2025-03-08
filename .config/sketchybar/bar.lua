local colors = require("colors").sections.bar

-- Equivalent to the --bar domain
sbar.bar {
  topmost = "all",
  height = 38,
  color = colors.bg,
  padding_right = 4,
  padding_left = 4,
  margin = 0,
  corner_radius = 6,
  y_offset = 0,
  border_color = colors.border,
  border_width = 0,
  blur_radius = 40,
}
