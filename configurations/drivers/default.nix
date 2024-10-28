{ configType ? "laptop" , ... }:

{
  import = if (configType == "laptop") then
    ./base ./laptop
  else
    ./base ./desktop;
}
