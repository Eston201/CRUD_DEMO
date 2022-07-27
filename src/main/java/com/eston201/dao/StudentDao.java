package com.eston201.dao;

import com.eston201.entities.Student;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository //Required for spring to component scan and handle exceptions
public class StudentDao implements IStudentDAO {
    @Autowired
    private SessionFactory sessionFactory;

    @Transactional //Leaves springs to handle the beginning and closing of a session transaction
    public List<Student> getStudents() {
        Session session = sessionFactory.getCurrentSession();
        return session.createQuery("from Student").getResultList();
    }

    @Override
    @Transactional
    public Student getStudent(int id) {
        Session session = sessionFactory.getCurrentSession();
        return session.get(Student.class, id);
    }

    @Override
    @Transactional
    public void save(Student student) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(student);
    }

    @Override
    @Transactional
    public void deleteStudent(int id) {
        Session session = sessionFactory.getCurrentSession();
        session.delete(session.get(Student.class, id));
    }
}
