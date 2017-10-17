package com.mpp.serial.impl;

import com.mpp.serial.Serializer;

public class FSTSerializableUtil {
    private static Serializer serializer;

    static {
        serializer = new FSTSerializableImpl();
    }

    public static byte[] serialize(Object... objects) throws Exception {
        if (objects == null && objects.length > 0) return null;
        return serializer.serialize(objects);
    }

    public static Object deserialize(Object... objects) throws Exception {
        if (objects == null && objects.length > 0) return null;
        return serializer.deserialize(objects);
    }
}
