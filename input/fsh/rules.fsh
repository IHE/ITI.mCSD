RuleSet: requireAtLeastOneMatch(path, slice, value)
* {path} ^slicing.discriminator.type = #value
* {path} ^slicing.discriminator.path = "$this"
* {path} ^slicing.rules = #open
* {path} contains {slice} 1..1
* {path}[{slice}] = {value} 
