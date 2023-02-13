{
  nixpkgs ? <nixpkgs>, system ? builtins.currentSystem
}:

with import nixpkgs { inherit system; };

stdenv.mkDerivation {
  name = "hadoop-shell";
  src = ./.;
  buildInputs = [
      hadoop
      jdk
      python311
      python311Packages.hdfs
  ];

  shellHook = 
  ''
    echo "Vinetos is watching :ratio:"

    export PDSH_RCMD_TYPE=ssh
  '';
}
