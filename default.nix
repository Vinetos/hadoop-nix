{
  nixpkgs ? <nixpkgs>, system ? builtins.currentSystem
}:

with import nixpkgs { inherit system; };

stdenv.mkDerivation {
  name = "hadoop-shell";
  buildInputs = [
      jdk
      hadoop
      python311
      python311Packages.hdfs
      python311Packages.mrjob
  ];
}
