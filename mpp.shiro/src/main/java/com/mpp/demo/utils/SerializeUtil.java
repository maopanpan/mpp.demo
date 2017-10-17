package com.mpp.demo.utils;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.Closeable;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;

import de.ruedigermoeller.serialization.FSTObjectInput;
import de.ruedigermoeller.serialization.FSTObjectOutput;
import net.sf.json.JSONObject;


/**
 * 序列化工具
 */
public class SerializeUtil {
    static final Class<?> CLAZZ = SerializeUtil.class;

    public static byte[] serialize(Object value) {
        if (value == null) {
            throw new NullPointerException("Can't serialize null");
        }
        ByteArrayOutputStream out = null;
        FSTObjectOutput fout = null;
        try {
            out = new ByteArrayOutputStream();
            fout = new FSTObjectOutput(out);
            fout.writeObject(value);
            return out.toByteArray();
        } catch (Exception e) {
            LoggerUtils.fmtError(CLAZZ, e, "serialize error %s", JSONObject.fromObject(value));
        } finally {
            if (fout != null)
                try {
                    fout.close();
                } catch (IOException e) {
                }
        }
        return null;
    }


    public static Object deserialize(byte[] in) {
        return deserialize(in, Object.class);
    }

    public static <T> T deserialize(byte[] bytes, Class<T>... requiredType) {
        if (bytes == null || bytes.length == 0)
            return null;
        FSTObjectInput in = null;
        try {
            in = new FSTObjectInput(new ByteArrayInputStream(bytes));
            return (T) in.readObject();
        } catch (Exception e) {
            LoggerUtils.fmtError(CLAZZ, e, "serialize error %s", in);
        } finally {
            if (in != null)
                try {
                    in.close();
                } catch (IOException e) {
                }
        }
        return null;
    }

    private static void close(Closeable closeable) {
        if (closeable != null)
            try {
                closeable.close();
            } catch (IOException e) {
                LoggerUtils.fmtError(CLAZZ, "close stream error");
            }
    }

}
