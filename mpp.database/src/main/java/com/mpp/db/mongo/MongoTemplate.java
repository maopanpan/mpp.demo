package com.mpp.db.mongo;

import com.mongodb.*;
import org.bson.types.ObjectId;

import java.util.*;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ScheduledThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
/**
 * 构建mongodb连接模板
 * <p>
 * Created by maopanpan on 2017/08/07.
 */
public class MongoTemplate {
    // mongo连接池
    private static MongoClient client = null;

    //mongo集合
    public ConcurrentHashMap<String, DBCollection> collectionCache =  new ConcurrentHashMap<String, DBCollection>();
    private ScheduledThreadPoolExecutor schedule = new ScheduledThreadPoolExecutor(2);

    public MongoTemplate(String host, int port) {
        if (client == null) {
            client = new MongoClient(host, port);
        }
        schedule.scheduleAtFixedRate(new HeatBeat(this), 20, 30, TimeUnit.SECONDS);
    }


    public MongoTemplate(String host, int port, int maxConnections) {
        if (client == null) {
            MongoUtil mongoUtil = new MongoUtil(host, port);
            client = mongoUtil.getClient(maxConnections);
        }
        schedule.scheduleAtFixedRate(new HeatBeat(this), 20, 30, TimeUnit.SECONDS);
    }

    /**
     * 创建mongo模版
     * 参数：localhost:27017,localhost:27018,localhost:27019...
     * @param serverAddress 副本集地址
     */
    public MongoTemplate(String serverAddress) {
        String[] mongoAddressArr = serverAddress.split(",");
        List<ServerAddress> seeds = new ArrayList<>();
        for (String address : mongoAddressArr){
            String[] addressArr = address.split(":");
            ServerAddress serverAddr =  new ServerAddress(addressArr[0], Integer.parseInt(addressArr[1]));
            seeds.add(serverAddr);
        }
        if (client == null) {
            client = new MongoClient(seeds);
        }
        schedule.scheduleAtFixedRate(new HeatBeat(this), 20, 30, TimeUnit.SECONDS);
    }

    /***************************************************
     * ||查询||操作
     **************************************************/
    /**
     * 查询dbobject对象列表
     *
     * @param collection 集合对象
     * @param query      查询条件
     * @param projection 返回结果条件
     * @return
     */
    public List<DBObject> find4List(DBCollection collection, DBObject query, DBObject projection) {
        List<DBObject> list = new ArrayList<>();
        DBCursor dbCursor = collection.find(query, projection);
        Iterator<DBObject> iterator = dbCursor.iterator();
        while (iterator.hasNext()) {
            DBObject object = iterator.next();
            list.add(object);
        }
        dbCursor.close();
        return list;
    }

    /**
     * 查询所有结果
     *
     * @param collection
     * @return
     */
    public List<DBObject> find(DBCollection collection) {
        List<DBObject> list = new ArrayList<>();
        DBCursor dbCursor = collection.find();
        Iterator<DBObject> iterator = dbCursor.iterator();
        while (iterator.hasNext()) {
            DBObject object = iterator.next();
            list.add(object);
        }
        dbCursor.close();
        return list;
    }

    /**
     * 查询，以游标方式返回
     *
     * @param collection
     * @param query
     * @param projection
     * @return
     */
    public DBCursor find4DBCursor(DBCollection collection, DBObject query, DBObject projection, int batchSize) {
        List<DBObject> list = new ArrayList<>();
        DBCursor dbCursor = collection.find(query, projection).batchSize(batchSize);
        return dbCursor;
    }

    public DBCursor find4DBCursor(DBCollection collection, DBObject query, int batchSize) {
        List<DBObject> list = new ArrayList<>();
        DBCursor dbCursor = collection.find(query).batchSize(batchSize);
        return dbCursor;
    }

    public DBCursor find4DBCursor(DBCollection collection, int batchSize) {
        List<DBObject> list = new ArrayList<>();
        DBCursor dbCursor = collection.find().batchSize(batchSize);
        return dbCursor;
    }


    /**
     * 查询数量
     *
     * @param collection
     * @param query
     * @return
     */
    public long count(DBCollection collection, DBObject query) {
        long count = collection.count(query);
        return count;
    }

    /***************************************************
     * ||插入||操作
     **************************************************/

    /**
     * 批量插入
     *
     * @param collection   集合对象
     * @param dbObjectList 文档列表
     */
    public void insetBatch(DBCollection collection, List<DBObject> dbObjectList) {
        collection.insert(dbObjectList);
    }

    /**
     * 插入集合
     *
     * @param collection 集合对象
     * @param dbObjects  文档记录
     */
    public void insert(DBCollection collection, DBObject... dbObjects) {
        collection.insert(dbObjects);
    }

    /***************************************************
     * ||插入||操作
     ***************************************************/

    /**
     * 更新文档
     *
     * @param collection 集合
     * @param query      查询条件
     * @param update     更新文档
     * @return
     */
    public boolean update(DBCollection collection, DBObject query, DBObject update) {
        try {
            collection.update(query, update);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public boolean update(DBCollection collection, DBObject query, DBObject update, boolean upsert) {
        try {
            collection.update(query, update, upsert, false);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    /**
     * 批量更新
     * @param collection 集合
     * @param queryArgs 查詢參數列表
     * @param update 更新
     * @return
     */
    public boolean updateBatchId(DBCollection collection, List<ObjectId> queryArgs, DBObject update){

        try {
            DBObject query = new BasicDBObject().append("_id", new BasicDBObject()
                    .append("$in", queryArgs.toArray()));
            collection.update(query, update, false, true);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    /***************************************************
     * mapreduce
     ***************************************************/
    /**
     * 执行mapreduce操作
     *
     * @param collection 集合对象
     * @param command mapreduce指令
     * @return
     */
    public MapReduceOutput mapreduce(DBCollection collection, MapReduceCommand command){
        MapReduceOutput output = collection.mapReduce(command);
        return output;
    }

    /**
     * 删除操作
     * @param collection
     * @param query
     */
    public void remove(DBCollection collection, DBObject query) {
        collection.remove(query);
    }

    /**
     * 判断集合是否存在
     *
     * @param dbName         数据库名称
     * @param collectionName 集合名称
     * @return
     */
    public boolean collectionExists(String dbName, String collectionName) {
        DB db = client.getDB(dbName);
        return db.collectionExists(collectionName);
    }

    /**
     * 查询所有mongodb 集合名称
     * @param dbName 数据库名称
     * @return
     */
    public Set<String> collectionSet(String dbName){
        DB db = client.getDB(dbName);
        return db.getCollectionNames();
    }


    /**
     * 得到dbcollection
     *
     * @param dbName
     * @param collectionName
     * @return
     */
    public DBCollection getDBCollection(String dbName, String collectionName) {
        DB db = client.getDB(dbName);

//        try{
//            db.collectionExists("test");	//这里的数据库名随意
//        } catch(Exception e) {
//            db = client.getDB(dbName);
//            e.printStackTrace();
//        }
        DBCollection collection = collectionCache.get(collectionName);
        if (collection != null){
            return collection;
        }

        collection = db.getCollection(collectionName);
        collectionCache.putIfAbsent(collectionName, collection);
        return collection;
    }

    public ConcurrentHashMap<String, DBCollection> getCollectionCache() {
        return collectionCache;
    }
}
