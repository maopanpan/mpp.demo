package com.mpp.serial.impl;

import com.mpp.serial.Serializer;
import de.ruedigermoeller.serialization.FSTObjectInput;
import de.ruedigermoeller.serialization.FSTObjectOutput;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;

public class FSTSerializableImpl implements Serializer {
    public String getName() {
        return "fst";
    }

    public byte[] serialize(Object... objects) throws Exception {
        ByteArrayOutputStream out = null;
        FSTObjectOutput fout = null;
        try {
            out = new ByteArrayOutputStream();
            fout = new FSTObjectOutput(out);
            fout.writeObject(objects[0]);
            return out.toByteArray();
        } finally {
            if (fout != null) {
                close(fout);
                close(out);
            }
        }
    }

    public Object deserialize(Object... bytes) throws Exception {
        if (bytes == null)
            return null;
        FSTObjectInput in = null;
        try {
            in = new FSTObjectInput(new ByteArrayInputStream((byte[]) bytes[0]));
            return in.readObject();
        } finally {
            if (in != null)
                close(in);
        }
    }

    /**
     * 调用样例
     * @param args
     */
    public static void main(String[] args) {
        Serializer ms = new FSTSerializableImpl();
        try {
            byte[] bytes = ms.serialize("中华人民共和国");
            String result = (String) ms.deserialize(bytes);
            System.out.println(result);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
