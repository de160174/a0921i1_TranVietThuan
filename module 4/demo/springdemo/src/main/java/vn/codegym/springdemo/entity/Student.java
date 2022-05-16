package vn.codegym.springdemo.entity;

import javax.persistence.*;

@Entity
@NamedQueries({
        @NamedQuery(
                name = "findAllByEmail",
                query = "select s from Student s where s.email like :email"
        ),
        @NamedQuery(
                name = "findByPhoneNumber",
                query = "select a from Student a where a.phoneNumber = :phoneNumber"
        )
})
public class Student {
    @Id
    @Column(name = "student_id", columnDefinition = "varchar(10)")
    private String id;

    private String name;
    @Column(name = "class_name")
    private String className;
    private String email;
    private boolean sex;
    @Column(name = "phone_number", columnDefinition = "varchar(10)")
    private String phoneNumber;

    public Student() {
    }

    public Student(String id, String name) {
        this.id = id;
        this.name = name;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public boolean isSex() {
        return sex;
    }

    public void setSex(boolean sex) {
        this.sex = sex;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }
}
