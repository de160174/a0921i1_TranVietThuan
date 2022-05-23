package com.codegym.library.repositories;

import com.codegym.library.model.Book;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BookRepositories extends JpaRepository<Book, Integer> {
}