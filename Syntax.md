# Syntax

## Basics

### Declerations: {type}.new

### Redeclarations: {type}.edit

## Types

- s = string<br>
- i = integer<br>
- f = float<br>
- b = boolean<br>

## Whitespace

- This Notation is heavily based on Whitespace to make reading easier.

## Examples

- s.new name = pvn<br>
- i.new year_created = 2025<br>
- f.new age_in_days = 1.5<br>
- b.new cool = true

## Groups

### Create Groups...

- ...using g.new {group_name} = {type(optional)}

#### Example:

```
g.new names = s
```

### Assign Groups...

- ...using !{group_name} behind your variable value

#### Example:

```
s.new name = PVN !names
```

### Access groups...

- ...using {group_name}.{variable_name}

#### Example:

```
R[names.name]
```

- in this case "R" is a variable holding the returning values of "PVN.read()"

### Attention:

- Do not name the group as the variable.
- They will override each other.
