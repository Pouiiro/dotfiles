{lib, ...}: {
  imports = let
    dirContents = builtins.readDir ./.; # Read all items in the directory
    isNixFile = file: lib.hasSuffix ".nix" file; # Filter only `.nix` files
    excludedFiles = ["default.nix"]; # Files to exclude
    validFiles =
      builtins.filter
      (
        file:
          isNixFile file && !(builtins.elem file excludedFiles)
      )
      (builtins.attrNames dirContents); # Only include valid `.nix` files
  in
    builtins.map (file: import ./${file}) validFiles; # Import each valid file
}
