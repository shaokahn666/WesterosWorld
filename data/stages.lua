-- Minlevel and multiplier are MANDATORY
-- Maxlevel is OPTIONAL, but is considered infinite by default
-- Create a stage with minlevel 1 and no maxlevel to disable stages
experienceStages = {
	{
		minlevel = 1,
		maxlevel = 100,
		multiplier = 3,
	},
	{
		minlevel = 101,
		maxlevel = 300,
		multiplier = 2,
	},
	{
		minlevel = 301,
		multiplier = 1,
	},
}

skillsStages = {
	{
		minlevel = 0,
		multiplier = 10,
	},
}

magicLevelStages = {
	{
		minlevel = 0,
		multiplier = 10,
	},
}
