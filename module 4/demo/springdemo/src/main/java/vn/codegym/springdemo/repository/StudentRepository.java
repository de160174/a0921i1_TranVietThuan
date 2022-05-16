package vn.codegym.springdemo.repository;


import vn.codegym.springdemo.entity.Student;

import java.util.List;

public interface StudentRepository {
    void create(Student student);
    void update(Student student);
    void delete(String id);
    List<Student> findAll();
    Student findById(String id);
    List<Student> findAllByName(String name);
}
