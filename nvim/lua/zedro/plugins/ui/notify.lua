return {
  'rcarriga/nvim-notify',
  lazy = true,
  opts = {
    background_colour = "#000000",
    fps = 30,
    icons = {
      DEBUG = " ",
      ERROR = " ",
      INFO = "🛈 ",
      TRACE = "✎",
      WARN = " "
    },
    level = 1,
    minimum_width = 20,
    maximum_width = 30,
    render = "compact",
    stages = "fade_in_slide_out",
    time_formats = {
      notification = "%T",
      notification_history = "%FT%T"
    },
    timeout = 200,
    top_down = false,
  }
}
