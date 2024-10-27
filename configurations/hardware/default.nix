{ configType ? "laptop" , ... }:

{
  imports = if (configType == "laptop") then
    [ /laptop ]
  else
    [ /desktop ];
}
