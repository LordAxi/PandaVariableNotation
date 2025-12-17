# PandaVariableNotation

## Syntax

Declerations: {type}.new
Redeclarations: {type}.edit

### Types

s = string<br>
i = integer<br>
f = float<br>
b = boolean<br>

### Whitespace

This Notation is heavily based on Whitespace to make reading easier.

### Examples

s.new name = pnv<br>
i.new year_created = 2025<br>
f.new age_in_days = 1.5<br>
b.new cool = true

## Speed

### Ruby

I measured the speed using 15 million lines of "s.new c = axi" the average time of 50 tests for reading was: 9.756416427019998 seconds.<br>
Then i divided the average by 15 million which is: 0.0000006504277618013332 seconds.<br>
