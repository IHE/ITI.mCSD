RuleSet: requireAtLeastOneMatch(path, slice, pattern)
* {path} ^slicing.discriminator.type = #value
* {path} ^slicing.discriminator.path = "$this"
* {path} ^slicing.rules = #open
* {path} contains {slice} 1..1
* {path}[{slice}] = {pattern}
