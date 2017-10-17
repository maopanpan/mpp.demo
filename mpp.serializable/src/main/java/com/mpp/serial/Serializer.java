package com.mpp.serial;

import java.io.Closeable;
import java.io.IOException;

public interface Serializer {

    /**
     * 序列化组件名称
     * @return
     */
    String getName();

    /**
     * 序列化
     * @param objects
     * @return
     * @throws Exception
     */
    byte[] serialize(Object... objects) throws Exception;

    /**
     * 反序列化
     * @param objects
     * @return
     * @throws Exception
     */
    Object deserialize(Object... objects) throws Exception;


    default void close(Closeable closeable){
        try {
            closeable.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
