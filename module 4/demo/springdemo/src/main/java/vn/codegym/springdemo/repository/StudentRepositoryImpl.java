package vn.codegym.springdemo.repository;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import vn.codegym.springdemo.entity.Student;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

@Repository
@Transactional
public class StudentRepositoryImpl implements StudentRepository {
    @PersistenceContext
    EntityManager entityManager;

    @Override
    public void create(Student student) {
        entityManager.persist(student);
    }

    @Override
    public void update(Student student) {
        entityManager.merge(student);
    }

    @Override
    public void delete(String id) {
        Student student = findById(id);
        entityManager.remove(student);
    }

    @Override
    public List<Student> findAll() {
        return entityManager.createQuery("Select s from Student s").getResultList();
    }

    @Override
    public Student findById(String id) {
        return entityManager.find(Student.class, id);
    }

    @Override
    public List<Student> findAllByName(String name) {
        List<Student> results = entityManager
                .createQuery("select s from Student s where s.name like :studentName")
                .setParameter("studentName", "%" + name + "%")
                .getResultList();
        return results;
    }

    public List<Student> findAllByEmail(String email) {
        List<Student> results = entityManager
                .createNamedQuery("findAllByEmail")
                .setParameter("email", "%" + email + "%")
                .getResultList();
        return results;
    }

    public List<Student> findAllByPhoneNumber(String phoneNumber, String name) {
        List<Student> results = entityManager
                .createQuery("select s from Student s where s.phoneNumber = ?1 and s.name like ?2")
                .setParameter(1, phoneNumber)
                .setParameter(2, "%" + name + "%")
                .getResultList();
        return results;
    }
}
