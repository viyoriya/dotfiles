
static const Block blocks[] = {
	/*Icon*/	/*Command*/		              /*Interval*/	    /*Signal*/
	{ "","~/.config/dwm/blocks/dwm_timer",    		5,		        0	},
	{ "","~/.config/dwm/blocks/dwm_usb",    		5,	        	0	},
	{ "","~/.config/dwm/blocks/dwm_bluetooth",		5,	        	0	},
	{ "","~/.config/dwm/blocks/dwm_network",		5,	        	0	},
	{ "","~/.config/dwm/blocks/dwm_volume",		    5,		        0	},
	{ "","~/.config/dwm/blocks/dwm_memory",		    5,		        0	},
	{ "","~/.config/dwm/blocks/dwm_cpu",	        10,		        0	},
	{ "","~/.config/dwm/blocks/dwm_uptime",		    60,		        0	},
	{ "","~/.config/dwm/blocks/dwm_datetime",		60,		        0	},
    { "","~/.config/dwm/blocks/dwm_ufw",    		30,	        	0	},
};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim[] = " | ";
static unsigned int delimLen = 5;
