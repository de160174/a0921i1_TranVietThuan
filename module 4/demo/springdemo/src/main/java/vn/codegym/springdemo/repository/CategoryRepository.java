package vn.codegym.springdemo.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import vn.codegym.springdemo.entity.Category;

@Repository
public interface CategoryRepository extends CrudRepository<Category, Integer> {
}
