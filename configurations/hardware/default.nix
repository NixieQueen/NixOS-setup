{ configType ? "laptop" , ... }:

{
  import = if (configType == "laptop") then
    ./laptop
  else
    ./desktop;
}
