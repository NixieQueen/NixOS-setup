{ configType ? "laptop" , ... }:

{
  imports = if (configType == "laptop") then
    [./base ./laptop]
  else
    [./base ./desktop];
}
