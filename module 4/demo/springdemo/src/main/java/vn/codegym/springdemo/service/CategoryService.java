package vn.codegym.springdemo.service;


import vn.codegym.springdemo.entity.Category;

import java.util.List;

public interface CategoryService {
    void create(Category category);
    void delete(int id);
    List<Category> findAll();
    Category findById(int id);
}
