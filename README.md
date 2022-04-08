# AdventOfCodeInputGetter
A simple way for getting Advent of Code challenges input with Powershell

# How to use it
```1. Clone or download this repository.
2. Run the script loader.ps1
3. Generate your Web Request Powershell object (See Get-AdventOfCodeInput help).
4. Run Get-AdventOfCodeInput function.
```

# See examples by running the command bellow
```Powershell
Get-Help Get-AdventOfCodeInput -Examples
```
# Usage
```Powershell
# Session variable should be loaded to the memory in every new Powershell instance.
# Use $inputData variable as you will to proceed with your challenge solution.
# Attention: Do not name your variable as "$input" because this is a Powershell reserved automatic variable.
$inputData = Get-AdventOfCodeInput -SessionVariable $session -Year 2015 -Day 1
```
