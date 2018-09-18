/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.stepup.core.util;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

/**
 *
 * @author phuongtu
 */
public class FileUtil {

    public static void copyDirectory(File sourceDir, File destDir) throws
            IOException {
        if (!destDir.exists()) {
            destDir.mkdir();
        }
        File[] children = sourceDir.listFiles();
        for (File sourceChild : children) {
            String name = sourceChild.getName();
            File destChild = new File(destDir, name);
            if (sourceChild.isDirectory()) {
                copyDirectory(sourceChild, destChild);
            } else {
                copyFile(sourceChild, destChild);
            }
        }
    }

    public static void copyFile(String source, String destDir, String destFile) throws IOException {
        try {
            if (createDirectory(destDir)) {
                copyFile(new File(source), new File(destDir + "/" + destFile));
            }
        } catch (Exception ex) {
            System.out.println("copyFile: " + ex.toString());
        }
    }

    public static void copyFile(String source, String dest) throws IOException {
        try {
            copyFile(new File(source), new File(dest));
        } catch (Exception ex) {
            System.out.println("copyFile: " + ex.toString());
        }
    }

    public static void copyFile(File source, File dest) throws IOException {
        if (!source.exists()) {
            return;
        }
        if (!dest.exists()) {
            dest.createNewFile();
        }
        InputStream in = null;
        OutputStream out = null;
        try {
            in = new FileInputStream(source);
            out = new FileOutputStream(dest);
            byte[] buf = new byte[1024];
            int len;
            while ((len = in.read(buf)) > 0) {
                out.write(buf, 0, len);
            }
        } finally {
            in.close();
            out.close();
        }
    }

    public static boolean delete(String name) throws IOException {
        try {
            File file = new File(name);
            if (file != null && file.exists()) {
                return delete(file);
            }
        } catch (Exception ex) {
            System.out.println("delete: " + ex.toString());
        }
        return false;
    }

    public static boolean delete(File resource) throws IOException {
        if (resource.isDirectory()) {
            File[] childFiles = resource.listFiles();
            for (File child : childFiles) {
                delete(child);
            }
        }
        return resource.delete();
    }

    public static boolean createDirectory(String dir) throws IOException {
        try {
            File dirs = new File(dir);
            if (!dirs.exists()) {
                return dirs.mkdirs();
            } else {
                return true;
            }
        } catch (Exception ex) {
        }
        return false;
    }

    public static BufferedImage resizeImage(BufferedImage originalImage, int type, int width, int height) {
        BufferedImage resizedImage = new BufferedImage(width, height, type);
        Graphics2D g = resizedImage.createGraphics();
        g.drawImage(originalImage, 0, 0, width, height, null);
        g.dispose();
        return resizedImage;
    }

    static public void zipFile(ArrayList arrFileNames, String zipFileName, boolean excludeContainingFolder) throws IOException {
        for (int i = 0; i < arrFileNames.size(); i++) {
            String fileName = arrFileNames.get(i) + "";
            zipFile(fileName, zipFileName, excludeContainingFolder);
        }
    }

    static public void zipFile(String fileToZip, String zipFile, boolean excludeContainingFolder) throws IOException {
        ZipOutputStream zipOut = new ZipOutputStream(new FileOutputStream(zipFile));
        File srcFile = new File(fileToZip);
        if (excludeContainingFolder && srcFile.isDirectory()) {
            for (String fileName : srcFile.list()) {
                addToZip("", fileToZip + "/" + fileName, zipOut);
            }
        } else {
            addToZip("", fileToZip, zipOut);
        }

        zipOut.flush();
        zipOut.close();

        System.out.println("Successfully created " + zipFile);
    }

    static private void addToZip(String path, String srcFile, ZipOutputStream zipOut) throws IOException {
        final int DEFAULT_BUFFER_SIZE = 1024 * 4;
        File file = new File(srcFile);
        String filePath = "".equals(path) ? file.getName() : path + "/" + file.getName();
        if (file.isDirectory()) {
            for (String fileName : file.list()) {
                addToZip(filePath, srcFile + "/" + fileName, zipOut);
            }
        } else {
            zipOut.putNextEntry(new ZipEntry(filePath));
            FileInputStream in = new FileInputStream(srcFile);

            byte[] buffer = new byte[DEFAULT_BUFFER_SIZE];
            int len;
            while ((len = in.read(buffer)) != -1) {
                zipOut.write(buffer, 0, len);
            }
            in.close();
        }
    }
}
