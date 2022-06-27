package com.example.exam.service;

import com.example.exam.model.Discount;
import com.example.exam.repository.DiscountRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
public class DiscountServiceImpl implements DiscountService {
    @Autowired
    DiscountRepository discountRepository;

    @Override
    public Page<Discount> findAll(Pageable pageable) {
        return discountRepository.findAll(pageable);
    }

    @Override
    public Page<Discount> findAllByNameContaining(String author, Pageable pageable) {
        return discountRepository.findAllByNameContaining(author,pageable);
    }

    @Override
    public void save(Discount discount) {
        discountRepository.save(discount);
    }

    @Override
    public Discount findById(int id) {
        return discountRepository.findById(id).orElse(null);
    }

    @Override
    public void delete(int id) {
        discountRepository.deleteById(id);
    }

    @Override
    public Page<Discount> findAllByStartDateContaining(String author, Pageable pageable) {
        return discountRepository.findAllByStartDateContaining(author,pageable);
    }

    @Override
    public Page<Discount> findAllByEndDateContaining(String author, Pageable pageable) {
        return discountRepository.findAllByEndDateContaining(author,pageable);
    }
}