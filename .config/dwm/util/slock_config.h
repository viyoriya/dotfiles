/* user and group to drop privileges to */
static const char *user  = "nobody";
static const char *group = "nobody";

static const char *colorname[NUMCOLS] = {
	[INIT] =   "black",     /* after initialization */
	[INPUT] =  "#a3be8c",   /* during input */
	[FAILED] = "#b48ead",   /* wrong password */
};

/* treat a cleared input like a wrong password (color) */
static const int failonclear = 1;

static const char * message = "Locked .... ";

/* text color */
static const char * text_color = "#434c5e";

/* text size (must be a valid size) */
static const char * font_name = "-xos4-*-medium-*-*-*-22-*-*-*-*-*-*-*";
