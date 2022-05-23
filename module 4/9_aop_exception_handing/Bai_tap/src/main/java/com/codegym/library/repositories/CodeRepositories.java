package com.codegym.library.repositories;

import com.codegym.library.model.Code;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CodeRepositories extends JpaRepository<Code, Integer> {
    List<Code> findCodeByBook_Id(Integer id);
    List<Code> findCodeByBook_IdAndStatus_Id(Integer bookId, Integer statusId);
}