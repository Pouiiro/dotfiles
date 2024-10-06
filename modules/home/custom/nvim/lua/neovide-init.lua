if vim.g.neovide then
  -- Put anything you want to happen only in Neovide here

  -- Set the font family and size correctly
  vim.opt.guifont = 'JetBrains Mono:h16'
  -- (Optional) Set specific fonts for bold, italic, and bold+italic text
  vim.g.neovide_font_bold = 'JetBrains Mono ExtraBold'
  vim.g.neovide_font_italic = 'JetBrains Mono SemiBold Italic'
  vim.g.neovide_font_bolditalic = 'JetBrains Mono ExtraBold Italic'

  vim.opt.linespace = 0
  vim.g.neovide_scale_factor = 1.1

  vim.g.neovide_text_gamma = 0.8
  vim.g.neovide_text_contrast = 0.1

  vim.g.neovide_padding_top = 20
  vim.g.neovide_padding_bottom = 20
  vim.g.neovide_padding_right = 20
  vim.g.neovide_padding_left = 20

  vim.g.neovide_transparency = 0.85
  vim.g.neovide_window_blurred = true
  vim.g.neovide_floating_blur_amount_x = 2.0
  vim.g.neovide_floating_blur_amount_y = 2.0
  vim.g.neovide_floating_shadow = true
  vim.g.neovide_floating_z_height = 10
  vim.g.neovide_light_angle_degrees = 45
  vim.g.neovide_light_radius = 5

  vim.g.neovide_show_border = true
  vim.g.neovide_scroll_animation_length = 0.3
  vim.g.neovide_scroll_animation_far_lines = 9999

  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.neovide_underline_stroke_scale = 2.0
  vim.g.neovide_refresh_rate = 120
  vim.g.neovide_refresh_rate_idle = 30
  vim.g.neovide_no_idle = true
  vim.g.neovide_confirm_quit = false
  vim.g.neovide_fullscreen = false

  vim.g.neovide_cursor_animation_length = 0
  vim.g.neovide_cursor_antialiasing = true
  vim.g.neovide_cursor_animate_command_line = true
  vim.g.neovide_cursor_animate_in_insert_mode = false
  vim.g.neovide_cursor_smooth_blink = true

  vim.api.nvim_create_autocmd('VimEnter', {
    command = 'cd ~/Desktop/dev/',
  })
end
