{ ... }:

{
  nix.settings = {
    substituters = [
      "https://nix-qchem.cachix.org"
      "https://cosmic.cachix.org"
    ];

    trusted-public-keys = [
      "nix-qchem.cachix.org-1:ZjRh1PosWRj7qf3eukj4IxjhyXx6ZwJbXvvFk3o3Eos="
      "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE="
    ];
  };
}
