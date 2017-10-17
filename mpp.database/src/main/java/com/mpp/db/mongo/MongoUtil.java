package com.mpp.db.mongo;

import com.mongodb.MongoClient;
import com.mongodb.MongoClientOptions;
import com.mongodb.ReadPreference;
import com.mongodb.ServerAddress;
import com.mongodb.WriteConcern;

/**
 * 构建mongodb连接池
 * <p>
 * Created by maopanpan on 2017/08/07.
 */
public class MongoUtil {
    private String host = "localhost";
    private int port = 27017;

    public MongoUtil(String host, int port) {
        this.host = host;
        this.port = port;
    }

    //获取连接池
    public MongoClient getClient() {
        ServerAddress sa = new ServerAddress(host, port);
        return new MongoClient(sa, getConfOptions());
    }

    public MongoClient getClient(int maxConnections) {
        ServerAddress sa = new ServerAddress(host, port);
        return new MongoClient(sa, getConfOptions(maxConnections));
    }

    //mongodb连接池配置
    private MongoClientOptions getConfOptions() {
        return new MongoClientOptions.Builder().socketKeepAlive(true) // 是否保持长链接
                .connectTimeout(10 * 1000) // 链接超时时间
                .socketTimeout(10 * 1000) // read数据超时时间
                .readPreference(ReadPreference.primary()) // 最近优先策略
                .connectionsPerHost(50) // 每个地址最大连接数数
                .maxWaitTime(1000 * 60 * 2) // 长链接的最大等待时间
                .threadsAllowedToBlockForConnectionMultiplier(50) // 一个socket最大的等待请求数
                .writeConcern(WriteConcern.NORMAL)
                .heartbeatFrequency(60 * 1000) //心跳设置
                .heartbeatConnectTimeout(5000)
                .heartbeatSocketTimeout(5000)
                .build();
    }

    private MongoClientOptions getConfOptions(int maxConnections) {
        return new MongoClientOptions.Builder().socketKeepAlive(true). // 是否保持长链接
                connectionsPerHost(maxConnections).
                minConnectionsPerHost(2).
                build();
    }
}
