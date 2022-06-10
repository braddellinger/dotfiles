from kitty.tab_bar import DrawData, ExtraData, TabBarData, as_rgb
from kitty.fast_data_types import Screen
from kitty.utils import color_as_int
from kitty.rgb import Color


def draw_tab(
    draw_data: DrawData,
    screen: Screen,
    tab: TabBarData,
    before: int,
    max_title_length: int,
    index: int,
    is_last: bool,
    extra_data: ExtraData,
) -> int:
    screen.cursor.fg = as_rgb(color_as_int(Color(147, 216, 147)))
    screen.cursor.bg = as_rgb(color_as_int(Color(23, 32, 40)))
    screen.cursor.italic = False
    screen.cursor.bold = False
    if tab.is_active:
        screen.draw("")
    else:
        screen.draw("")
    screen.cursor.x += 2
    return screen.cursor.x
