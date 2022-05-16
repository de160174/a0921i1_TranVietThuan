package vn.codegym.springdemo.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import vn.codegym.springdemo.entity.Book;

import java.util.List;

public interface BookService {
    void create(Book book);
    void update(Book book);
    void delete(int id);
    List<Book> getList();
    Book findById(int id);
    List<Book> findByName(String name);
    Page<Book> findAll(Pageable pageable);
}
