package com.mpp.db.mongo;

import com.mongodb.DBCollection;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * 构建mongodb连接心中机制
 * <p>
 * Created by maopanpan on 2017/08/07.
 */
public class HeatBeat implements Runnable{
    private MongoTemplate mongo;

    public HeatBeat(MongoTemplate mongo){
        this.mongo = mongo;
    }

    @Override
    public void run() {
        ConcurrentHashMap<String, DBCollection> collectionMap = mongo.getCollectionCache();

        for (Map.Entry<String, DBCollection> entry : collectionMap.entrySet()){
            DBCollection collection = entry.getValue();
            long count = collection.count();
//            System.out.println("【心跳】  collection：" + entry.getKey() + "  集合记录数：" + count);
        }
    }
}
