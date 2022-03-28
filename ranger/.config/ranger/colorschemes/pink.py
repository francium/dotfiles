from __future__ import (absolute_import, division, print_function)

from ranger.colorschemes.snow import Snow
from ranger.gui.color import reverse, bold


class Scheme(Snow):
    def use(self, context):
        fg, bg, attr = super().use(context)

        if context.in_browser:
            if context.directory:
                # Light pink
                fg = 211

        return fg, bg, attr
