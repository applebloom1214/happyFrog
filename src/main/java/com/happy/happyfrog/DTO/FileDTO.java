package com.happy.happyfrog.DTO;

import java.util.Objects;

public class FileDTO {
    private String uuid;
    private String uploadPath;
    private String fileName;
    private int bno;

    public FileDTO(){

    }

    public FileDTO(String uuid, String uploadPath, String fileName, int bno) {
        this.uuid = uuid;
        this.uploadPath = uploadPath;
        this.fileName = fileName;
        this.bno = bno;
    }

    @Override
    public String toString() {
        return "FileDTO{" +
                "uuid='" + uuid + '\'' +
                ", uploadPath='" + uploadPath + '\'' +
                ", fileName='" + fileName + '\'' +
                ", bno=" + bno +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        FileDTO fileDTO = (FileDTO) o;
        return bno == fileDTO.bno && Objects.equals(uuid, fileDTO.uuid) && Objects.equals(uploadPath, fileDTO.uploadPath) && Objects.equals(fileName, fileDTO.fileName);
    }

    @Override
    public int hashCode() {
        return Objects.hash(uuid, uploadPath, fileName, bno);
    }

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }

    public String getUploadPath() {
        return uploadPath;
    }

    public void setUploadPath(String uploadPath) {
        this.uploadPath = uploadPath;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public int getBno() {
        return bno;
    }

    public void setBno(int bno) {
        this.bno = bno;
    }
}
