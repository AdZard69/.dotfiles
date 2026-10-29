"""Minimal Gruvbox workspace bar for Kitty.

Kitty reloads this file with its normal configuration reload.
"""

from kitty.tab_bar import as_rgb


BG = as_rgb(0x1D2021)
PILL = as_rgb(0x282828)
AMBER = as_rgb(0xD8A657)
MUTED = as_rgb(0x928374)
DIM = as_rgb(0x665C54)


def draw_tab(draw_data, screen, tab, before, max_tab_length, index, is_last, extra_data):
    """Draw a compact workspace pill with its index, title and layout."""
    screen.cursor.bg = PILL if tab.is_active else BG
    screen.cursor.fg = AMBER if tab.is_active else MUTED
    screen.cursor.bold = tab.is_active

    marker = "●" if tab.is_active else "·"
    suffix = f"  {tab.layout_name[:3]} · {tab.num_windows}"
    available = max(6, max_tab_length - len(suffix) - 6)
    title = tab.title.strip() or "shell"
    if len(title) > available:
        title = title[: max(1, available - 1)] + "…"

    screen.draw(f"  {marker}  {index:02d}  {title}{suffix}  ")
    end = screen.cursor.x
    screen.cursor.bold = False
    screen.cursor.bg = BG
    screen.cursor.fg = DIM
    if not is_last:
        screen.draw(" ")
    return end
