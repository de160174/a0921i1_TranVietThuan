package vn.codegym.springdemo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import vn.codegym.springdemo.entity.Book;
import vn.codegym.springdemo.repository.BookRepository;

import java.util.ArrayList;
import java.util.List;

@Service
public class BookServiceImpl implements BookService {
    @Autowired
    BookRepository bookRepository;
    @Override
    public void create(Book book) {
        bookRepository.save(book);
    }

    @Override
    public void update(Book book) {
        bookRepository.save(book);
    }

    @Override
    public void delete(int id) {
        Book book = bookRepository.findById(id).orElse(null);
        if (book != null) {
            bookRepository.delete(book);
        }
    }

    @Override
    public List<Book> getList() {
        List<Book> books = new ArrayList<>();
        bookRepository.findAll().forEach(b -> books.add(b));
        return books;
    }

    @Override
    public Book findById(int id) {
        return bookRepository.findById(id).orElse(null);
    }

    @Override
    public List<Book> findByName(String name) {
//        return bookRepository.findByNameContains(name);
        return null;
    }

    @Override
    public Page<Book> findAll(Pageable pageable) {
//        return bookRepository.findAll(pageable);
        return null;
    }
}
