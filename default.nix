{
  nixpkgs ? <nixpkgs>, system ? builtins.currentSystem
}:

with import nixpkgs { inherit system; };

stdenv.mkDerivation {
  name = "hadoop-shell";
  src = ./.;
  buildInputs = [ 
      jdk
      hadoop
      python311
  ];
  shellHook = 
  ''
    echo "Vinetos is watching :ratio:"

    export PDSH_RCMD_TYPE=ssh
  '';
  #  export JAVA_HOME="~/.nix-profile/lib/openjdk/";
  #  export HADOOP_HOME=~/hadoop/
   # export PATH=$PATH:$HADOOP_HOME/bin
 #   export PATH=$PATH:$HADOOP_HOME/sbin
 #   export HADOOP_MAPRED_HOME=$HADOOP_HOME
 #   export YARN_HOME=$HADOOP_HOME
 #   export HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop
 #   export HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_HOME/lib/native
 #   export HADOOP_OPTS="-Djava.library.path=$HADOOP_HOME/lib/native"
 #   export HADOOP_STREAMING=$HADOOP_HOME/share/hadoop/tools/lib/hadoop-streaming-3.2.3.jar
 #   export HADOOP_LOG_DIR=$HADOOP_HOME/logs
}
