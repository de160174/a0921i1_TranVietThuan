package com.example.exam.repository;

import com.example.exam.model.Discount;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface DiscountRepository extends JpaRepository<Discount,Integer> {

    Page<Discount> findAllByNameContaining(String author, Pageable pageable);
    Page<Discount> findAllByEndDateContaining(String authour, Pageable pageable);
    Page<Discount> findAllByStartDateContaining(String authour, Pageable pageable);

}