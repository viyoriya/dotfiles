from ranger.gui.colorscheme import ColorScheme
from ranger.gui.color import *

class Default(ColorScheme):
	def use(self, context):
		fg, bg, attr = default_colors

		if context.reset:
			return default_colors

		elif context.in_browser:
			fg = 245

			if context.selected:
				attr = reverse

			else:
				attr = normal

			if context.empty or context.error:
				attr |= normal
				fg = 245

			if context.border:
				attr |= normal
				fg = 166
				
			if context.media:
				attr |= normal
				
				if context.image:
					fg = 66
					
				else:
					fg = 132
					
			if context.container:
				attr |= normal
				fg = 72
				
			if context.directory:
				attr |= bold
				fg = 66
				
			elif context.executable and not any((context.media, context.container, context.fifo, context.socket)):
				attr |= normal
				fg = 142
				
			if context.socket:
				fg = 132
				
			if context.fifo or context.device:
				fg = 172
				
				if context.device:
					attr |= bold
					
			if context.link:
				fg = context.good and 72 or 132
				
			if context.tag_marker and not context.selected:
				attr |= bold
				
				if fg in (124, 132):
					fg = 245
					
				else:
					fg = 124
					
			if not context.selected and (context.cut or context.copied):
				fg = 132
				attr |= normal
				
			if context.main_column:
				if context.selected:
					attr |= normal
					
				if context.marked:
					attr |= normal
					bg = 235
					fg = 172
					
			if context.badinfo:
				if attr & reverse:
					bg = 132
					
				else:
					fg = 106
					
		elif context.in_titlebar:
			attr |= bold
			fg = 245
			
			if context.hostname:
				fg = 24
				
			elif context.directory:
				attr |= bold
				fg = 66
				
			elif context.tab:
				if context.good:
					bg = 124
					
			elif context.link:
				fg = 66

		elif context.in_statusbar:
			attr |= bold
			fg = 245
			
			if context.permissions:
				if context.good:
					fg = 166
					
				elif context.bad:
					fg = 132
					
			if context.marked:
				attr |= reverse
				fg = 172
				
			if context.message:
				if context.bad:
					fg = 124

		if context.text:
			if context.highlight:
				attr |= reverse

		if context.in_taskview:
			if context.title:
				fg = 66

			if context.selected:
				attr |= reverse

		return fg, bg, attr
