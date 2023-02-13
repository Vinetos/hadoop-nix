# Hadoop
  services.hadoop = {
        hbase.master.initHDFS = true;
        hdfs.namenode = {
          enable = true;
          formatOnInit = true;
        };
        hdfs.datanode.enable = true;
        yarn.resourcemanager.enable = true;

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
        };
        yarnSite = {
            "yarn.nodemanager.aux-services" = "mapreduce_shuffle";
            "yarn.nodemanager.env-whitelist" = "JAVA_HOME,HADOOP_COMMON_HOME,HADOOP_HDFS_HOME,HADOOP_CONF_DIR,CLASSPATH_PREPEND_DISTCACHE,HADOOP_YARN_HOME,HADOOP_MAPRED_HOME";
        };
    };
