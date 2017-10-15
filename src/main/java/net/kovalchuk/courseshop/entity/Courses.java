package net.kovalchuk.courseshop.entity;

import javax.persistence.*;

@Entity
@Table(name="COURSES")
public class Courses {

        @Id
        @GeneratedValue
        private long id;

        private String nameCourses;
        private int price;
        @Lob
        private String descriptionOfCourses;
        @Lob
        @Column(nullable = true, columnDefinition = "mediumblob")
        private byte[] emblemOfCourcses;


    public Courses(){}

    private Courses(Builder builder) {
        setId(builder.id);
        setNameCourses(builder.nameCourses);
        setPrice(builder.price);
        setDescriptionOfCourses(builder.descriptionOfCourses);
        setEmblemOfCourcses(builder.emblemOfCourcses);
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getNameCourses() {
        return nameCourses;
    }

    public void setNameCourses(String nameCourses) {
        this.nameCourses = nameCourses;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getDescriptionOfCourses() {
        return descriptionOfCourses;
    }

    public void setDescriptionOfCourses(String descriptionOfCourses) {
        this.descriptionOfCourses = descriptionOfCourses;
    }

    public  byte[] getEmblemOfCourcses() {
        return emblemOfCourcses;
    }

    public void setEmblemOfCourcses(  byte[] emblemOfCourcses) {
        this.emblemOfCourcses = emblemOfCourcses;
    }


    public static final class Builder {
        private long id;
        private String nameCourses;
        private int price;
        private String descriptionOfCourses;
        private byte[] emblemOfCourcses;

        public Builder() {
        }

        public Builder id(long val) {
            id = val;
            return this;
        }

        public Builder nameCourses(String val) {
            nameCourses = val;
            return this;
        }

        public Builder price(int val) {
            price = val;
            return this;
        }

        public Builder descriptionOfCourses(String val) {
            descriptionOfCourses = val;
            return this;
        }

        public Builder emblemOfCourcses(byte[] val) {
            emblemOfCourcses = val;
            return this;
        }

        public Courses build() {
            return new Courses(this);
        }
    }
}
