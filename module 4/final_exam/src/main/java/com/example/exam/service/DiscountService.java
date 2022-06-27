package com.example.exam.service;

import com.example.exam.model.Discount;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface DiscountService {
    Page<Discount> findAll(Pageable pageable);
    Page<Discount> findAllByNameContaining(String author, Pageable pageable);
    Page<Discount> findAllByStartDateContaining(String author, Pageable pageable);
    Page<Discount> findAllByEndDateContaining(String author, Pageable pageable);
    void save(Discount discount);
    Discount findById(int id);
    void delete(int id);
}