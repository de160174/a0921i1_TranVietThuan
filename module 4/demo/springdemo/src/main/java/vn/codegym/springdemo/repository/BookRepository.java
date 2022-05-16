package vn.codegym.springdemo.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import vn.codegym.springdemo.entity.Book;

import java.util.List;

@Repository
public interface BookRepository extends CrudRepository<Book, Integer> {
    List<Book> findAllByName(String name);
    List<Book> findAllByNameContaining(String name);
    List<Book> findAllByNameContainingAndAuthorContaining(String name, String author);

    @Query(value = "select * from Book where price between ?1 and ?2", nativeQuery = true)
    List<Book> findAllByPriceByNativeQuery(long price1, long price2);

    @Query(value = "select b from Book b where b.price >= ?1 and b.price <= ?2")
    List<Book> findAllByPriceByHQL(long price1, long price2);
}
