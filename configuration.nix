# This is an example of a 'configuration.nix' file to spawn
# a development environment with a postgres 9.0 database and 
# python 2.7 installed.
{ config, pkgs, ...}:
{
    services.hadoop = {
        coreSite = {
            "fs.defaultFS" = "hdfs://localhost:9000";
            "hadoop.proxyuser.dataflair.groups" = "*";
            "hadoop.proxyuser.dataflair.hosts" = "*";
            "hadoop.proxyuser.server.hosts" = "*";
            "hadoop.proxyuser.server.groups" = "*";
        };
        hdfsSite = {
            "dfs.replication" = "1";
        };

        mapredSite = {
            "mapreduce.framework.name" = "yarn";
            #"mapreduce.application.classpath" = "$HADOOP_MAPRED_HOME/share/hadoop/mapreduce/*:$HADOOP_MAPRED_HOME/share/hadoop/mapreduce/lib/*";
        };
        yarnSite = {
            "yarn.nodemanager.aux-services" = "mapreduce_shuffle";
            "yarn.nodemanager.env-whitelist" = "JAVA_HOME,HADOOP_COMMON_HOME,HADOOP_HDFS_HOME,HADOOP_CONF_DIR,CLASSPATH_PREPEND_DISTCACHE,HADOOP_YARN_HOME,HADOOP_MAPRED_HOME";
        };
    };

  environment.systemPackages = with pkgs; [
      hadoop
      jdk
      python311.withPackages hdfs
  ];
}
